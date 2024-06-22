import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/firebase_options.dart';
import 'package:flutter_template/pages/noti_screen.dart';
import 'package:flutter_template/pages/splash_screen.dart';
import 'package:flutter_template/providers/theme_notifier.dart';
import 'package:flutter_template/utils/firebase/firebase_api.dart';
import 'package:flutter_template/utils/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initializeFirebaseNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'Flutter template',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      routes: {
        NotiScreen.notiRoute: (context) => const NotiScreen(),
      },
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}
