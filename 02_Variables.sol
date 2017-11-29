/**
 *
 * Variables
 * 
 * Ejemplo con distintos tipos de variables. Observar como el consumo de gas del despliegue y
 * ejecución del contrato aumenta o disminuye al añadir o quitar variables o cambiar su tamaño
 *
 * Ver tipos posibles de datos en http://solidity.readthedocs.io/en/develop/types.html
 * 
**/

pragma solidity ^0.4.0;

contract Variables {
    
    string public one = 'one';
    string two = 'two';
    int public three = 3;
    uint public four = 4;
    address myAddress = 0x93194EA4B2FeC5B251568EebE18C2274457b0B7a;
}