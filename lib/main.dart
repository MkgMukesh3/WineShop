import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/providers/login_provider.dart';
import 'package:mybar/providers/verify_account_provider.dart';
import 'package:mybar/view/splash/splash.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'providers/signup_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignupProvider()),
          ChangeNotifierProvider(create: (_) => VerifyAccountProvider()),
          ChangeNotifierProvider(create: (_) => SigninProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: primaryColor,
                ),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xffF4F4F4),
          ),
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(
          //     seedColor: primaryColor,
          //     primary: primaryColor,
          //   ),
          //   useMaterial3: true,
          //   scaffoldBackgroundColor: const Color(0xffF4F4F4),
          // ),
          home: const Splash(),
        ),
      );
    });
  }
}
