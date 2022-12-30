// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_sign_in/google_sign_in.dart';
// final googleSignIn = GoogleSignIn();



// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   late String _email, _password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Log In'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               // validator: (input) => !input.contains('@') ? 'Please enter a valid email' : null,
//               validator: (input) => !(input as String).contains('@') ? 'Please enter a valid email' : null,
              
//               onSaved: (input) => _email = input!,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextFormField(
//               // validator: (input) => input?.length < 6 ? 'Password must be at least 6 characters' : null,
//               validator: (input) => input?.compareTo('password') == 0 ? 'Please enter a different password' : null,

//               onSaved: (input) => _password = input!,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             ElevatedButton(
//   onPressed: _submit,
//   child: Text('Log In'),
// ),

//           ],
//         ),
//       ),
//     );
//   }


// void _submit() async {
//   if (_formKey.currentState!.validate()) {
//     _formKey.currentState?.save();
//     try {
//       // Send login request with _email and _password
//       final response = await http.post('http://your-server.com/login', body: {'email': _email, 'password': _password});
//       // Process response and handle any errors
//     } catch (e) {
//       // Handle errors
//     }
//   }
// }
// }