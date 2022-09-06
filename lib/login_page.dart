import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/tab_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Instgram Clone', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(
              Buttons.Google,
              onPressed: (){
                _handleSignIn().then((user) => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage(user!)))
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<User?> _handleSignIn() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    UserCredential userCredential = await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
    );

    return userCredential.user;

  }
}
