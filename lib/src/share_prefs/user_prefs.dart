import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static final UserPrefs _instance = UserPrefs._();

  factory UserPrefs() {
    return _instance;
  }

  UserPrefs._();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int gender) {
    _prefs.setInt('gender', gender);
  }

  get color {
    return _prefs.getBool('color') ?? false;
  }

  set color(bool color) {
    _prefs.setBool('color', color);
  }

  get name {
    return _prefs.getString('name') ?? '';
  }

  set name(String name) {
    _prefs.setString('name', name);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? '/';
  }

  set lastPage(String page) {
    _prefs.setString('lastPage', page);
  }
}
