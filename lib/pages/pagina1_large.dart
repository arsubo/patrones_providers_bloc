import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.bloc<UsuarioCubit>().borrarUsuario();
              })
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInit:
            return Center(child: Text('No hay información del usuario'));
            break;
          case UsuarioActivo:
            return InformacionUsuarios(
                usuario: (state as UsuarioActivo).usuario);
            break;
          default:
            return Center(child: Text('Estado no reconocido'));
        }
        //si no quieres usuar if
        //   if (state is UsuarioInit) {
        //     //está en el estado inicial no ha cargado nada
        //     return Center(child: Text('No hay información del usuario'));
        //   } else if (state is UsuarioActivo) {
        //     return InformacionUsuarios(usuario: state.usuario);
        //   } else {
        //     return Center(child: Text('Estado no reconocido'));
        //   }
      },
    );
  }
}

class InformacionUsuarios extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuarios({this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Genera',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Divider(),
          Text(
            'Profesion',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
