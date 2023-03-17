<?php
		if ($_POST) {
			$color = $_POST['color'];
			$file = fopen("index.html", "a");
			fwrite($file, "$color\n");
			fclose($file);
			echo "<p>Thanks for voting!</p>";
		}
	?>