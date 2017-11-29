/**
 * 
 * String Utils
 * 
 * Ejemplo de uso de la librería externa solidity-stringutils alojada en GitHub. 
 * Solidity carece de funciones básicas para el tratamiento de cadenas que podemos 
 * solventar utilizando esta librería.
 *
 * Doc: https://github.com/Arachnid/solidity-stringutils
 * 
**/

pragma solidity ^0.4.0;

import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract StringUtils {
    using strings for *;
	
	/**
	 *	Getting the character length of a string
     */
	var len = "Unicode snowman ☃".toSlice().len(); // 17
	
	/**
	 *	Splitting a string around a delimiter
     */
	var s = "foo bar baz".toSlice();
	var foo = s.split(" ".toSlice());
	
	/**
	 *	Splitting a string into an array
     */	
	var s = "www.google.com".toSlice();
	var delim = ".".toSlice();
	var parts = new string[](s.count(delim) + 1);
	for(uint i = 0; i < parts.length; i++) {
		parts[i] = s.split(delim).toString();
	}
	
	/**
	 *	Extracting the middle part of a string
     */	
	var s = "www.google.com".toSlice();
	strings.slice memory part;
	s.split(".".toSlice(), part); // part and return value is "www"
	s.split(".".toSlice(), part); // part and return value is "google"
	
	/**
	 *	Converting a slice back to a string
     */
	var myString = mySlice.toString();
	
	
	/**
	 *	Finding and returning the first occurrence of a substring
     */
	var s = "A B C B D".toSlice();
	s.find("B".toSlice()); // "B C B D"
	
	
	/**
	 *	Finding and returning the last occurrence of a substring
     */
	var s = "A B C B D".toSlice();
	s.rfind("B".toSlice()); // "A B C B"
	
	
	/**
	 *	Finding without modifying the original slice.
     */
	var s = "A B C B D".toSlice();
	var substring = s.copy().rfind("B".toSlice()); // "A B C B"
	
	
	/**
	 *	Prefix and suffix matching
     */
	var s = "A B C B D".toSlice();
	s.startsWith("A".toSlice()); // True
	s.endsWith("D".toSlice()); // True
	s.startsWith("B".toSlice()); // False
	
	
	/**
	 *	Removing a prefix or suffix
     */
	var s = "A B C B D".toSlice();
	s.beyond("A ".toSlice()).until(" D".toSlice()); // "B C B"
	
	
	/**
	 *	Finding and returning the string up to the first match
     */
	var s = "A B C B D".toSlice();
	var needle = "B".toSlice();
	var substring = s.until(s.copy().find(needle).beyond(needle));
	
	
	/**
	 *	Concatenating strings
     */
	var s = "abc".toSlice().concat("def".toSlice()); // "abcdef"
}