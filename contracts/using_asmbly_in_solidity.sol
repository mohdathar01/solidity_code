// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

// contract A{
    
//     function addtwov() public pure returns(uint256){
//      uint256 aa;
//         assembly {
//             let q := 10
//             let w := 20
//             aa := add(q,w)
//         }
//         return aa;
//     }
// }
 
pragma solidity ^0.8.20;

contract A{
    
    function addtwov() public pure returns(uint256){
     uint256 aa=10;
     uint256 bb=12;
     uint256 cc=aa+bb;
        
        return cc;
    }
}