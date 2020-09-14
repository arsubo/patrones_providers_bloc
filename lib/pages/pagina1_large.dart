import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:estados_app/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
         return snapshot.hasData
              ? InformacionUsuarios(usuario: usuarioService.usuario)
              : Center(
                  child: Text('No hay informacion del usuario'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
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
            'Profesiones',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Profesion1'),
          ),
          ListTile(
            title: Text('Profesion 2'),
          ),
          ListTile(
            title: Text('Profesion 3'),
          ),
        ],
      ),
    );
  }
}
