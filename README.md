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

### Contrato Primario
Primero, definamos nuestro contrato principal y luego el contrato con el que se interactuará. Estos contratos son teórico y para un caso real se debe ajustar según las necesidades y el entorno de implementación específico.

### Contrato Secundario
Este contrato PrimaryContract permite al propietario establecer y leer tres tipos de datos: texto, número y booleano. Además, tiene la capacidad de interactuar con otro contrato SecondaryContract (del cual solo se define la interfaz aquí) para agregar y consultar datos numéricos. La función onlyOwner asegura que solo el propietario pueda agregar datos y establecer la dirección del contrato secundario.

Este contrato secundario es bastante simple y solo maneja un dato numérico para ilustrar la interacción entre contratos.

Recuerde desplegar primero el SecondaryContract, obtener su dirección y luego establecerla en el PrimaryContract usando la función setSecondaryContractAddress para permitir la interacción entre ellos. Este ejemplo es básico y se puede expandir o modificar para cumplir con requisitos más específicos o complejos.

## URL y Resultados de deploy de los contratos
### Deploy Primer Contrato

### Deploy Contrato secundario

### Deploy Contrato Primario


