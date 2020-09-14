import 'package:flutter/material.dart';

import 'package:estados_app/services/usuario_service.dart';
import 'package:estados_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: usuarioService.usuarioStream ,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
              return snapshot.hasData
              ? Text(snapshot.data.nombre)
              :Text('Pagina2');
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final nuevoUsuario = new Usuario(nombre: 'Arnoldo', edad: 39);
                  usuarioService.cargarUsuario(nuevoUsuario);
                },
              ),
              MaterialButton(
                child: Text(
                  ' Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.cambiarEdad(40);
                },
              ),
              MaterialButton(
                child: Text(
                  'Añador profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
