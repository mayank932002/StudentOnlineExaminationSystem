<?php

//soes.php

class soes
{
	public $base_url;
	public $connect;
	public $query;
	public $statement;
	public $now;

	function soes()
	{
		if (file_exists(dirname(__DIR__) . '/install/credential.inc'))
		{
			include(dirname(__DIR__) . '/install/credential.inc');
			try{

				$this->connect = new PDO("mysql:host=$gdb_host;dbname=$gdb_name", $gdb_user_name, $gdb_password);
				
				//$this->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				
				date_default_timezone_set('Asia/Kolkata');

				session_start();

				$this->now = date("Y-m-d H:i:s",  STRTOTIME(date('h:i:sa')));

				$this->base_url = $gbase_url;

				if($this->if_table_exists())
				{
					if($this->if_master_exists())
					{
						return true;
					}
					else
					{
						header('location:'.$gbase_url.'install/set_up_master.php');
					}
				}
				else
				{
					$this->create_table();
					header('location:'.$gbase_url.'install/set_up_master.php');
				}

			}
			catch(PDOException $e){
				header('location:'.$gbase_url.'install/set_up.php');
			}
		}
		else
		{
			$dir_array = explode("/", dirname($_SERVER['PHP_SELF']));
			if(end($dir_array) == 'admin')
			{
				header('location:../install/set_up.php');
			}
			else
			{
				header('location:install/set_up.php');
			}
		}

		
	}

	function execute($data = null)
	{
		$this->statement = $this->connect->prepare($this->query);
		if($data)
		{
			$this->statement->execute($data);
		}
		else
		{
			$this->statement->execute();
		}		
	}

	function row_count()
	{
		return $this->statement->rowCount();
	}

	function statement_result()
	{
		return $this->statement->fetchAll();
	}

	function get_result()
	{
		return $this->connect->query($this->query, PDO::FETCH_ASSOC);
	}

	

	function is_login()
	{
		if(isset($_SESSION['user_id']))
		{
			return true;
		}
		return false;
	}

	function is_master_user()
	{
		if(isset($_SESSION['user_type']))
		{
			if($_SESSION["user_type"] == 'Master')
			{
				return true;
			}
			return false;
		}
		return false;
	}

	function is_student_login()
	{
		if(isset($_SESSION['student_id']))
		{
			return true;
		}
		return false;
	}

	function clean_input($string)
	{
	  	$string = trim($string);
	  	$string = stripslashes($string);
	  	$string = htmlspecialchars($string);
	  	return $string;
	}

	function Get_class_name($class_id)
	{
		$this->query = "
		SELECT class_name FROM class_soes 
		WHERE class_id = '$class_id'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["class_name"];
		}
	}

	function Check_subject_already_added_in_exam($exam_id, $subject_id)
	{
		$this->query = "
		SELECT exam_subject_id FROM subject_wise_exam_detail 
		WHERE exam_id = '$exam_id' 
		AND subject_id = '$subject_id'
		";

		$this->execute();

		if($this->row_count() > 0)
		{
			return true;
		}
		return false;
	}

	function Get_exam_name($exam_id)
	{
		$this->query = "
		SELECT exam_title FROM exam_soes 
		WHERE exam_id = '$exam_id'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["exam_title"];
		}
	}

	function Get_exam_duration($exam_id)
	{
		$this->query = "
		SELECT exam_duration FROM exam_soes 
		WHERE exam_id = '$exam_id'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["exam_duration"];
		}
	}

	function Get_question_option_data($exam_subject_question_id, $option_number)
	{
		$this->query = "
		SELECT question_option_title FROM question_option_soes 
		WHERE exam_subject_question_id = '$exam_subject_question_id' 
		AND question_option_number = '$option_number'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row['question_option_title'];
		}
	}

	function Can_add_question_in_this_subject($exam_subject_id)
	{
		$this->query = "
		SELECT subject_total_question FROM subject_wise_exam_detail 
		WHERE exam_subject_id = '$exam_subject_id'
		";

		$allow_question = 0;

		$result = $this->get_result();
		foreach($result as $row)
		{
			$allow_question = $row["subject_total_question"];
		}

		$this->query = "
		SELECT * FROM exam_subject_question_soes 
		WHERE exam_subject_id = '$exam_subject_id'
		";

		$this->execute();

		$total_question = $this->row_count();

		if($total_question >= $allow_question)
		{
			return false;
		}

		return true;
	}


	function Get_Class_subject($class_id)
	{
		$this->query = "
		SELECT subject_name FROM subject_soes 
		WHERE class_id = '$class_id' 
		AND subject_status = 'Enable'
		";
		$result = $this->get_result();
		$data = array();
		foreach($result as $row)
		{
			$data[] = $row["subject_name"];
		}
		return $data;
	}

	function Get_user_name($user_id)
	{
		$this->query = "
		SELECT * FROM admin_soes 
		WHERE user_id = '".$user_id."'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			if($row['user_type'] != 'Master')
			{
				return $row["user_name"];
			}
			else
			{
				return 'Master';
			}
		}
	}

	function Get_Subject_name($subject_id)
	{
		$this->query = "
		SELECT subject_name FROM subject_soes 
		WHERE subject_id = '$subject_id'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["subject_name"];
		}
	}

	function Get_student_question_answer_option($exam_subject_question_id, $student_id)
	{
		$this->query = "
		SELECT student_answer_option FROM exam_subject_question_answer 
		WHERE exam_subject_question_id = '".$exam_subject_question_id."' 
		AND student_id = '".$student_id."'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["student_answer_option"];
		}
	}

	function Get_question_answer_option($question_id)
	{
		$this->query = "
		SELECT exam_subject_question_answer FROM exam_subject_question_soes 
		WHERE exam_subject_question_id = '".$question_id."' 
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["exam_subject_question_answer"];
		}
	}

	function Get_question_right_answer_mark($exam_subject_id)
	{
		$this->query = "
		SELECT marks_per_right_answer FROM subject_wise_exam_detail 
		WHERE exam_subject_id = '".$exam_subject_id."' 
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["marks_per_right_answer"];
		}
	}
	function Get_question_wrong_answer_mark($exam_subject_id)
	{
		$this->query = "
		SELECT marks_per_wrong_answer FROM subject_wise_exam_detail 
		WHERE exam_subject_id = '".$exam_subject_id."' 
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["marks_per_wrong_answer"];
		}
	}

	function Get_exam_id($exam_code)
	{
		$this->query = "
		SELECT exam_id FROM exam_soes 
		WHERE exam_code = '$exam_code'
		";

		$result = $this->get_result();

		foreach($result as $row)
		{
			return $row['exam_id'];
		}
	}

	function Get_exam_subject_id($exam_subject_code)
	{
		$this->query = "
		SELECT exam_subject_id FROM subject_wise_exam_detail 
		WHERE subject_exam_code = '$exam_subject_code'
		";

		$result = $this->get_result();

		foreach($result as $row)
		{
			return $row['exam_subject_id'];
		}
	}

	function send_email($receiver_email, $subject, $body)
	{
		$mail = new PHPMailer;

		$mail->IsSMTP();

		$mail->Host = 'localhost';

		$mail->Port = '587';

		$mail->SMTPAuth = true;

		$mail->Username = 'onlineexamination@gmail.com';

		$mail->Password = 'mayankpm204';

		$mail->SMTPSecure = 'tls';

		$mail->From = 'onlineexamination@gmail.com';
		
		$mail->FromName = 'onlineexamination@gmail.com';

		$mail->AddAddress($receiver_email, '');

		$mail->WordWrap = 5000;    
		
		$mail->IsHTML(true);

		$mail->Subject = $subject;

		$mail->Body = $body;

		$mail->Send();
	}

	
	function Get_total_classes()
	{
		$this->query = "
		SELECT COUNT(class_id) as Total 
		FROM class_soes 
		WHERE class_status = 'Enable'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["Total"];
		}
	}

	function Get_total_subject()
	{
		$this->query = "
		SELECT COUNT(subject_id) as Total 
		FROM subject_soes 
		WHERE subject_status = 'Enable'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["Total"];
		}
	}

	function Get_total_student()
	{
		$this->query = "
		SELECT COUNT(student_id) as Total 
		FROM student_soes 
		WHERE student_status = 'Enable'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["Total"];
		}
	}

	function Get_total_user()
	{
		$this->query = "
		SELECT COUNT(user_id) as Total 
		FROM admin_soes 
		WHERE user_status = 'Enable'
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["Total"];
		}
	}


	function Get_total_exam()
	{
		$this->query = "
		SELECT COUNT(exam_id) as Total 
		FROM exam_soes 
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["Total"];
		}
	}

	function Get_total_result()
	{
		$this->query = "
		SELECT COUNT(exam_id) as Total 
		FROM exam_soes 
		WHERE exam_result_datetime != '0000-00-00 00:00:00' 
		";
		$result = $this->get_result();
		foreach($result as $row)
		{
			return $row["Total"];
		}
	}

	function if_table_exists()
	{
		$this->query = "
		SHOW TABLES
		";

		$this->execute();

		if($this->row_count() > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
    }

    function create_table()
    {
    	$this->query = "
	    	CREATE TABLE class_soes (
			  class_id int(11) NOT NULL,
			  class_name varchar(250) COLLATE utf8_unicode_ci NOT NULL,
			  class_code varchar(100) COLLATE utf8_unicode_ci NOT NULL,
			  class_status enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
			  class_created_on datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE exam_soes (
			  exam_id int(11) NOT NULL,
			  exam_title varchar(255) COLLATE utf8_unicode_ci NOT NULL,
			  exam_class_id int(11) NOT NULL,
			  exam_duration varchar(30) COLLATE utf8_unicode_ci NOT NULL,
			  exam_status enum('Pending','Created','Started','Completed') COLLATE utf8_unicode_ci NOT NULL,
			  exam_created_on datetime NOT NULL,
			  exam_code varchar(100) COLLATE utf8_unicode_ci NOT NULL,
			  exam_result_datetime datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE exam_subject_question_answer (
			  answer_id int(11) NOT NULL,
			  student_id int(11) NOT NULL,
			  exam_subject_question_id int(11) NOT NULL,
			  student_answer_option enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
			  marks varchar(20) COLLATE utf8_unicode_ci NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE exam_subject_question_soes (
			  exam_subject_question_id int(11) NOT NULL,
			  exam_id int(11) NOT NULL,
			  exam_subject_id int(11) NOT NULL,
			  exam_subject_question_title text COLLATE utf8_unicode_ci NOT NULL,
			  exam_subject_question_answer enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE question_option_soes (
			  question_option_id int(11) NOT NULL,
			  exam_subject_question_id int(11) NOT NULL,
			  question_option_number int(1) NOT NULL,
			  question_option_title text COLLATE utf8_unicode_ci NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE student_soes (
			  student_id int(11) NOT NULL,
			  student_name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
			  student_address tinytext COLLATE utf8_unicode_ci NOT NULL,
			  student_email_id varchar(255) COLLATE utf8_unicode_ci NOT NULL,
			  student_password varchar(100) COLLATE utf8_unicode_ci NOT NULL,
			  student_gender varchar(30) COLLATE utf8_unicode_ci NOT NULL,
			  student_dob date NOT NULL,
			  student_image varchar(255) COLLATE utf8_unicode_ci NOT NULL,
			  student_status enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
			  student_email_verification_code varchar(100) COLLATE utf8_unicode_ci NOT NULL,
			  student_email_verified enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
			  student_added_by varchar(255) COLLATE utf8_unicode_ci NOT NULL,
			  student_added_on datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE student_to_class_soes (
			  student_to_class_id int(11) NOT NULL,
			  class_id int(11) NOT NULL,
			  student_id int(11) NOT NULL,
			  student_roll_no varchar(30) COLLATE utf8_unicode_ci NOT NULL,
			  added_on datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE subject_soes (
			  subject_id int(11) NOT NULL,
			  subject_name varchar(250) COLLATE utf8_unicode_ci NOT NULL,
			  subject_status enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
			  subject_created_on datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE subject_to_class_soes (
			  subject_to_class_id int(11) NOT NULL,
			  class_id int(11) NOT NULL,
			  subject_id int(11) NOT NULL,
			  added_on datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE subject_wise_exam_detail (
			  exam_subject_id int(11) NOT NULL,
			  exam_id int(11) NOT NULL,
			  subject_id int(11) NOT NULL,
			  subject_total_question int(5) NOT NULL,
			  marks_per_right_answer varchar(30) COLLATE utf8_unicode_ci NOT NULL,
			  marks_per_wrong_answer varchar(30) COLLATE utf8_unicode_ci NOT NULL,
			  subject_exam_datetime datetime NOT NULL,
			  subject_exam_status enum('Pending','Started','Completed') COLLATE utf8_unicode_ci NOT NULL,
			  subject_exam_code varchar(100) COLLATE utf8_unicode_ci NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			CREATE TABLE admin_soes (
			  user_id int(11) NOT NULL,
			  user_name varchar(250) COLLATE utf8_unicode_ci NOT NULL,
			  user_contact_no varchar(30) COLLATE utf8_unicode_ci NOT NULL,
			  user_email varchar(250) COLLATE utf8_unicode_ci NOT NULL,
			  user_password varchar(100) COLLATE utf8_unicode_ci NOT NULL,
			  user_profile varchar(150) COLLATE utf8_unicode_ci NOT NULL,
			  user_type enum('Master','User') COLLATE utf8_unicode_ci NOT NULL,
			  user_status enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
			  user_created_on datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			ALTER TABLE class_soes
			  ADD PRIMARY KEY (class_id);
			ALTER TABLE exam_soes
			  ADD PRIMARY KEY (exam_id);
			ALTER TABLE exam_subject_question_answer
			  ADD PRIMARY KEY (answer_id);
			ALTER TABLE exam_subject_question_soes
			  ADD PRIMARY KEY (exam_subject_question_id);
			ALTER TABLE question_option_soes
			  ADD PRIMARY KEY (question_option_id);
			ALTER TABLE student_soes
			  ADD PRIMARY KEY (student_id);
			ALTER TABLE student_to_class_soes
			  ADD PRIMARY KEY (student_to_class_id);
			ALTER TABLE subject_soes
			  ADD PRIMARY KEY (subject_id);
			ALTER TABLE subject_to_class_soes
			  ADD PRIMARY KEY (subject_to_class_id);
			ALTER TABLE subject_wise_exam_detail
			  ADD PRIMARY KEY (exam_subject_id);
			ALTER TABLE admin_soes
			  ADD PRIMARY KEY (user_id);
			ALTER TABLE class_soes
			  MODIFY class_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE exam_soes
			  MODIFY exam_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE exam_subject_question_answer
			  MODIFY answer_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE exam_subject_question_soes
			  MODIFY exam_subject_question_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE question_option_soes
			  MODIFY question_option_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE student_soes
			  MODIFY student_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE student_to_class_soes
			  MODIFY student_to_class_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE subject_soes
			  MODIFY subject_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE subject_to_class_soes
			  MODIFY subject_to_class_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;  
			ALTER TABLE subject_wise_exam_detail
			  MODIFY exam_subject_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
			ALTER TABLE admin_soes
			  MODIFY user_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
    	";
    	$this->execute();
    }

    function if_master_exists()
	{
		$this->query = "
		SELECT * FROM admin_soes 
		WHERE user_type = 'Master' 
		AND user_status = 'Enable'
		";
		$this->execute();
		if($this->row_count() > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}


?>