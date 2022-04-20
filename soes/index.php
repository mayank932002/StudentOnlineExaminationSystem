<?php

//index.php

include('admin/soes.php');

$object = new soes();

if($object->is_student_login())
{
	header("location:".$object->base_url."student_dashboard.php");
}

include('header.php');

?>


		      	<h3 class="text-center">Welcome</h3><br><break>
		      	<p class="text-center"><span style="font-size: 50px;"><b><b><i>For Student Login Click <a href="login.php">here<b></a></p><br>
				  <p class="text-center"><span style="font-size: 50px;"><b>For   Faculty   Login   Click  <a href="admin">here</a></p><br>
				  <p class="text-center"><span style="font-size: 50px;"><b>For   Admin   Login   Click  <a href="admin1">here</a></p>
		      	<div class="container">
				  
			      		<?php
			      		$object->query = "
			      		SELECT * FROM exam_soes 
			      		WHERE exam_result_datetime != '0000-00-00 00:00:00' 
			      		ORDER BY exam_result_datetime ASC
			      		";

			      		$object->execute();

			      		if($object->row_count() > 0)
			      		{
			      			$result = $object->statement_result();
			      			foreach($result as $row)
			      			{
			      				if(time() < strtotime($row["exam_result_datetime"]))
			      				{
			      					echo '<p><b>'.$row["exam_title"].' </b>exam of <b>'.$object->Get_class_name($row["exam_class_id"]).'</b> will publish on '.$row["exam_result_datetime"].'</p>';
			      				}
			      			}
			      		}
			      		else
			      		{
			      			echo '<p></p>';
			      		}



			      		?>
			      		</div>
			      	</div>
			      </div>
		    

<?php

include('footer.php');

?>