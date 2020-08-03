pragma  solidity 0.5.16;
contract Supplychain{
    address public manufacturerAddress;

    constructor() public{
        manufacturerAddress=msg.sender;
    }
    modifier onlyManufacturer(){
        require(msg.sender==manufacturerAddress);
        _;
    }
    struct Manufacturer{
        address _mfgAddress;
        bytes32 _mfgName;
        bytes32 _mfgLocation;
    }
    Manufacturer[] manufacturer;
    mapping (address=>Manufacturer) mfgAddressList;

    function addManufacturer(address _mfgAddress,bytes32 _mfgName,bytes32 _mfgLocation) public onlyManufacturer(){
        Manufacturer memory _manufacturer = Manufacturer(_mfgAddress,_mfgName,_mfgLocation);
        manufacturer.push(_manufacturer);
        mfgAddressList[_mfgAddress] = _manufacturer;
    }
    function verifyManufacturer(address verifyMfgAddress) public view returns(address _mfgAddress,bytes32 _mfgName,bytes32 _mfgLocation){
        
        for (uint i;i<manufacturer.length;i++){
            if(manufacturer[i]._mfgAddress==verifyMfgAddress){
                return(manufacturer[i]._mfgAddress,
                        manufacturer[i]._mfgName,
                        manufacturer[i]._mfgLocation);
            }
        }
    }
}

    





