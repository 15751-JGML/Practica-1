import 'package:flutter/material.dart';
import 'package:practica_uno_parcial_dos/icono_string_util.dart';
import 'package:practica_uno_parcial_dos/menu_provider.dart';
import 'package:practica_uno_parcial_dos/alert_page.dart';
import 'package:practica_uno_parcial_dos/avatar_page.dart';
import 'package:practica_uno_parcial_dos/cards_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica uno',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segundo Parcial"),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listItems(snapshot.data, context));
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
        onTap: () {
          //showDialog(
          //context: context,
          // builder: (BuildContext context) =>
          // _buildPopUpDialog(context, opt['texto']),
          if (opt['ruta'] == 'alert') {
            final route = MaterialPageRoute(builder: (context) => AlertPage());
            Navigator.push(context, route);
          } else if (opt['ruta'] == 'avatar') {
            final route = MaterialPageRoute(builder: (context) => AvatarPage());
            Navigator.push(context, route);
          } else if (opt['ruta'] == 'card') {
            final route = MaterialPageRoute(builder: (context) => CardsPage());
            Navigator.push(context, route);
          } else {
            // _buildPopUpDialog(context, opt['texto']),
          }
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
