<?php
function randomPassword()
{
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

function addRandomPassword() {
    //
}

// try generate a code
// while queryable, keep redoing it
// insert the result to db
$table = "coupon";
$query_empty_coupon = "SELECT * from $table WHERE length(coupon) < 8;";

for ($i = 0; $i < 20; $i++) {
    print(randomPassword());
    print("\n");
}

?>

