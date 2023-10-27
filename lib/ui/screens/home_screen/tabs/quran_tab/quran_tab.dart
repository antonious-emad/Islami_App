import 'package:flutter/material.dart';
import 'package:islami_c9_mon/model/sura_details_args.dart';
import 'package:islami_c9_mon/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:islami_c9_mon/ui/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../../providers/settings_provider.dart';

class QuranTab extends StatelessWidget {
  late SettingsProvider settingsProvider;
   QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    settingsProvider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 30,
            child: Image.asset(AppAssets.quranTabLogo)),
         Divider(
         color: settingsProvider.mode==ThemeMode.light?AppTheme.primaryColor:AppTheme.YellowColor,
         // AppColors.primiary,
          thickness: 4,
        ),
        Text(AppLocalizations.of(context)!.sura_name
          ,textAlign: TextAlign.center, style: TextStyle(color: settingsProvider.mode == ThemeMode.light
              ? AppTheme.BlackColor
              : AppTheme.WhiteColor, fontSize: 24,fontWeight: FontWeight.bold),),
        Divider(
          color: settingsProvider.mode==ThemeMode.light?AppTheme.primaryColor:AppTheme.YellowColor,
          // AppColors.primiary,
          thickness: 4,
        ),
        buildSuraNamesList(),
      ],
    );
  }

  buildSuraNamesList() {
    return Expanded(
      flex: 70,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: Constants.suraNames.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                 arguments: SuraDetailsArgs(
                     suraName: Constants.suraNames[index],
                     fileName: "${index+1}.txt", isQuranFile: true));
              },
              child: Text(Constants.suraNames[index],
                textAlign: TextAlign.center,
                style: TextStyle(color: settingsProvider.mode == ThemeMode.light
                    ? AppTheme.BlackColor
                    : AppTheme.WhiteColor, fontSize: 24,fontWeight: FontWeight.bold),
              ),
            );
          },
          separatorBuilder: (_, __){
            return  Divider(
              color: settingsProvider.mode==ThemeMode.light?AppTheme.primaryColor:AppTheme.YellowColor,
              // AppColors.primiary,
              thickness: 4,
            );
          },
         )
    );
  }
}
