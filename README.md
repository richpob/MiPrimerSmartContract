# Smart Contract Data Manager Sprint 1

## Descripción
Este proyecto incluye un Smart Contract desarrollado en Solidity que permite gestionar diferentes tipos de datos (números, texto, valores booleanos) en la blockchain de Ethereum. Incorpora funciones avanzadas para añadir y consultar datos, además de validaciones de propiedad para asegurar la integridad y seguridad del contrato.

## Características
- **Gestión de Datos:** Capacidad para manejar números, texto y valores booleanos.
- **Seguridad:** Incluye validaciones para asegurar que solo el propietario pueda modificar datos.
- **Interactividad:** Permite la interacción con otros contratos mediante direcciones específicas y su interfaz.

## Requisitos
- [Node.js](https://nodejs.org/en/)
- [Truffle](https://www.trufflesuite.com/)
- [Ganache](https://www.trufflesuite.com/ganache) para un entorno de desarrollo local de Ethereum

## Instalación
Clona este repositorio y navega a la carpeta del proyecto.

git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio

## Primer contrato
Para esta solicitud, crearemos un contrato inteligente en Solidity que cumpla con los requisitos especificados. Este contrato permitirá al propietario (owner) introducir y leer datos de diferentes tipos, incluidos números, texto y valores booleanos. Además, se definirá una interfaz simple para interactuar con el contrato y se incluirán algunas funciones

### Interfaz del Contrato
La interfaz del contrato permitirá interactuar con este desde otro contrato o desde una aplicación. En este caso, proporcionamos un ejemplo de cómo podría verse la interfaz para interactuar con el contrato DataStorage.

Con esta interfaz, cualquier contrato que implemente IDataStorage puede interactuar con DataStorage asumiendo que conoce la dirección del contrato de DataStorage. Esto facilita la separación de la lógica y mejora la composición de contratos inteligentes en aplicaciones más complejas.

Este contrato y su interfaz cumplen con los requisitos básicos de manipulación de datos y restricciones de propiedad. La lógica de negocio o las validaciones adicionales deben ser definidas según las necesidades específicas del proyecto.

##Contrato Primario y Secudario
Para cumplir con los requisitos especificados, podemos diseñar un contrato inteligente en Solidity que maneje diferentes tipos de datos y que incluya una función de validación para asegurarse de que solo el propietario (owner) pueda agregar datos. Además, incluiremos un mecanismo para interactuar con otro contrato inteligente mediante su interfaz.
### Código fuente
```
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
```
### Contrato Primario
Primero, definamos nuestro contrato principal y luego el contrato con el que se interactuará. Estos contratos son teórico y para un caso real se debe ajustar según las necesidades y el entorno de implementación específico.

### Contrato Secundario
Este contrato PrimaryContract permite al propietario establecer y leer tres tipos de datos: texto, número y booleano. Además, tiene la capacidad de interactuar con otro contrato SecondaryContract (del cual solo se define la interfaz aquí) para agregar y consultar datos numéricos. La función onlyOwner asegura que solo el propietario pueda agregar datos y establecer la dirección del contrato secundario.

Este contrato secundario es bastante simple y solo maneja un dato numérico para ilustrar la interacción entre contratos.

Recuerde desplegar primero el SecondaryContract, obtener su dirección y luego establecerla en el PrimaryContract usando la función setSecondaryContractAddress para permitir la interacción entre ellos. Este ejemplo es básico y se puede expandir o modificar para cumplir con requisitos más específicos o complejos.

## URL y Resultados de deploy de los contratos
### Deploy Primer Contrato
#### URL TX
https://sepolia.etherscan.io/tx/0x06b8bf0ffedc0b11f8ab6a0b97193a4c07f546ffb50c662264fa018fe5afb63a

#### URL SmartContract
https://sepolia.etherscan.io/address/0xa25c59b19409128c6cd413da7920fd32b5fa736c

#### Verify and Publish 

https://sepolia.etherscan.io/address/0xa25c59b19409128c6cd413da7920fd32b5fa736c#code

### Deploy Contrato secundario
#### URL TX
https://sepolia.etherscan.io/tx/0xd1f120d83243a8270c6e1140f65aca25035113e6207fc5f3c859aaefd4f649eb

#### URL SmartContract
https://sepolia.etherscan.io/address/0xf8ab70fa2af9a99428d64c2f143e2683f9bdaac1

#### Verify and Publish 
https://sepolia.etherscan.io/address/0x702bf601d77516cc31db66b278f3dcdf7ddaf279#code

### Deploy Contrato Primario
#### URL TX
https://sepolia.etherscan.io/tx/0x8ce93155c7b41fba8e599207bd1b744cedf8636804a635453ee47d22201b3afa

#### URL SmartContract
https://sepolia.etherscan.io/address/0x0e43cbc1e09581fd89cf8d8e5e42e54b826c60ae

#### Verify and Publish 
https://sepolia.etherscan.io/address/0x0e43cbc1e09581fd89cf8d8e5e42e54b826c60ae#code




