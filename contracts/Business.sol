//SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./Salary.sol";

contract Business {
  mapping(address => Salary) private _salaries;

  function salaryContractOf(address account) public view returns (address) {
    return address(_salaries[account]);
  }

  function deploySalary(address sender, address owner, uint salary) public {
    require(salaryContractOf(owner) == address(0), "Business: user already have salary contract");
    _salaries[owner] = new Salary(sender, owner, salary);
  }
}