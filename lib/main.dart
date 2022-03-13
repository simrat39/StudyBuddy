import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/home_page.dart';
import 'package:study_app/providers/timer_state_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

var timerStateNotifier = ChangeNotifierProvider((_) {
  return TimerStateProvider(
    duration: const Duration(
      hours: 1,
      minutes: 40,
      seconds: 20,
    ),
  );
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RedHatDisplay').copyWith(
        scaffoldBackgroundColor: const Color(0xffF8F8FF),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
