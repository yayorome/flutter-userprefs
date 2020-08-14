import 'package:flutter/material.dart';
import 'package:user_preferences/src/share_prefs/user_prefs.dart';
import 'package:user_preferences/src/widgets/Drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _color;
  int _gender;
  String _name;
  final prefs = UserPrefs();

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _gender = prefs.gender;
    _color = prefs.color;
    _name = prefs.name;
    prefs.lastPage = 'settings';
    _textEditingController = TextEditingController(text: prefs.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              'Ajustes',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
              title: Text('Color Secundario'),
              value: _color,
              onChanged: _setColor),
          RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _gender,
              onChanged: _setGender),
          RadioListTile(
              title: Text('Femenino'),
              value: 2,
              groupValue: _gender,
              onChanged: _setGender),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: 'Nombre', helperText: 'Nombre de la persona'),
              onChanged: _setName,
            ),
          )
        ],
      ),
    );
  }

  _setGender(int value) {
    prefs.gender = value;
    setState(() {
      _gender = value;
    });
  }

  _setColor(bool value) {
    setState(() {
      _color = value;
      prefs.color = value;
    });
  }

  _setName(String value) {
    prefs.name = value;
    setState(() {
      _name = value;
    });
  }
}
