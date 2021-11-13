pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

interface Rule {

    function checkExecutionRule(uint votesFor, uint votesAgainst) external returns(bool);

}

contract DeOwner {
    
    mapping(address => AddressInfo) addressInfo;

    struct AddressInfo{
        address[] owners;
        Execution[] queue;
        Rule executionRule;
    }

    struct Execution{
        TvmCell messageToSend;
        mapping(address => bool) votes;

    }

    function addContractToSystem(address contractAddress, address firstOwner, Rule executionRule) external{
        Execution[] empty;
        addressInfo[contractAddress] = AddressInfo([firstOwner], empty, executionRule);
    }

    // You additionally should send value to this function that
    // equals "value" param in your TvmCell
    function execute(TvmCell tvmCell, address contractAddress) external{
        // Execute - tvm.sendrawmsg(tvmCell, 0);
        AddressInfo info = addressInfo[contractAddress];
    }


    function addToExecutionQueue(TvmCell tvmCell, address contractAddress) external{
        Execution newExecution = Execution();
    }

    function addOwners() public{
        //TODO. Clear all queue.
    }

    function deleteOwners() public{
        //TODO
    }
}