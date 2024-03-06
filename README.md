# Smart Contract Data Manager Sprint 1

## Descripción
Este proyecto incluye un Smart Contract desarrollado en Solidity que permite gestionar diferentes tipos de datos (números, texto, valores booleanos) en la blockchain de Ethereum. Incorpora funciones avanzadas para añadir y consultar datos, además de validaciones de propiedad para asegurar la integridad y seguridad del contrato.

## Características
- **Gestión de Datos:** Capacidad para manejar números, texto y valores booleanos.
- **Seguridad:** Incluye validaciones para asegurar que solo el propietario pueda modificar datos.
- **Interactividad:** Permite la interacción con otros contratos mediante direcciones específicas y su interfaz.

## Requisitos
- [Node.js](https://nodejs.org/en/)
- [Remix](https://remix.ethereum.org/)


## Instalación
Clona este repositorio y navega a la carpeta del proyecto.

git clone https://github.com/richpob/MiPrimerSmartContract
cd MiPrimerSmartContract

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
El código fuente proporcionado en Solidity define un contrato inteligente llamado DataStorage junto con una interfaz IDataStorage. Aquí está la explicación del código:

Licencia y Versión de Solidity
// SPDX-License-Identifier: MIT: Esta línea indica que el código está licenciado bajo la Licencia MIT, permitiendo su uso, modificación y distribución.
pragma solidity ^0.8.7;: Especifica que el contrato se debe compilar con la versión 0.8.7 de Solidity o una versión posterior compatible hasta la versión 0.9.0.
Interfaz IDataStorage
La interfaz IDataStorage declara cuatro funciones que serán implementadas por el contrato DataStorage:

setNumericData(uint _numericData): Para establecer datos numéricos.
setTextData(string calldata _textData): Para establecer datos de texto.
setBooleanData(bool _booleanData): Para establecer datos booleanos.
getAllData(): Para obtener todos los datos almacenados.
Contrato DataStorage
Variables de Estado:

address private owner: Dirección del propietario del contrato.
uint public numericData: Almacena datos numéricos.
string public textData: Almacena datos de texto.
bool public booleanData: Almacena un valor booleano.
Constructor:

Establece el owner del contrato como el creador del mismo usando msg.sender.
Modifier onlyOwner:

Restringe el acceso a ciertas funciones solo al propietario del contrato.
Funciones:

changeOwner(address newOwner): Permite al propietario actual transferir la propiedad del contrato a un nuevo propietario.
setNumericData, setTextData, y setBooleanData: Permiten al propietario modificar los valores de numericData, textData, y booleanData, respectivamente.
getAllData(): Devuelve los valores de numericData, textData, y booleanData.
Este contrato permite al propietario almacenar y recuperar tres tipos de datos (numérico, de texto y booleano) de forma segura, garantizando que solo el propietario pueda modificar los datos almacenados. La función getAllData proporciona una forma conveniente de acceder a todos los datos almacenados en el contrato en una sola llamada.


## Contrato Primario
Primero, definamos nuestro contrato principal y luego el contrato con el que se interactuará. Estos contratos son teórico y para un caso real se debe ajustar según las necesidades y el entorno de implementación específico.
Este contrato PrimaryContract permite al propietario establecer y leer tres tipos de datos: texto, número y booleano. Además, tiene la capacidad de interactuar con otro contrato SecondaryContract (del cual solo se define la interfaz aquí) para agregar y consultar datos numéricos. La función onlyOwner asegura que solo el propietario pueda agregar datos y establecer la dirección del contrato secundario.

### Código fuente
```
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
    address public secondaryContractAddress = address(0x8644d45B3074183fBdA24A044b5EA072B4aB1330); // Supongamos esta es la dirección del contrato secundario

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
```
El código Solidity proporcionado define dos contratos: una interfaz llamada SecondaryContractInterface y un contrato principal llamado PrimaryContract. Aquí está el desglose del código y su funcionalidad:

SPDX-License-Identifier: MIT
Esta línea indica que el contrato se publica bajo la licencia MIT, una licencia de software libre que permite reutilización, modificación y distribución.

pragma solidity ^0.8.0;
Establece que el contrato se compila con la versión 0.8.0 de Solidity o una versión compatible posterior.

Interfaz SecondaryContractInterface
Define una interfaz para interactuar con otro contrato (secundario) que implementa estas funciones. La interfaz tiene dos funciones:

addData(uint _data) external; para agregar datos.
getData() external view returns (uint); para obtener datos.
Contrato PrimaryContract
Variables de Estado: Incluye un propietario (owner), datos de texto (textData), datos numéricos (numberData), y un valor booleano (booleanData). Además, contiene la dirección de un contrato secundario (secondaryContractAddress) con el que interactuará.

Constructor: Establece el creador del contrato como el propietario (owner) al desplegar el contrato.

Modifier onlyOwner(): Asegura que solo el propietario del contrato pueda ejecutar las funciones marcadas con este modificador.

Función setSecondaryContractAddress: Permite al propietario establecer la dirección del contrato secundario.

Interacción con el Contrato Secundario: Las funciones addToSecondaryContract y getFromSecondaryContract permiten agregar y obtener datos del contrato secundario, respectivamente. Esto se logra a través de la interfaz SecondaryContractInterface.

Manejo de Datos Internos: Las funciones addData y readData permiten al propietario agregar y leer datos internos del contrato, respectivamente. addData acepta texto, un número y un valor booleano, mientras que readData devuelve estos valores.

Este contrato demuestra cómo interactuar con otro contrato (a través de una interfaz), la importancia de la propiedad del contrato, y cómo manejar diferentes tipos de datos dentro de un contrato de Solidity.


## Contrato Secundario
Este contrato secundario es bastante simple y solo maneja un dato numérico para ilustrar la interacción entre contratos.

Recuerde desplegar primero el SecondaryContract, obtener su dirección y luego establecerla en el PrimaryContract usando la función setSecondaryContractAddress para permitir la interacción entre ellos. Este ejemplo es básico y se puede expandir o modificar para cumplir con requisitos más específicos o complejos.

### Codigo Fuente
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecondaryContract {
    uint public data;

    function addData(uint _data) external {
        data = _data;
    }

    function getData() external view returns (uint) {
        return data;
    }
}

```
Este código Solidity define un contrato inteligente simple denominado SecondaryContract. Vamos a desglosarlo:

// SPDX-License-Identifier: MIT: Esta es una declaración de licencia que especifica que el código se distribuye bajo la Licencia MIT, una licencia de software libre permisiva que permite la reutilización dentro de software propietario bajo los términos definidos por dicha licencia.

pragma solidity ^0.8.0;: Esta línea especifica la versión del compilador de Solidity que se debe utilizar para compilar este contrato. El símbolo ^ indica que el contrato es compatible con la versión 0.8.0 y todas las versiones menores de 0.9.0.

contract SecondaryContract { ... }: Define un nuevo contrato llamado SecondaryContract.

uint public data;: Declara una variable de estado data de tipo uint (entero sin signo de 256 bits). La palabra clave public hace que Solidity genere automáticamente una función getter para esta variable, permitiendo que su valor sea leído desde fuera del contrato.

function addData(uint _data) external { ... }: Define una función addData que permite a usuarios externos al contrato (es decir, no contratos o llamadas internas) establecer el valor de la variable data. La función toma un argumento _data y actualiza el valor de la variable de estado data con este valor.

function getData() external view returns (uint) { ... }: Define una función getData que permite a usuarios externos consultar el valor actual de la variable data. La palabra clave view indica que esta función no modifica el estado del contrato, y returns (uint) especifica que devuelve un valor de tipo uint.

Este contrato permite almacenar y recuperar un valor entero, ofreciendo una interfaz simple para interactuar con la variable data. 

## Recursos Adicionales
Para estos ejercicios se han usado 2 cuentas de la Testnet Sepolia, que tiene fondos obtenidos con su correspondiente Faucet
### Cuentas SepoliaETH
Account 1: 0x8644d45B3074183fBdA24A044b5EA072B4aB1330
Account 2: 0xF0A31626fEE3b4e54e02dbE0a29B66fDcAB4bbf0


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

## Entorno de Desarrollo propuesto y usado en este proyecto
Para configurar un entorno de desarrollo utilizando Remix, GitHub, GitHub Desktop, y Visual Studio Code como editor, puedes seguir estos pasos generales:

### Paso 1: Configurar Remix IDE
Remix es un entorno de desarrollo integrado (IDE) basado en la web para el desarrollo de contratos inteligentes en Ethereum. No requiere instalación.

Acceder a Remix: Ve a Remix IDE en tu navegador.
Crear/Abrir Proyecto: Puedes comenzar un nuevo proyecto o importar uno existente usando la opción "Load from" en la sección "File explorers".

### Paso 2: Configurar GitHub
GitHub es una plataforma de hospedaje de código para control de versiones y colaboración.
Crear una Cuenta: Si aún no tienes una, crea una cuenta en GitHub.
Crear un Repositorio: En tu perfil de GitHub, selecciona "New repository" para crear uno nuevo y sigue las instrucciones.

### Paso 3: Configurar GitHub Desktop
GitHub Desktop es una aplicación que simplifica el uso de Git y GitHub en tu computadora.
Descargar e Instalar: Descarga GitHub Desktop desde su sitio web e instálalo.
Conectar con GitHub: Inicia sesión con tu cuenta de GitHub.
Clonar el Repositorio: Desde GitHub Desktop, selecciona "Clone a repository from the Internet..." y elige el repositorio que creaste en GitHub.

### Paso 4: Configurar Visual Studio Code
Visual Studio Code es un editor de código fuente ligero pero potente.
Descargar e Instalar: Descarga Visual Studio Code desde su sitio web e instálalo.
Abrir Proyecto: Abre Visual Studio Code y utiliza "File" > "Open Folder..." para abrir el directorio del repositorio clonado con GitHub Desktop.
Instalar Extensiones: Para mejorar tu experiencia de desarrollo, instala extensiones como "Solidity" para soporte de lenguaje Solidity.

### Paso 5: Trabajar con el Proyecto
Ahora que tienes todo configurado, puedes comenzar a trabajar en tu proyecto de contrato inteligente en Remix, guardar tus cambios en archivos locales, y utilizar Visual Studio Code para editarlos.
Desarrollar en Remix: Escribe y prueba tu contrato inteligente en Remix.
Sincronizar con GitHub: Utiliza GitHub Desktop para hacer "commit" de tus cambios y sincronizarlos con tu repositorio en línea.
Editar con Visual Studio Code: Para cambios más significativos o para trabajar en otros aspectos de tu proyecto, usa Visual Studio Code.
Este flujo de trabajo integra el desarrollo de contratos inteligentes con un poderoso control de versiones y un editor flexible, facilitando la colaboración y el seguimiento de cambios en proyectos de blockchain.

### Como integrar Remix con un Repo de GitHub
Les comparto video usado para realizar esta integración : https://www.youtube.com/watch?v=3Qinu26UmZs&t=267s

