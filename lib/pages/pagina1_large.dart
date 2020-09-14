import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
      ),
      body: InformacionUsuarios(),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text('Genera', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
        Divider(),
        ListTile( title: Text('Nombre'),),
        ListTile( title: Text('Edad'),),
        Divider(),
         Text('Profesiones', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
        Divider(),
        ListTile( title: Text('Profesion1'),),
        ListTile( title: Text('Profesion 2'),),
        ListTile( title: Text('Profesion 3'),),
      ],
     ),
    );
  }
}
