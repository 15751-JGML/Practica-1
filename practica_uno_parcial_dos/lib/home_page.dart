import 'package:practica_uno_parcial_dos/alert_page.dart';
import 'package:practica_uno_parcial_dos/menu_provider.dart';
import 'package:practica_uno_parcial_dos/icono_string_util.dart';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('practica_uno_parcial_dos'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );

    //menuProvider.cargarData().then((opciones)  {
    //  print(opciones);
    //});

    //print(menuProvider.opciones);
    // return ListView(
    // children: _listaItems(),
    //);
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.lightBlueAccent,
        ),
        onTap: () {
          //showDialog(
          // context: context,
          // builder: (BuildContext context) => _buildPopUpDialog(context, opt['texto']),
          // );

          // final route = MaterialPageRoute(builder: (context) {
          // return AlertPage();
          // });

          final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;

    //return [
    // ListTile(title: Text('Hola que tal')),
    //Divider(),
    // ListTile(title: Text('Hola que tal')),
    //Divider(),
    // ListTile(title: Text('Hola que tal')),
    //Divider(),
    //];
  }

  Widget _buildPopUpDialog(BuildContext context, String opt) {
    return new AlertDialog(
      title: const Text('Me diste click'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hola soy la opcion' + opt),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
