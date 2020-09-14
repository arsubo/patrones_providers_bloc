import 'dart:async';

import 'package:estados_app/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;

  //para menejar el redibujo y cambio de estados
  StreamController<Usuario> _usuarioStreamController =
      new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    this._usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    this._usuarioStreamController.add(this._usuario);
  }

  dispose(){
    this._usuarioStreamController?.close();
  }
}

final usuarioService = new _UsuarioService();
