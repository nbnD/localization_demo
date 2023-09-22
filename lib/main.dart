import 'package:flutter/material.dart';
import 'package:localization_demo/app_langugage_provider.dart';
import 'package:localization_demo/app_localizations.dart';
import 'package:localization_demo/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale();
  runApp( MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
   AppLanguageProvider? appLanguage;
   MyApp({super.key, required this.appLanguage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>appLanguage,
      child: Consumer<AppLanguageProvider>(builder: (context, model, child) {
        return MaterialApp(
          title: 'Localization Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
          locale: model.appLocal,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
        );
      }),
    );
  }
}
