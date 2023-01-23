import 'package:a_to_d_assignemt/businessLogic/signUp/bloc/sign_up_bloc.dart';
import 'package:a_to_d_assignemt/presentation/widgets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final _key = GlobalKey<FormState>();
  final widgets = Widgets();
  bool obsecure = true;
  TextEditingController _nameCotroller = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            (40.0 * MediaQuery.of(context).size.height) / 100,
                        width: (84.5 * MediaQuery.of(context).size.width) / 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height:
                                    (6.0 * MediaQuery.of(context).size.height) /
                                        100,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return null;
                                    }
                                    return null;
                                  },
                                  controller: _nameCotroller,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'First Name',
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
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            (1.6 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height) /
                                                100,
                                          )))),
                                )),
                            Container(
                                height:
                                    (6.0 * MediaQuery.of(context).size.height) /
                                        100,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return null;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneNumberController,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'Phone Number',
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
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            (1.6 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height) /
                                                100,
                                          )))),
                                )),
                            Container(
                                height:
                                    (6.0 * MediaQuery.of(context).size.height) /
                                        100,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return null;
                                    }
                                    return null;
                                  },
                                  controller: _countryController,
                                  onChanged: (value) {
                                    showCountryPicker(
                                        context: context,
                                        onSelect: (value) {
                                          setState(() {
                                            _countryController.text =
                                                value.name;
                                          });
                                        });
                                  },
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        onSelect: (value) {
                                          setState(() {
                                            _countryController.text =
                                                value.name;
                                          });
                                        });
                                  },
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'Country',
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
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            (1.6 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height) /
                                                100,
                                          )))),
                                )),
                            Container(
                                height:
                                    (6.0 * MediaQuery.of(context).size.height) /
                                        100,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return null;
                                    }
                                    return null;
                                  },
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
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            (1.6 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height) /
                                                100,
                                          )))),
                                )),
                            Container(
                                height:
                                    (6.0 * MediaQuery.of(context).size.height) /
                                        100,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return null;
                                    }
                                    return null;
                                  },
                                  obscureText: obsecure,
                                  controller: _passWordController,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            obsecure = !obsecure;
                                          });
                                        },
                                        child: Icon(obsecure
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      hintText: 'Paasword',
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
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
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
                            (2.9 * MediaQuery.of(context).size.height) / 100,
                      ),
                      _countryController.text.isNotEmpty &&
                              _emailController.text.isNotEmpty &&
                              _nameCotroller.text.isNotEmpty &&
                              _phoneNumberController.text.isNotEmpty &&
                              _passWordController.text.isNotEmpty
                          ? BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    BlocProvider.of<SignUpBloc>(context).add(
                                        SignUp(
                                            country: _countryController.text,
                                            email: _emailController.text,
                                            name: _nameCotroller.text,
                                            password: _passWordController.text,
                                            phone:
                                                _phoneNumberController.text));
                                    state is SignUpDone
                                        ? widgets.successSnackBar(
                                            'Signed Up Successfully', context)
                                        : null;
                                    state is SignUpDone
                                        ? Navigator.of(context)
                                            .pushNamed('/signUpDone')
                                        : null;
                                    state is SignUpError
                                        ? widgets.errorSnackBar(
                                            state.error, context)
                                        : null;
                                    state is SignUpLoading
                                        ? widgets.LoadingSnackBar(context)
                                        : null;
                                  },
                                  child: widgets.buttonEnabled(
                                      'SignUp',
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
                              'SignUp',
                              (84.5 * MediaQuery.of(context).size.width) / 100,
                              (6.0 * MediaQuery.of(context).size.height) / 100),
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
                    "Already have an account ?",
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
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text(
                      "Login",
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
    );
  }
}
