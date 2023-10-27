import 'package:flutter/material.dart';
import 'package:islami_c9_mon/providers/settings_provider.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/quran_tab/quran_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/radio_tab/radio_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_c9_mon/ui/screens/home_screen/tabs/settings_tab/settings_tab.dart';
import 'package:islami_c9_mon/ui/utils/app_assets.dart';
import 'package:islami_c9_mon/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late SettingsProvider settingsProvider;
  int currentTabIndex = 0;
  List<Widget> tabs = [
     QuranTab(),
     AhadethTab(),
     const SebhaTab(),
     RadioTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(settingsProvider.isDarkEnabled() ?
          AppAssets.backgroundDark: AppAssets.background),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.apptitle,),
        ),
        body: tabs[currentTabIndex],
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigation(context),
      ),
    );
  }

  Widget buildBottomNavigation(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(canvasColor:settingsProvider.isDarkEnabled()?
            AppColors.primiaryDark: AppColors.primiary),
        child: BottomNavigationBar(
            onTap: (index) {
              currentTabIndex = index;
              setState(() {});
            },
            currentIndex: currentTabIndex,
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icQuran)),
                  label: AppLocalizations.of(context)!.quran
              ),
               BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icAhadeth)),
                  label:AppLocalizations.of(context)!.ahadeth
              ),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icSebha)),
                  label: AppLocalizations.of(context)!.sebha
              ),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(AppAssets.icRadio)),
                  label: AppLocalizations.of(context)!.radio
              ),
               BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings)
            ]),
      );
}