import 'package:flutter/material.dart';
import 'package:islami_c9_mon/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../providers/settings_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}
class _SebhaTabState extends State<SebhaTab> {
  late SettingsProvider settingsProvider;
  int counter = 0;
  int tasbehCount = 0;
  double angle = 0;
  List<String> tasbeh = ["سبحان الله", "الحمد لله", "الله اكبر"];
  void incCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    settingsProvider=Provider.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              counter++;
              if (counter%33 == 0) {
                if (tasbehCount == tasbeh.length - 1) {
                  tasbehCount = 0;
                }
                else {
                  tasbehCount++;
                }
              }
              angle+=21.7;
              setState(() {});
            },
            child: SizedBox(
                height: height * 0.45,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        left: width * 0.45,
                        bottom: height * 0.32,
                        child: Image.asset(
                          settingsProvider.headSebha(),
                          width: width * 0.2,
                          height: height * 0.11,
                        )),
                    Positioned(
                        top: height * 0.1,
                        child: Transform.rotate(
                            angle: angle,
                            child:
                            Image.asset( settingsProvider.bodySebha()))),
                  ],
                )
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.tasbihat,
            style: TextStyle(color: settingsProvider.mode == ThemeMode.light
                ? AppTheme.BlackColor
                : AppTheme.WhiteColor, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: settingsProvider.mode == ThemeMode.light
                  ? AppTheme.primaryColor
                  : AppTheme.primaryColorDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(
                    color: settingsProvider.mode == ThemeMode.light
                        ? AppTheme.BlackColor
                        : AppTheme.WhiteColor, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: settingsProvider.mode == ThemeMode.light
                    ? AppTheme.primaryColor
                    : AppTheme.YellowColor,),
              child: Text(
                tasbeh[tasbehCount],
                style: TextStyle(color: settingsProvider.mode == ThemeMode.light
                    ? AppTheme.WhiteColor
                    :AppTheme.BlackColor, fontSize: 24),
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }
}
