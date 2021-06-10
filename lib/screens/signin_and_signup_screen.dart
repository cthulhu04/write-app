import 'package:flutter/material.dart';
import 'package:write_app/config/config.dart';
import 'package:write_app/widgets/widgets.dart';

class SignInAndSignUpScreen extends StatefulWidget {
  @override
  _SignInAndSignUpScreenState createState() => _SignInAndSignUpScreenState();
}

class _SignInAndSignUpScreenState extends State<SignInAndSignUpScreen> {
  bool signInOrSignUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.mainColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Write_',
                    style: TextStyle(
                      fontSize: 45.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  color: Colors.white10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => signInOrSignUp = true),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => signInOrSignUp = false),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: signInOrSignUp ? SignInForm() : SignUpForm(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
