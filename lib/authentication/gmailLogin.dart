import 'package:flutter/material.dart';
import 'package:my_movie/authentication/loginAuthFunction.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String name = '';

  String? _validatePasswordConfirmation(String? value) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool obscureText = true; // Initially set to true

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText; // Toggle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Text('Welcome to', style: TextStyle(fontSize: 22.0)),
                      SizedBox(width: 4.0),
                      Text(
                        'MyMovieList',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.0),
          Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isLogin
                      ? Column(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text('Name',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 96, 96, 96))),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.supervised_user_circle_rounded,
                                    color: Color.fromARGB(255, 96, 96, 96),
                                  ),
                                  SizedBox(width: 5.0),
                                  Container(
                                      color: Colors.grey,
                                      width: 1.0,
                                      height: 41.0),
                                  Container(color: Colors.grey, width: 5.0),
                                  Expanded(
                                    child: TextFormField(
                                      obscureText: true,
                                      key: ValueKey('Name'),
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return 'Enter Username';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          name = value!;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  //email
                  Column(
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Email',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 96, 96, 96)))),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 96, 96, 96),
                            ),
                            SizedBox(width: 5.0),
                            Container(
                                color: Colors.grey, width: 1.0, height: 41.0),
                            Expanded(
                              child: TextFormField(
                                key: ValueKey('email'),
                                validator: (value) {
                                  if (!(value.toString().contains('@'))) {
                                    return 'Invalid Email';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  setState(() {
                                    email = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //password
                  Column(
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 96, 96, 96)))),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 96, 96, 96),
                            ),
                            SizedBox(width: 5.0),
                            Container(
                                color: Colors.grey, width: 1.0, height: 41.0),
                            Container(color: Colors.grey, width: 5.0),
                            Expanded(
                              child: TextFormField(
                                key: const ValueKey('Password'),
                                obscureText: obscureText,
                                validator: (value) {
                                  if (value.toString().length < 6) {
                                    return 'Password is too short';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  setState(() {
                                    password = value!;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: toggleObscureText,
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: Color.fromARGB(255, 96, 96, 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Confirm Password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 96, 96, 96)))),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 96, 96, 96),
                            ),
                            SizedBox(width: 5.0),
                            Container(
                                color: Colors.grey, width: 1.0, height: 41.0),
                            Expanded(
                              child: TextFormField(
                                key: const ValueKey('ConfirmPassword'),
                                obscureText: true,
                                validator: _validatePasswordConfirmation,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: toggleObscureText,
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: Color.fromARGB(255, 96, 96, 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Save the form when all the fields are validated
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        isLogin
                            ? signin(email, password)
                            : signup(email, password);
                      }
                    },
                    child: isLogin
                        ? Text('LOGIN')
                        : const Text('Sign Up',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 22.0)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: isLogin
                        ? Text("REGISTER")
                        : const Text('Already Signed Up?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 96, 96, 96))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
