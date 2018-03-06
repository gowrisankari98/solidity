pragma solidity ^0.4.0;

contract ERC20Basic {
 function  deposit(uint256 amount)public;
 function withdraw(uint256 amount)public;
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  function totalSupply() public view returns(uint256);
   function approve(address _spender, uint256 _value) returns (bool success) {}
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}
     function transferFrom(address _from,address _to,uint256 _value) returns(bool success){}
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
  event Transfer(address indexed from, address indexed to, uint256 value);
}
