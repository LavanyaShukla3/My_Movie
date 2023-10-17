import 'package:flutter/material.dart';
import 'package:my_movie/authentication/login_auth_function.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAuthPage extends StatefulWidget {
  final bool showName;
  final bool showConfirmPassword;
  final String text1;
  final String text2;
  final String subtext1;
  final String subtext2;

  const CommonAuthPage({
    Key? key,
    required this.text1,
    required this.text2,
    required this.subtext1,
    required this.subtext2,
    this.showConfirmPassword = false,
    this.showName = false,
  }) : super(key: key);
  @override
  State<CommonAuthPage> createState() => CommonAuthPageState();
}

class CommonAuthPageState extends State<CommonAuthPage> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String? email;
  String? password;
  String? username;


  String? _validatePasswordConfirmation(String? value) {
    if (value != password) {
      return ErrorMessages.confirmPassword;
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
    return Form(
        key: _formkey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLogin && widget.showName)
                Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.supervised_user_circle_rounded,
                            color: Color.fromARGB(255, 96, 96, 96),
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            color: Colors.grey,
                            width: 1.0,
                            height: 41.0,
                          ),
                          Container(color: Colors.grey, width: 5.0),
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              key: const ValueKey('Name'),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Enter Username';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  username = value!;
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

              //email
              Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Email',
                        style: TextStyle(
                            color: Color.fromARGB(255, 96, 96, 96))),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(6.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.mail,
                          color: Color.fromARGB(255, 96, 96, 96),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                            color: Colors.grey, width: 1.0, height: 41.0),
                        Expanded(
                          child: TextFormField(
                            key: const ValueKey('email'),
                            validator: (value) {
                              if (!(value.toString().contains('@'))) {
                                return ErrorMessages.invalidEmail;
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
                            color: Color.fromARGB(255, 96, 96, 96))),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(6.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 96, 96, 96),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                            color: Colors.grey, width: 1.0, height: 41.0),
                        Container(color: Colors.grey, width: 5.0),
                        Expanded(
                          child: TextFormField(
                            key: const ValueKey('Password'),
                            obscureText: obscureText,
                            validator: (value) {
                              if (value
                                  .toString()
                                  .length < 6) {
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
              if (widget.showConfirmPassword)
                Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Color.fromARGB(255, 96, 96, 96),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 96, 96, 96),
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            color: Colors.grey,
                            width: 1.0,
                            height: 41.0,
                          ),
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
                    isLogin ? signin(email!, password!) : signup(
                        email!, password!);
                  }
                },
                child: isLogin
                    ? Text(widget.text1!):  Text(widget.text2! ,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp),),
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
                    ? Text(widget.subtext1!)
                    : Text(widget.subtext2!,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),),),
              ),
            ],
          ),
        ),
      );
  }
}
