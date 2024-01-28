import 'package:cj_flutter_riverpod_instagram_clone/common/routes/routes_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/app_theme.dart';
import 'package:cj_flutter_riverpod_instagram_clone/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  await _appCheck();

  usePathUrlStrategy();
  runApp(
    const ProviderScope(
      child: InstaCloneApp(),
    ),
  );
}

Future<void> _initializeApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> _appCheck() async {
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
}

class InstaCloneApp extends ConsumerWidget {
  const InstaCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      title: 'Insta Clone App',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
