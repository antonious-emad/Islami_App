import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../providers/settings_provider.dart';

import '../../../../utils/app_theme.dart';
class RadioTab extends StatelessWidget {
  late SettingsProvider settingsProvider;
   RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    settingsProvider=Provider.of(context);
    return Column(
      children: [
        const Spacer(),
        Image.asset("assets/images/radio_main.png"),
        const SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.holyquran,
          style:TextStyle(color: settingsProvider.mode == ThemeMode.light
              ? AppTheme.BlackColor
              : AppTheme.WhiteColor, fontSize: 25),

        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.skip_previous,
                      color: settingsProvider.mode == ThemeMode.light
                          ? AppTheme.primaryColor
                          : AppTheme.YellowColor,
                      size: 40,
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.play_arrow,
                      color: settingsProvider.mode == ThemeMode.light
                          ? AppTheme.primaryColor
                          : AppTheme.YellowColor,
                      size: 40,
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.skip_next,
                      color: settingsProvider.mode == ThemeMode.light
                          ? AppTheme.primaryColor
                          : AppTheme.YellowColor,
                      size: 40,
                    )))
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
