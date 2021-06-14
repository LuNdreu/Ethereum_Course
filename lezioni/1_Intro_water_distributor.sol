// SPDX-License-Identifier: MIT

pragma solidity 0.6.11;
contract WaterDistributor {

    address public owner;
    address public lastBuyer;

    mapping (address => uint) public distributedWater;

    constructor() public {
        owner = msg.sender;
        distributedWater[address(this)] = 100;
    }


    function refill(uint amount) public {
        require(msg.sender == owner, "Solo il proprietario può ricaricare.");
        distributedWater[address(this)] += amount;
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
