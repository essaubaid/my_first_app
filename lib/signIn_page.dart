import 'package:flutter/material.dart';
import 'package:my_first_app/pages/main_page/main_page.dart';
import 'package:my_first_app/product_control.dart';
import 'package:my_first_app/product_manager.dart';
import 'package:my_first_app/products.dart';
import './pages/comments_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return signInForm(context);
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(),
                        ),
                      )
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
