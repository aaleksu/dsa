<?php


/*
 * Great common divisor; Euclid algorithm
 */
function gcd($a, $b){
    if($b == 0) {
        return $a;
    }

    return gcd($b, ($a % $b));
}

try {
    if(!isset($argv[1]) || !isset($argv[2])) {
        throw new Exception("Not enough arguments");
    }
    
    printf("\nGCD for %d and %d is: %d\n\n", $argv[1], $argv[2], gcd($argv[1], $argv[2]));
}
catch(Exception $e) {
    printf("\nError: %s\n\n", $e->getMessage());
}
