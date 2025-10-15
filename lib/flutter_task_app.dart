import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/size_provider.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/routing/app_router.dart';
import 'package:flutter_task/core/routing/routes.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: Size(393, 852),
      width: context.screenWidth,
      height: context.screenHeight,
      child: Builder(
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl, // 👈 هنا السحر
          child: MaterialApp(
            title: AppStrings.appName,
            theme: Themes.light(context),
            darkTheme: Themes.dark(context),
            themeMode: ThemeMode.system,
            locale: const Locale('ar'),
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            localizationsDelegates: const [
              // AppLocalizations.delegate, // Generated delegate
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            debugShowCheckedModeBanner: false,
            initialRoute: Routes.bottomNavScreen,

            onGenerateRoute: AppRouter().generateRoute,
          ),
        ),
      ),
    );
  }
}
