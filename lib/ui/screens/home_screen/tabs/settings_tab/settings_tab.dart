import 'package:flutter/material.dart';
import 'package:islami_c9_mon/providers/settings_provider.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}
class _SettingsTabState extends State<SettingsTab> {
  bool arSwitchValue = false;
  bool darkModeSwitchValue = false;
  late SettingsProvider settingsProvider ;

  @override
  Widget build(BuildContext context) {
     settingsProvider = Provider.of(context,);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Text("Settings", style: Theme.of(context).textTheme.titleMedium, ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Switch(
                value: settingsProvider.currentLocale=="ar"? arSwitchValue=true:arSwitchValue=false,
                onChanged: (newValue){
                arSwitchValue = newValue;
                if(arSwitchValue){
                  settingsProvider.setCurrentLocale("ar");
                  settingsProvider.changelang('ar');
                }
                else {
                  settingsProvider.setCurrentLocale("en");
                  settingsProvider.changelang('en');
                }

              },
                activeColor:  settingsProvider.mode==ThemeMode.light?Theme.of(context).primaryColor:AppTheme.YellowColor,
              )
            ],
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Switch(
                value: settingsProvider.mode==ThemeMode.dark? darkModeSwitchValue=true: darkModeSwitchValue=false,
                  onChanged: (newValue){
                darkModeSwitchValue = newValue;
                if(darkModeSwitchValue){
                  settingsProvider.setCurrentMode(ThemeMode.dark);
                  settingsProvider.changeTheme(ThemeMode.dark);
                }
                else {
                  settingsProvider.setCurrentMode(ThemeMode.light);
                  settingsProvider.changeTheme(ThemeMode.light);

                }
              },
                  activeColor:  settingsProvider.mode==ThemeMode.light?Theme.of(context).primaryColor:AppTheme.YellowColor,
              )
            ],
          )
        ],
      ),
    );
  }
}