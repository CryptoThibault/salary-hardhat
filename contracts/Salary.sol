//SPDX-License-Identifier:MIT
pragma solidity ^0.8.5;

contract Salary {
  address private _owner;
  address private _sender;
  uint private _salary;
  uint private _time;

  constructor(address owner_, address sender_, uint salary_) {
    _owner = owner_;
    _sender  = sender_;
    _salary = salary_;
  }

   modifier onlySender() {
    require(msg.sender == _owner, "Salary: Only sender can call this function");
    _;
  }

  function owner() public view returns (address) {
    return _owner;
  }
   function sender() public view returns (address) {
    return _sender;
  }

  function salary() public view returns (uint) {
    return _salary;
  }

  function changeSalary(uint salary_) public onlySender {
    _salary = salary_;
  }

  function payOwner() public onlySender {
    payable(_owner).transfer(_salary);
  }
}