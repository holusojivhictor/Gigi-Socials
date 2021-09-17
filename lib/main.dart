import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:gigi_socials/gigi/gigi.dart';
import 'package:gigi_socials/sign_in/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:gigi_socials/sign_in/get_started.dart';

import 'package:gigi_socials/sign_in/authentication.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => GigiSocials(),
    ),
  );
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}


class GigiSocials extends StatelessWidget {

  @override
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
          highlightColor: Colors.deepPurple.shade300,
        ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple.shade300,
      ),
      home: GetStarted(),
      routes: {
        "/firstPage": (_) => new FirstPage(),
        "/gigi": (_) => new Gigi(),
        "/get_started": (_) => new GetStarted(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Consumer<ApplicationState>(
                      builder: (context, appState, _) => Authentication(
                        email: appState.email,
                        loginState: appState.loginState,
                        startLoginFlow: appState.startLoginFlow,
                        verifyEmail: appState.verifyEmail,
                        signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                        cancelRegistration: appState.cancelRegistration,
                        registerAccount: appState.registerAccount,
                        signOut: appState.signOut,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}