<?php 
    require "../../config/config.php";


    if(isset($_GET['id'])) {


        $id = $_GET['id'];

        $getImage = $conn->query("SELECT * FROM hotels WHERE id='$id'");
        $getImage->execute();

        $fetch = $getImage->fetch(PDO::FETCH_OBJ);

        unlink("hotel_images/" . $fetch->image);


        $delete = $conn->query("DELETE FROM hotels WHERE id='$id'");
        $delete->execute();

        header("location: show-hotels.php");
    }