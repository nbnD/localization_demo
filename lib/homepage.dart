
import 'package:flutter/material.dart';
import 'package:localization_demo/app_langugage_provider.dart';
import 'package:localization_demo/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppLanguageProvider appLanguage;


  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          AppLocalizations.of(context)!.translate('localeDemo')!,
        ),
        actions: [
          PopupMenuButton<int>(
            color: Colors.white,
            itemBuilder: (context) => [
              // PopupMenuItem 1
              const PopupMenuItem(
                value: 1,
                // row with 2 children
                child: Row(
                  children: <Widget>[
                    Icon(Icons.abc,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("English")
                  ],
                ),
              ),
              // PopupMenuItem 2
              const PopupMenuItem(
                value: 2,
                // row with two children
                child: Row(
                  children: [
                    Icon(Icons.nearby_off),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Nepali")
                  ],
                ),
              ),
            ],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                appLanguage.changeLanguage(const Locale("en"));
              } else if (value == 2) {
                appLanguage.changeLanguage(const Locale("ne"));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.translate('textToChange')!,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
