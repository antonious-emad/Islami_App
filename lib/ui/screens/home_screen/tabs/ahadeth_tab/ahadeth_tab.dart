import 'package:flutter/material.dart';
import 'package:islami_c9_mon/model/sura_details_args.dart';
import 'package:islami_c9_mon/ui/screens/sura_details_screen/sura_details_screen.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../providers/settings_provider.dart';
import '../../../../utils/app_theme.dart';

class AhadethTab extends StatelessWidget {
  List<String> ahadethNames = List.generate(50, (index) => "${index + 1}الحديث رقم ");
  late SettingsProvider settingsProvider;

  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    settingsProvider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 30,
            child: Image.asset(AppAssets.ahadethTabLogo)),
        const Divider(
          color: AppColors.primiary,
          thickness: 4,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context)!.ahadeth,
            style: TextStyle(
                color: settingsProvider.mode == ThemeMode.light
                ? AppTheme.BlackColor
                : AppTheme.WhiteColor, fontSize: 24,fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          color: AppColors.primiary,
          thickness: 4,
        ),
        buildSuraNamesList()
      ],
    );
  }

  buildSuraNamesList() {
    return Expanded(
        flex: 70,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){return InkWell(
            onTap: (){
              Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                  arguments: SuraDetailsArgs(
                      suraName: ahadethNames[index],
                      fileName: "h${index+1}.txt",
                      isQuranFile: false));
            },
            child: Text(ahadethNames[index],
              textDirection:TextDirection.ltr,
              textAlign: TextAlign.center,
              style:TextStyle(color: settingsProvider.mode == ThemeMode.light
                  ? AppTheme.BlackColor
                  : AppTheme.WhiteColor, fontSize: 24,fontWeight: FontWeight.bold),
            ),
          );},
          separatorBuilder: (_, __){
            return  Divider(
              color: settingsProvider.mode==ThemeMode.light?AppTheme.primaryColor:AppTheme.YellowColor,
              // AppColors.primiary,
              thickness: 4,
            );
          },
          itemCount: ahadethNames.length,
        ));
  }
}
