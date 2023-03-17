<?php
// Establish a connection to the MySQL database
$servername = "localhost";
$username = "yourusername";
$password = "yourpassword";
$dbname = "yourdatabase";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check if the form was submitted
if ($_POST) {
    // Get the color value from the form
    $color = $_POST['color'];

    // Insert the color value into the database
    $sql = "INSERT INTO color_votes (color) VALUES ('$color')";
    if (mysqli_query($conn, $sql)) {
        echo "<p>Thanks for voting!</p>";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

// Close the MySQL connection
mysqli_close($conn);
?>
