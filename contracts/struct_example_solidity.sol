//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.12;
 //struct
contract Athar4{
    struct student{
        uint256 rollno;
        string name;
        //string course;
        //uint256 class;
    }
    student public s1;
    constructor(uint256 _rollno,string memory _name )  {
         s1.rollno=_rollno;
         s1.name=_name;
        // s1.course=_course;
         //s1.class=_class;
    }
    function change(uint256 _rollno,string memory _name)public  {
        student memory new_student=student({
            rollno : _rollno,
            name: _name
        });
        s1 = new_student;
    }
    function newstruct() public view returns(student memory ){
        return s1;
    }


}