import 'package:flutter/material.dart';
import 'package:my_movie/authentication/login_auth_function.dart';
import 'package:my_movie/utilities/constants.dart';

class AlreadyRegistered extends StatefulWidget {
  const AlreadyRegistered({super.key});

  @override
  State<AlreadyRegistered> createState() => AlreadyRegisteredState();
}

class AlreadyRegisteredState extends State<AlreadyRegistered> {

  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String? email;
  String? password;
  String? username;


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
                      child: Text('Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.0))),
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
          const SizedBox(height: 50.0),
          Form(
            key: _formkey,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isLogin
                      ? Column(children: <Widget>[
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Name',
                            style: TextStyle(color: Color.fromARGB(255,96, 96, 96)))),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(6.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.supervised_user_circle_rounded,
                            color: Color.fromARGB(255,96, 96, 96),
                          ),
                          const SizedBox(width: 5.0),
                          Container(color: Colors.grey, width: 1.0, height:41.0),

                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              key: const ValueKey('Name'),
                              validator: (value) {
                                if (value.toString().length < 3) {
                                  return ErrorMessages.invalidUsername;
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
                          )
                        ],
                      ),
                    ),
                  ])
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  //email
                  Column(children: <Widget>[
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Email',
                            style: TextStyle(color: Color.fromARGB(255,96, 96, 96)))),
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
                            Icons.mail,
                            color: Color.fromARGB(255,96, 96, 96),
                          ),
                          const SizedBox(width: 5.0),
                          Container(color: Colors.grey, width: 1.0, height:41.0),
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
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  //password
                  Column(children: <Widget>[
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Password',
                            style: TextStyle(color: Color.fromARGB(255,96, 96, 96)))),
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
                            Icons.lock,
                            color: Color.fromARGB(255,96, 96, 96),
                          ),
                          const SizedBox(width: 5.0),
                          Container(color: Colors.grey, width: 1.0, height:41.0),

                          Expanded(
                            child: TextFormField(
                              key: const ValueKey('Password'),
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password is small';
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
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      //save the form when all the fields are validated
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        isLogin ? signin(email!, password!) : signup(email!, password!);
                      }
                    },
                    child: isLogin ? const Text('LOGIN',style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 20.0)) : const Text('Sign Up', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 22.0)),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child:
                    isLogin ? const Text("REGISTER",style: TextStyle(color: Color.fromARGB(255,96, 96, 96)),) : const Text('Already Signed Up?', style: TextStyle(color: Color.fromARGB(255,96, 96, 96)),),
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