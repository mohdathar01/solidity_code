//SPDX-License-Identifier:MIT-3.0
pragma solidity ^0.8.12;
contract Athar1{

    bytes1 public b1;
    bytes2 public b2;
    bytes3 public b3;
    bytes4 public b4;
     
    function setter()public {
        b1='a';
        b2='ab';
        b3='abc';
        b4='bcsd';
    }
    function gettter() public view returns(bytes1){
        return b1;
    }
}
