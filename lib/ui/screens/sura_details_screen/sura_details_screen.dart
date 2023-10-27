import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9_mon/model/sura_details_args.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = "sura_details";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SettingsProvider settingsProvider;
  String fileContent = "";
  late SuraDetailsArgs args;


  @override
  Widget build(BuildContext context) {
    settingsProvider=Provider.of(context);

    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;

    if(fileContent.isEmpty) {readFile();}
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(settingsProvider.isDarkEnabled() ?
          AppAssets.backgroundDark: AppAssets.background),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: Text(
            textDirection: TextDirection.ltr,
            args.suraName,
            style:TextStyle(color: settingsProvider.mode == ThemeMode.light
                ? AppTheme.BlackColor
                : AppTheme.WhiteColor, fontSize: 24,fontWeight: FontWeight.bold),
          ),
        ),
        body: fileContent.isNotEmpty ?
         Container(
           margin: const EdgeInsets.all(24),
           height: MediaQuery.of(context).size.height * .8,
           decoration: BoxDecoration(
               color:settingsProvider.mode == ThemeMode.light ? AppTheme.WhiteColor : AppTheme.primaryColorDark,
               border: Border.all(color: settingsProvider.mode == ThemeMode.light ? AppTheme.WhiteColor : AppTheme.primaryColorDark,),
               borderRadius: BorderRadius.circular(20)
           ),
           width: double.infinity,
           child: SingleChildScrollView(
             physics:const  BouncingScrollPhysics(),
             child: Text(fileContent,
               textDirection: TextDirection.rtl,
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.titleMedium,


           ),
           ),
         ) : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void readFile() async {
    fileContent = await rootBundle.loadString("assets/files/${args.isQuranFile ? "quran" : "ahadeth"}/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    for(int i = 0; i < fileLines.length; i++){
      fileLines[i] += args.isQuranFile ? " (${i+1}) ": "";
    }
    fileContent = fileLines.join("");
    setState(() {});
  }
}
