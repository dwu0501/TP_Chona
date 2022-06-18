// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante
{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => uint) private notas_materias;
    //vairiables pedidos en la consigna


    //variable auxiliar
    string[] private AuxiliarLenght;

    constructor(string memory nombre_, string memory apellido_, string memory curso_)
    {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
 
    function apellido() public view returns(string memory)
    {
        return _apellido;
    }

    function nombre_completo() public view returns(string memory)
    {
        return string(abi.encodePacked(_nombre, " " , _apellido)); //No te voy a mentir lo saqué de Google
    }

    function curso() public view returns(string memory)
    {
        return _curso;
    }

    function set_nota_materia(uint _nota, string memory materia) public
    {
        require(_docente == msg.sender , "No sos Admin =( "); 
        require(_nota<=100 && _nota>=1, "Pedazo de rayo de sol, no estas dentro del rango =)");
        notas_materias[materia] = _nota;
        AuxiliarLenght.push(materia);

    }

    function nota_materia(string memory materia) public view returns(uint)
    {
        return notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns(bool)
    {
        require(notas_materias[materia]>=60, " Vaya al link=> *https://www.youtube.com/watch?v=u9Dg-g7t2l4* Mejor Suerte la proxima");
        return true;
    }

    function promedio() public view returns(uint)
    {
        uint _CantNotas= AuxiliarLenght.length;
        uint _Nota=0;
        
        for (uint i = 0; i < _CantNotas; i++) {
            
            _Nota += notas_materias[AuxiliarLenght[i]];
        }
        return _Nota/_CantNotas;

    }


}
