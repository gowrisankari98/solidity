pragma solidity ^0.4.0;
import "./SafeMath.sol";
import "./ERC20Basic.sol";
contract valtoken is ERC20Basic{
    using SafeMath for uint256;
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalsupply;
    address owner;
     mapping(address => mapping(address => uint256)) allowed;
    mapping(address=>uint256)balances; 
    function valtoken() {
      owner=msg.sender;
        name="token";
        symbol="GO";
        decimals=0;
        totalsupply=6000000;
        balances[owner]=totalsupply;
    
      
    } 
     function balanceOf(address owner) public constant returns (uint256){
        return balances[owner];
    }
   function totalSupply() public view returns(uint256)
    {
        return totalsupply;
    }
     modifier check(){
        require (msg.sender==owner);
        _;
    }
     function deposit(uint256 amount)public check(){
        balances[owner]=balances[owner].add(amount);
    }
 function withdraw(uint256 amount)public check(){
        balances[owner]=balances[owner].sub(amount);
    }
     
    function transfer(address to,uint256 value) public returns (bool) {
            require(to != address(0));
    require(value <= balances[msg.sender]);
        balances[msg.sender]=balances[msg.sender].sub(value);
        balances[to]=balances[to].add(value);
            Transfer(msg.sender, to, value);
        return true;
    }
    function transferFrom(address _from,address _to,uint256 _value) returns(bool success) {
         require(balances[_from] >= _value);
         require( _value > 0 );
         require( allowed[_from][_to] >= _value);
         {
             
             balances[_from] -= _value;
             balances[_to] += _value;
             allowed[_from][_to] -= _value;
             Transfer(_from,_to,_value);
             return true;
         }
    }
    function approve(address _spender,uint256 _value) returns(bool success){
         allowed[msg.sender][_spender] = _value;
         Approval(msg.sender,_spender,_value);
         return true;
     }
     
     function allowance(address _owner,address _spender) constant returns(uint256 remaining){
         return allowed[_owner][_spender];
     }
}
