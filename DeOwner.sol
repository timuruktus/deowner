pragma ton-solidity >=0.35.0;
pragma AbiHeader expire;
pragma AbiHeader time;
pragma AbiHeader pubkey;

interface Rule {

    function checkExecutionRule(uint votesFor, uint votesAgainst) external returns(bool);

}

contract DeOwner {
    
    mapping(address => AddressInfo) addressesInfo;

    struct AddressInfo{
        address[] owners;
        Execution[] queue;
        Rule executionRule;
    }

    struct Execution{
        TvmCell messageToSend;
        address[] voters;
        uint votesFor;
        uint votesAgainst;
    }

    function addContractToSystem(address contractAddress, address firstOwner, Rule executionRule) external{
        require(!addressesInfo.exists(contractAddress), 502, "Your address already added");
        Execution[] emptyExecutionQueue;
        addressesInfo[contractAddress] = AddressInfo([firstOwner], emptyExecutionQueue, executionRule);
    }

    // You additionally should send value to this function that
    // equals "value" param in your TvmCell
    function execute(uint numberInQueue, address contractAddress) external{
        // Execute - tvm.sendrawmsg(tvmCell, 0);
        AddressInfo info = addressesInfo[contractAddress];
    }


    function addToExecutionQueue(TvmCell tvmCell, address contractAddress) external{
        require(addressesInfo.exists(contractAddress), 501, "Your contract does not exist in library. Use addContractToSystem function before");
        AddressInfo addressInfo = addressesInfo[contractAddress];
        address[] empty;
        Execution execution = Execution(tvmCell, empty, 0, 0);
        addressInfo.queue.push(execution);
    }

    function addOwners() public{
        //TODO. Clear all queue.
    }

    function deleteOwners() public{
        //TODO
    }
}