/**
 * 
 * Functions
 * 
 * En este ejemplo se puede ver como las funciones se pueden llamar desde otras funciones.
 * Observar que el ámbito de las variables es importante. Las variables definidas al principio
 * del contrato (fuera de las funciones) tienen un ámbito global. Las variables que están definidas
 * dentro de las funciones, al contrario, tienen un ámbito local y no pueden ser llamadas
 * desde fuera de la función en la que están incluidas.
 * 
**/

pragma solidity ^0.4.0;

contract Functions {
    string public text = '';
    int public numberOfChanges = 0;
    
    function changeToHello() {
        numberOfChanges += 1;
        text = 'Hello World';
    }
    
    function callChangeToHello() {
        changeToHello();
        if (numberOfChanges == 2) {
            changeToBye();
        }
    }
    
    function changeToBye() {
        numberOfChanges += 1;
        text = 'Bye!';
    }
}