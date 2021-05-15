import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  /* Widget build(BuildContext context) {
    return Center(
      child: Text('home temp'),
      );
      }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _crearItemsCorta()),

      /* body: ListaView(
         children: <Widget>[
         //Text('ejemplo textos')
         ListTitle(
           title: Text('ListTitle Title'),
         ),
         Divider(),
         ListTitle(
           title: Text('ListTitle Title'),
         ),
         Divider()
         ],
        ),*/
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      //var widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!!'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
