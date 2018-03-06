pragma solidity^0.4.0;
import "./SafeMath.sol";
contract bank{
    using SafeMath for uint256;
    address owner;
    mapping (address=>uint256) balances;
    function bank(){
        owner=msg.sender;
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
     function abalance(address owner)public constant returns(uint256){
        return balances[owner];
    }
     function transfer(address to,uint256 amount)public {
        require(amount<=balances[owner] && amount>0);
        balances[owner]=balances[owner].sub(amount);
        balances[to]=balances[to].add(amount);
    }
}
