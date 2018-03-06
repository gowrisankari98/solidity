pragma solidity^0.4.0;
contract hr{
    
    mapping (uint256=>s)candidates;
    struct s{
        uint256 date;
        string name;
        uint256 id;
    }
    
    function interview (uint256 id,string name, uint256 date)public {
        candidates[id].id=id;
        candidates[id].name=name;
        candidates[id].date=date;
    }
    
    function dispaly(uint256 id)public constant returns(string,uint256){
        return(candidates[id].name,candidates[id].date);
    }
    function check(uint256 id)public constant returns(string){
    require(candidates[id].id!=id);
        return("new candidate");
        
    }   
 }
