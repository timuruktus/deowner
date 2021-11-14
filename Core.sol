
contract Core{

    address public deOwnerAddress;

    modifier onlyDeOwner(){
        tvm.accept();
        require(msg.sender == deOwnerAddress, 500, "This function executable only from decentralised owner");
        _;
    }
}