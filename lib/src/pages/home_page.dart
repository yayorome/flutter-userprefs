import 'package:flutter/material.dart';
import 'package:user_preferences/src/share_prefs/user_prefs.dart';
import 'package:user_preferences/src/widgets/Drawer_widget.dart';

class HomePage extends StatelessWidget {
  final prefs = UserPrefs();
  @override
  Widget build(BuildContext context) {
    prefs.lastPage = '/';
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.color) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario ${prefs.color}'),
          Divider(),
          Text('Genero: ${prefs.gender}'),
          Divider(),
          Text('Usuario: ${prefs.name} '),
          Divider(),
        ],
      ),
    );
  }
}
