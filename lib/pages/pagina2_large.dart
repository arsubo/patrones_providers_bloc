import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_app/bloc/usuario/usuario_bloc.dart';
import 'package:estados_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina2'),
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
                  final newUser = new Usuario(
                      nombre: 'Arnoldo Suárez',
                      edad: 39,
                      profesiones: ['Fullstack developer']);
                  usuarioBloc.add(ActivarUsuario(newUser));
                },
              ),
              MaterialButton(
                child: Text(
                  ' Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioBloc.add(CambiarEdad(40));
                },
              ),
              MaterialButton(
                child: Text(
                  'Añador profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioBloc.add(AgregarProfesion());
                },
              ),
            ],
          ),
        ));
  }
}
