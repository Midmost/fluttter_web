import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyPage extends StatefulWidget {
  GoogleSignIn googleSignIn;
  MyPage({super.key, required this.googleSignIn});

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  GoogleSignInAccount? googleUser;

  @override
  void initState() {
    super.initState();
    // Sign in with Google when the widget is initialized
    signInWithGoogle(); //이야 여기다 넣는 거였네...그리고 initState을 만들 줄이야...
  }

  Future<void> signInWithGoogle() async {
    try {
      final user = await widget.googleSignIn.signIn();
      if (user != null) {
        setState(() {
          googleUser = user; //어싱크 함수에서도 그렇게 받아온 값을 전역변수인 googleUser에 넣어줬어야 함.
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${googleUser?.displayName}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
