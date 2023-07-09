import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/Helper/cache_helper.dart';
import 'package:test/core/MainManagements/main_managements.dart';
import 'package:test/core/Strings/strings_application.dart';
import 'package:test/core/Theme/dark_theme.dart';
import 'package:test/core/Theme/light_theme.dart';
import 'package:test/core/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/layout_screen.dart';
import 'ingections_container.dart' as di;
import 'language_bloc/language_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await di.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
      create: (context) => di.sl<LanguageBloc>()
        ..add(const InitialLanguageEvent(locale: Locale('en', ''))),
      child: BlocConsumer<LanguageBloc, LanguageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SetLanguageState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: StringsApplications.appName,
              locale: state.locale,
              localizationsDelegates: MainManagments.localizationsDelegates,
              supportedLocales: LanguageMangement.locales,
              theme: lightThemes,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              home: const LayoutScreen(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
