import 'dart:async';

import 'package:a_to_d_assignemt/businessLogic/login/bloc/login_bloc.dart';
import 'package:a_to_d_assignemt/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    _loadUserEmailPassword();
  }

  final _key = GlobalKey<FormState>();
  final widgets = Widgets();
  bool _isChecked = false;
  bool obsecureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                  key: _key,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height:
                              (10.2 * MediaQuery.of(context).size.height) / 100,
                        ),
                        Center(
                            child: Image.asset(
                          'assets/images/logo_signUp.png',
                          height:
                              (14.6 * MediaQuery.of(context).size.height) / 100,
                        )),
                        SizedBox(
                          height:
                              (5.0 * MediaQuery.of(context).size.height) / 100,
                        ),
                        Container(
                          height:
                              (14.7 * MediaQuery.of(context).size.height) / 100,
                          width:
                              (84.5 * MediaQuery.of(context).size.width) / 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: (6.0 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                            color: Color(0xffff808080)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    0, 193, 191, 191),
                                                style: BorderStyle.solid,
                                                width: 0.08),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                              (1.6 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height) /
                                                  100,
                                            )))),
                                  )),
                              Container(
                                  height: (6.0 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                    obscureText: obsecureText,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              obsecureText = !obsecureText;
                                            });
                                          },
                                          child: Icon(obsecureText
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                        hintText: 'Password',
                                        hintStyle: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                            color: Color(0xffff808080)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    0, 193, 191, 191),
                                                style: BorderStyle.solid,
                                                width: 0.08),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                              (1.6 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height) /
                                                  100,
                                            )))),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              (1.45 * MediaQuery.of(context).size.height) / 100,
                        ),
                        Container(
                          width:
                              (84.5 * MediaQuery.of(context).size.width) / 100,
                          child: Row(
                            children: [
                              Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  side: BorderSide(color: Color(0xffff939EAA)),
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  }),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              (1.45 * MediaQuery.of(context).size.height) / 100,
                        ),
                        _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty
                            ? BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return InkWell(
                                    onTap: () {
                                      if (_isChecked) {
                                        BlocProvider.of<LoginBloc>(context).add(
                                            Login(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text));
                                        Timer(Duration(seconds: 2), () {
                                          state is LoginDone
                                              ? Navigator.of(context).pushNamed(
                                                  '/home',
                                                  arguments: {
                                                      'cityId': state.msg
                                                          .liveWeather.cityId,
                                                      'token': state.msg.token
                                                    })
                                              : null;
                                          state is LoginError
                                              ? widgets.errorSnackBar(
                                                  state.error, context)
                                              : null;
                                        });
                                      }
                                    },
                                    child: widgets.buttonEnabled(
                                        'Login',
                                        (84.5 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            100,
                                        (6.0 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                            100),
                                  );
                                },
                              )
                            : widgets.buttonDisabled(
                                'Login',
                                (84.5 * MediaQuery.of(context).size.width) /
                                    100,
                                (6.0 * MediaQuery.of(context).size.height) /
                                    100),
                        SizedBox(
                          height:
                              (12.9 * MediaQuery.of(context).size.height) / 100,
                        ),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signUp');
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _rememberMe(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        _emailController.text = _email;
        _passwordController.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
