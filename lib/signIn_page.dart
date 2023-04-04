import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/pages/main_page/main_page.dart';
import 'package:my_first_app/product_control.dart';
import 'package:my_first_app/product_manager.dart';
import 'package:my_first_app/products.dart';
import './pages/comments_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<User?> signInUsingEmailPassword({
    String email = 'essaubaid0@gmail.com',
    String password = 'essaubaid1',
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    //return signInForm(context);
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return signInForm(context);
        }
        return const Scaffold(
          body: Center(
            child: Text("Loading"),
          ),
        );
      },
    );
  }

  SingleChildScrollView signInForm(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Column(
                children: [
                  Image.asset(
                    "assets/login.png",
                    height: 200,
                    width: 200,
                  ),
                  const Spacer(),
                  buildTextField(
                    Icons.email_outlined,
                    "EMAIL",
                    "User name",
                    false,
                    false,
                  ),
                  buildTextField(
                    Icons.lock_outlined,
                    "PASSWORD",
                    "password",
                    true,
                    false,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (() => {}),
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        minimumSize: const Size.fromHeight(50),
                        shape: const StadiumBorder()),
                    onPressed: () => {
                      signInUsingEmailPassword(context: context),
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CommentPage(),
                      //   ),
                      // )
                    },
                    child: const Text("LOGIN"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: lineWithText("OR CONNECT WITH US"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTextButton(
                          Icons.facebook,
                          "FACEBOOK",
                          Colors.blue[900]!,
                          CommentPage(),
                          context,
                        ),
                        buildTextButton(
                          Icons.plus_one,
                          "GOOGLE",
                          Colors.red,
                          MainPage(),
                          context,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextButton buildTextButton(
    IconData icon,
    String title,
    Color backgroundColor,
    Widget newPage,
    BuildContext context,
  ) {
    return TextButton(
      onPressed: (() => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => newPage),
              ),
            ),
          }),
      style: TextButton.styleFrom(
        minimumSize: const Size(155, 45),
        shape: const StadiumBorder(),
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor,
      ),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget lineWithText(String text) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: const Divider(
              color: Colors.grey,
              height: 36,
            )),
      ),
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: const Divider(
              color: Colors.grey,
              height: 36,
            )),
      ),
    ]);
  }

  Widget buildTextField(
    IconData icon,
    String label,
    String hintText,
    bool isPassword,
    bool isEmail,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        maxLength: isPassword ? 20 : 50,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        obscureText: isPassword,
        decoration: InputDecoration(
          counterText: '',
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(
            icon,
            color: Colors.redAccent,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.redAccent),
          ),
          contentPadding: const EdgeInsets.all(10.0),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
