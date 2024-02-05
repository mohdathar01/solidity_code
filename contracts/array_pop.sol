//SPDX-License-Identifier: MIT-3.0
pragma solidity ^0.8.12;
contract Athar{
    uint256 [] public ch;

    function setter(uint256 item )public  {
        ch.push(item);
    }
    
    function getlength()public view returns(uint256) {
        return ch.length;
}
    function arraypop() public  {
        ch.pop();
    }
}