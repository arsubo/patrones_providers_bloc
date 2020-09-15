import 'package:flutter/material.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:provider/provider.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    //Enviará un mensaje a todos los widgets que usan el provider
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    this
        ._usuario
        .profesiones
        .add('Profesion ${this._usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
