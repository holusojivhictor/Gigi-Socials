import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gigi_socials/gigi/gigi.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:gigi_socials/src/widgets.dart';

enum ApplicationLoginState {
  loggedOut,
  loggedIn,
  emailAddress,
  password,
  register,
}

class Authentication extends StatelessWidget {
  const Authentication({
    required this.loginState,
    required this.email,
    required this.startLoginFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startLoginFlow;
  final void Function(
      String email,
      void Function(Exception e) error,
      ) verifyEmail;
  final void Function(
      String email,
      String password,
      void Function(Exception e) error,
      )signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(
      String email,
      String displayName,
      String password,
      void Function(Exception e) error,
      ) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return EmailForm(
          callback: (email) {
            verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e));
          },
        );
      case ApplicationLoginState.emailAddress:
        return EmailForm(
          callback: (email) {
            verifyEmail(
              email, (e) => _showErrorDialog(context, 'Invalid email', e));
          },
        );
      case ApplicationLoginState.password:
        return PasswordForm(
          email: email!,
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
              email,
              displayName,
              password,
              ) {
            registerAccount(
                email,
                displayName,
                password,
                    (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const HeaderNew(text: 'Welcome to the Badlands !', color: Colors.white, size: 24, weight: FontWeight.bold),
            const SizedBox(height: 550),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: StyledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/gigi');
                },
                child: const Text('PROCEED'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: StyledButton(
                onPressed: () {
                  signOut();
                },
                child: const Text('LOGOUT'),
              ),
            ),
          ],
        );
      default:
        return Row(
          children: const <Widget>[
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          backgroundColor: Colors.grey,
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AlertButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }


  static Future<FirebaseApp> initializeFirebase() async {
    final FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
              'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:
              'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }

    return user;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<void> logOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({required this.callback});
  final void Function(String email) callback;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  bool _isSigningIn = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;

    return SizedBox(
      height: height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: const <Widget>[
                HeaderNew(text: 'Welcome Human!', color: Colors.white, size: 24, weight: FontWeight.bold),
                HeaderNew(text: 'Please sign in to your account', color: Colors.grey, size: 16, weight: FontWeight.normal),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        cursorHeight: 18,
                        cursorColor: Colors.deepPurple.shade300,
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter your email address to continue';
                          }
                          return null;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: Text('Forgot password?', style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: StyledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.callback(_controller.text);
                          }
                          },
                        child: const Text('Sign in', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: StyledButton(
                        onPressed: () async {
                          setState(() {
                            _isSigningIn = true;
                          });
                          final User? user =
                          await Authentication.signInWithGoogle(context: context);
                          setState(() {
                            _isSigningIn = false;
                          });
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return WelcomePage();},
                              ));
                          }},
                        child: const Text('Sign in with Google', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class RegisterForm extends StatefulWidget {
  RegisterForm({
    required this.registerAccount,
    required this.cancel,
    required this.email,
  });
  final String email;
  final void Function(String email, String displayName, String password)
  registerAccount;
  final void Function() cancel;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;
    double height = screen.height;

    return LayoutBuilder(
      builder: (context, constraints){
        return Container(
          height: height,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    HeaderNew(text: 'Create a new account', color: Colors.white, size: 24, weight: FontWeight.bold),
                    HeaderNew(text: 'Please fill in the form to continue', color: Colors.grey, size: 16, weight: FontWeight.normal),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorHeight: 18,
                            cursorColor: Colors.deepPurple.shade300,
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your email address to continue';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorHeight: 18,
                            cursorColor: Colors.deepPurple.shade300,
                            controller: _displayNameController,
                            decoration: const InputDecoration(
                              hintText: 'First & last name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your account name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorHeight: 18,
                            cursorColor: Colors.deepPurple.shade300,
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  height: 30,
                                  width: 110,
                                  child: Text('Forgot password?', style: TextStyle(color: Colors.grey), textAlign: TextAlign.end),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 90,
                                  child: TextButton(
                                    onPressed: widget.cancel,
                                    child: Text('CANCEL', style: TextStyle(color: Colors.deepPurple.shade300)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.registerAccount(
                                  _emailController.text,
                                  _displayNameController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                            child: Text('Sign Up'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                height: 30,
                                width: 120,
                                child: Text("Have an Account?", style: TextStyle(color: Colors.grey), textAlign: TextAlign.end),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 60,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('Sign in', style: TextStyle(color: Colors.deepPurple.shade300)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PasswordForm extends StatefulWidget {
  PasswordForm({
    required this.login,
    required this.email,
  });
  final String email;
  final void Function(String email, String password) login;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;
    double height = screen.height;

    return Container(
      height: height,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                HeaderNew(text: 'Welcome Human!', color: Colors.white, size: 24, weight: FontWeight.bold),
                HeaderNew(text: 'Please sign in to your account', color: Colors.grey, size: 16, weight: FontWeight.normal),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        cursorHeight: 18,
                        cursorColor: Colors.deepPurple.shade300,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email address to continue';
                          }
                          return null;
                            },
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        cursorHeight: 18,
                        cursorColor: Colors.deepPurple.shade300,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 110,
                            child: Text('Forgot password?', style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StyledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                                widget.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                            child: Text('Sign in'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            height: 30,
                            width: 120,
                            child: Text("Don't have an Account?", style: TextStyle(color: Colors.grey), textAlign: TextAlign.end),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 60,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('Sign Up', style: TextStyle(color: Colors.deepPurple.shade300)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}