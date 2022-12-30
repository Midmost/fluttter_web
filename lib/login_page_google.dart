import 'package:flutter/material.dart';
import 'package:flutter_web_test/mypage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();
// final GoogleSignInAccount googleUser;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  var _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Log In'), leading: const LeadingDrawerCustom()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: displaySignInButton(context)),
          const Spacer(),
          Text(_errorMessage),
        ],
      ),
    );
  }

  Widget displaySignInButton(BuildContext context) {
    if (_isLoading) {
      return displayLoadingIndicator();
    }
    return OutlinedButton(
      onPressed: () => handleSignIn(context),
      child: const Text('Sign in with Google'),
    );
  }

  Widget displayLoadingIndicator() {
    return const CircularProgressIndicator();
  }

  Future<void> handleSignIn(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = 'null';
      });
      // Attempt to sign in with Google
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        // Navigate to the home page
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                googleUser: googleUser,
              ),
            ));
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error signing in with Google: $e';
      });
      print(_errorMessage);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({required this.googleUser, super.key});
  final GoogleSignInAccount googleUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          leading: const LeadingDrawerCustom(),
        ),
        drawer: Drawer(
          child: DrawerCustom(googleUser: googleUser),
        ),
        body: const Text('this is a shoswoowoow'));
  }
}

class LeadingDrawerCustom extends StatelessWidget {
  const LeadingDrawerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu,
            size: 50,
          ),
        );
      },
    );
  }
}

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key? key,
    required this.googleUser,
  }) : super(key: key);
  final GoogleSignInAccount googleUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome, ${googleUser.displayName}!',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            'Your email is ${googleUser.email}',
            style: const TextStyle(fontSize: 16),
          ),
          TextButton(
            child: const Text('Logout'),
            onPressed: () {
              // Sign out from Google
              final googleSignIn = GoogleSignIn();
              googleSignIn.signOut();
              // Navigate back to the login page
              // Navigator.of(context).pop();

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('My info'),
            onPressed: () {
              final signed = GoogleSignIn();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MyPage(
                    googleSignIn: signed,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
