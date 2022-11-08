import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

faltaConferente(context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Preencha todos os dados!", style: TextStyle(fontSize: 20),),
  ));
}

erroInteiro(context){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Preencha o campo ERROS com um valor inteiro!", style: TextStyle(fontSize: 20),),
  ));
}