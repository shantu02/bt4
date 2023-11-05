// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.7;

contract MarksMgmtSys{
    struct Student{
        int ID;
        string fName;
        string lName;
        int marks;
    }

    address owner;
    int public stdCount=0;
    mapping(int => Student) public stdRecords;

    modifier onlyOwner{
        require(owner == msg.sender);
        _;
    }

    constructor(){
        owner=msg.sender;
    }

    function addNewRecords(int _ID, string memory _fName, string memory _lName, int _marks) public onlyOwner{
        stdCount+=1;
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks);
    }

    function bonusMarks(int _bonus) public onlyOwner{
        stdRecords[stdCount].marks = stdRecords[stdCount].marks + _bonus;
    }
}
