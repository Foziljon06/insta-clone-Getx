import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/pages/signin_page.dart';
import 'package:instagram/pages/sinup_page.dart';
import 'package:instagram/pages/splash_page.dart';
import 'package:instagram/services/http_service.dart';
import 'package:instagram/services/notif_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotifService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // AAAAAm5nNLI:APA91bFQbspsCrsduZS9CQip02G090MV6h6ro94qSyfHqrXEcYEOgQqxd6SL470Cof2kEZYt4ENlTgr6iSPHyiwkQwFKyfT5tQoZ71vH7LlMLF0rhgQE12ammshzWB5GWQLc9Zqvho_M

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        HomePage.id: (context) => HomePage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),

      },
    );
  }
}