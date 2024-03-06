// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interfaz del contrato secundario para interactuar con él
interface SecondaryContractInterface {
    function addData(uint _data) external;
    function getData() external view returns (uint);
}

contract PrimaryContract {
    address owner;
    string public textData;
    uint public numberData;
    bool public booleanData;
    address public secondaryContractAddress = address(0x702bf601d77516cc31db66b278f3dcdf7ddaf279); // Supongamos esta es la dirección del contrato secundario

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "No eres el propietario");
        _;
    }

    // Función para establecer la dirección del contrato secundario
    function setSecondaryContractAddress(address _address) public onlyOwner {
        secondaryContractAddress = _address;
    }

    // Funciones para interactuar con el contrato secundario
    function addToSecondaryContract(uint _data) public onlyOwner {
        SecondaryContractInterface(secondaryContractAddress).addData(_data);
    }

    function getFromSecondaryContract() public view returns (uint) {
        return SecondaryContractInterface(secondaryContractAddress).getData();
    }

    // Funciones para manejar datos dentro de este contrato
    function addData(string memory _text, uint _number, bool _boolean) public onlyOwner {
        textData = _text;
        numberData = _number;
        booleanData = _boolean;
    }

    function readData() public view returns (string memory, uint, bool) {
        return (textData, numberData, booleanData);
    }
}
