<?php

function is_number_even($number){
  return substr(decbin($number), -1) == '0';
}
