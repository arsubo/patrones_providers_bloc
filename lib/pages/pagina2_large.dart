import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estados_app/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
        appBar: AppBar(
          title: usuarioService.existeUsuario
              ? Text('Usuario: ${usuarioService.usuario.nombre}')
              : Text('Pagina2'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: usuarioService.existeUsuario
                  ? () => usuarioService.removerUsuario()
                  : null,
            )
          ],
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
                  final usuarioProvider =
                      Provider.of<UsuarioService>(context, listen: false);
                  final newUser = new Usuario(
                      nombre: 'Arnoldo',
                      edad: 39,
                      profesiones: [
                        'Fullstack developer',
                        'Video jugador experto'
                      ]);
                  usuarioProvider.usuario = newUser;
                },
              ),
              MaterialButton(
                child: Text(
                  ' Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: usuarioService.existeUsuario
                    ? () {
                        usuarioService.cambiarEdad(40);
                      }
                    : null,
              ),
              MaterialButton(
                child: Text(
                  'Añador profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  usuarioService.agregarProfesion();
                },
              ),
            ],
          ),
        ));
  }
}
