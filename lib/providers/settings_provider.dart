import 'package:flutter/material.dart';
import 'package:islami_c9_mon/providers/sharedprefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
    String currentLocale = "en";
    ThemeMode mode = ThemeMode.light;
    SharedPreferences? prefs;
    void initializeSharedpref() async {
    prefs= await SharedPreferences.getInstance();
  }
    String headSebha(){
    if (mode==ThemeMode.light){
      return "assets/images/head of seb7a.png";
    }
    else{
      return "assets/images/head_of_seb7a_dark.png";
    }
  }
    String bodySebha(){
    if (mode==ThemeMode.light){
      return "assets/images/body of seb7a.png";
    }
    else{
      return "assets/images/body_of_seb7a_dark.png";
    }
  }
    void getThemeAndLang(){
    String language=Shared.prefs?.getString("lang")??"en";
    currentLocale=language;
    String theme=Shared.prefs?.getString("theme")??"$mode";
    if(theme=='$mode'){
      mode=ThemeMode.light;
    }
    else{
      mode=ThemeMode.dark;
    }
  }
    void changeTheme(ThemeMode modee){
    mode=modee;
    Shared.prefs?.setString("theme", "$modee");
    notifyListeners();
  }
    void changelang(String lang){
    currentLocale=lang;
    Shared.prefs?.setString("lang", lang);
    notifyListeners();
  }
    void setCurrentMode(ThemeMode newMode){
    mode = newMode;
    notifyListeners();
  }
    bool isDarkEnabled() => mode == ThemeMode.dark;
    void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
}