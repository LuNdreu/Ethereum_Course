// SPDX-License-Identifier: MIT

pragma solidity >0.6.0;
contract unNumero {
    address payable private owner;
    uint256 numero;


    constructor() {
        owner = msg.sender;
    }
    function scrivi(uint256 num) public {
        numero = num;
    }
    function leggi() public view returns (uint256){
        return numero;
    }

    function addio() public {
        selfdestruct(owner);
    }
}
