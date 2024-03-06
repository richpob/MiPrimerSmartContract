// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IDataStorage {
    function setNumericData(uint _numericData) external;
    function setTextData(string calldata _textData) external;
    function setBooleanData(bool _booleanData) external;
    function getAllData() external view returns (uint, string memory, bool);
}

contract DataStorage {
    address private owner;
    uint public numericData;
    string public textData;
    bool public booleanData;

    constructor() {
        owner = msg.sender; // El creador del contrato es el propietario.
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el propietario puede realizar esta accion.");
        _;
    }

    // Función para modificar el propietario.
    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    // Funciones para interactuar con los datos.
    function setNumericData(uint _numericData) public onlyOwner {
        numericData = _numericData;
    }

    function setTextData(string memory _textData) public onlyOwner {
        textData = _textData;
    }

    function setBooleanData(bool _booleanData) public onlyOwner {
        booleanData = _booleanData;
    }

    // Función para consultar todos los datos juntos.
    function getAllData() public view returns (uint, string memory, bool) {
        return (numericData, textData, booleanData);
    }
}


