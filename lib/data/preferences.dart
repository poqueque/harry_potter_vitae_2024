import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  SharedPreferences? sharedPreferences;

  bool showSubtitles = true;

  Preferences() {
    init();
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    showSubtitles = sharedPreferences!.getBool('show_subtitles') ?? true;
    notifyListeners();
  }

  setShowSubtitles(bool value) {
    showSubtitles = value;
    sharedPreferences!.setBool('show_subtitles', value);
    notifyListeners();
  }
}
