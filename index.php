<?php
set_include_path('/var/www/');

if (!array_key_exists("phone", $_GET)) {
    header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found");
    exit;
}

require "vendor/autoload.php";
require "classes/PhoneLookUp.php";

header('Content-Type: application/json; charset=utf-8');
setlocale(LC_ALL, "en_US.UTF-8");

$phone = htmlspecialchars($_GET["phone"]);
$data = new PhoneLookUp($phone);
echo json_encode($data->lookup(), JSON_UNESCAPED_UNICODE);
