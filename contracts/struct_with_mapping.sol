//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.12;
 //how we can store data in mapping
contract Athar5{
    struct student{
        uint rollno;
        string name;
    }
    student  s1;
    mapping(string=>student)public student_data;
     
      
      function setter(string memory _class,  uint _rollno,string memory _name)public {
        student_data[_class]=student(_rollno,_name);
      }
      function showtiming() public view returns(uint256){
         return block.number;
      }
}