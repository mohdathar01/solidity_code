//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.12;
// byte size array in dynamic array 
contract Athar3{
    bytes public b1='abcdefghjishsjdhak';

    function pushelements() public {
        b1.push('p');
    }
    function popelements() public  {
        b1.pop();
        
    }
    function checklength() public view returns(uint) {
        return  b1.length;
    }
}