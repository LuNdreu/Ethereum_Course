pragma solidity 0.6.11;
contract VendingMachine {

    address public owner;
    mapping (address => uint) public cupcakeBalances;

    constructor() public {
        owner = msg.sender;
        cupcakeBalances[address(this)] = 100;
    }


    function refill(uint amount) public {
        require(msg.sender == owner, "Solo il proprietario può ricaricare.");
        cupcakeBalances[address(this)] += amount;
    }


    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "Devi pagare 1 ETH per cupcake.");
        require(cupcakeBalances[address(this)] >= amount, "Prodotto terminato.");
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;
    }
}
