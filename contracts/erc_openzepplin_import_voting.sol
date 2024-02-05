// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AtharToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("ATHAR", "ATH") {
        _mint(msg.sender, initialSupply);
    }
}




// deployer of token address 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// address of contact 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8