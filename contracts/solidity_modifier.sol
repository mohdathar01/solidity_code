// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract demo{
modifier onlytrue {
require(false==true,"_a is not equal to true");
_;
}
function check1() public pure onlytrue returns(uint){
return 1;
}
function check2() public pure onlytrue returns(uint){
return 1;
}
function check3() public pure onlytrue returns(uint){
return 1;
}
}
