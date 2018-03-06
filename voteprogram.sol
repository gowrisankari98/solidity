pragma solidity^0.4.0;
contract vote{
    struct s{
        uint256 id;
        string name;
         uint256 co;
         }
    struct publ{
        uint256 pid;
        string pname;
        }
    mapping (uint256=> s)vo;
    mapping (uint256=> publ)voters;
    function candidate(uint256 id,string name)public  {
        vo[id].id=id;
        vo[id].name=name;
    }
    function dispaly(uint256 id)public constant returns(string,uint256){
        return(vo[id].name,vo[id].co);
    }
    function getuser(uint256 pid,string pname, uint256 id)public check(pid) {
        voters[pid].pid=pid;
        voters[pid].pname=pname;
        vo[id].co+=1;
    }
    modifier check(uint256 pid){
        require(voters[pid].pid!=pid);
            _;
        }
    function finishh()public constant returns(string){
        if(vo[1].co>vo[2].co){
                return"candidate 1 wines";
            }
           else if(vo[1].co<vo[2].co)
        {
            return"candidate 2 wines";
        }
        else if(vo[1].co==vo[2].co)                                         
        {
            return "Draw";
        }
        }
    }

