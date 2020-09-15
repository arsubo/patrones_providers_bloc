import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.bloc<UsuarioCubit>();
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
                      profesiones: [
                        'FullStack Developer',
                        'Video Jugador veterano'
                      ]);
                  //llamamos el cubit extendiendo del bloc
                  usuarioCubit.seleccionaUsuario(newUser);
                },
              ),
              MaterialButton(
                child: Text(
                  ' Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioCubit.cambiarEdad(40);
                },
              ),
              MaterialButton(
                child: Text(
                  'Añador profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioCubit.agregarProfesion();
                },
              ),
            ],
          ),
        ));
  }
}
