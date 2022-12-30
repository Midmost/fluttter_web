import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_page_google.dart';

// flutter run -d chrome --web-hostname localhost --web-port 53458
// 53458 은 내 로컬호스트

GoogleSignIn googleSignIn = GoogleSignIn(
  // Optional clientId
  clientId:
      '292815956969-piucimal0mm4l0or4m0ibl8aa1cohf6h.apps.googleusercontent.com', // heejinCLientID:
  // '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',  // google-demo
  //heejinClientPassword: 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

  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Doctorpresso', home: LoginPage());
  }
}
