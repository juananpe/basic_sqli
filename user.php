<?php

error_reporting(E_ALL);
ini_set('display_errors', true);
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);


include("connection.php");

// Connect to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect post data without sanitization
    $input_username = $_POST['username'];
    $input_password = $_POST['password'];

    // SQL query with direct insertion of user input
    $sql = "SELECT id, username, email FROM users WHERE username = '$input_username' AND password = '$input_password'";

    // Execute the query
    $result = $conn->query($sql);

    $response = [];
    if ($result && $result->num_rows > 0) {
        // Fetch data
        $row = $result->fetch_assoc();
	$response["message"] = "Hello " . $row['username'] . ". Successful Authentication";
    } else {
        $response["error"] = "User not found";
    }
} else {
      $response["error"] = "Invalid request method";
}

$conn->close();

echo json_encode($response);

?>

