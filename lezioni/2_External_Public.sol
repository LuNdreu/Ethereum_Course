// SPDX-License-Identifier: MIT

pragma solidity 0.6.11;
contract WaterDistributorPublExt {

    address public owner;
    address public lastBuyer;

    mapping (address => uint) public distributedWater;

    constructor() public {
        owner = msg.sender;
        distributedWater[address(this)] = 100;
    }


    function refillExt(uint amount) external returns(uint) {
        require(msg.sender == owner, "Solo il proprietario può ricaricare.");
        amount=amount*2;
        return amount;
    }

    function refillPub(uint amount) public returns(uint) {
        require(msg.sender == owner, "Solo il proprietario può ricaricare.");
        amount=amount*2;
        return amount;
    }


    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "Devi pagare 1 ETH per litro di acqua.");
        require(distributedWater[address(this)] >= amount, "Prodotto terminato.");
        distributedWater[address(this)] -= amount;
        distributedWater[msg.sender] += amount;
        lastBuyer=msg.sender;
    }

    function waterAvailable() public view returns (uint available) {
        available = distributedWater[address(this)];
    }

}
