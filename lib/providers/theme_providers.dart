import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProviders extends StateNotifier<bool>{
  ThemeProviders(): super(false);

  void toggleTheme() async {
    state=!state;
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setBool('appThemeValue', state);
  }

    Future getAppTheme() async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    final bool? appTheme = prefs.getBool('appThemeValue');
    state= appTheme??false;
  }
}


final themeProvider = StateNotifierProvider<ThemeProviders,bool>((ref)=>ThemeProviders());