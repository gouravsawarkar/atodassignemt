import 'package:a_to_d_assignemt/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({Key? key}) : super(key: key);
  final widgets = Widgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: const LinearGradient(colors: [
            Color(0xffff47BFDF),
            Color(0xffff4A91FF),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
              SizedBox(
                height: (6.8 * MediaQuery.of(context).size.height) / 100,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/World.png'),
                  Positioned(
                    child: Container(
                      width: (8.9 * MediaQuery.of(context).size.width) / 100,
                      height: (4.1 * MediaQuery.of(context).size.height) / 100,
                      child: Image.asset('assets/images/Group 6.png'),
                    ),
                    left: (24.8 * MediaQuery.of(context).size.width) / 100,
                    top: (3.3 * MediaQuery.of(context).size.height) / 100,
                  ),
                  Positioned(
                    child: Container(
                      width: (6.5 * MediaQuery.of(context).size.width) / 100,
                      height: (3.0 * MediaQuery.of(context).size.height) / 100,
                      child: Image.asset('assets/images/Group 10.png'),
                    ),
                    left: (35.5 * MediaQuery.of(context).size.width) / 100,
                    top: (24 * MediaQuery.of(context).size.height) / 100,
                  ),
                  Positioned(
                    child: Container(
                      width: (6.7 * MediaQuery.of(context).size.width) / 100,
                      height: (3.1 * MediaQuery.of(context).size.height) / 100,
                      child: Image.asset('assets/images/Group 9.png'),
                    ),
                    left: (48.3 * MediaQuery.of(context).size.width) / 100,
                    top: (31.6 * MediaQuery.of(context).size.height) / 100,
                  ),
                  Positioned(
                    child: Container(
                      width: (10.8 * MediaQuery.of(context).size.width) / 100,
                      height: (5.0 * MediaQuery.of(context).size.height) / 100,
                      child: Image.asset('assets/images/Group 8.png'),
                    ),
                    left: (13.0 * MediaQuery.of(context).size.width) / 100,
                    top: (31.11 * MediaQuery.of(context).size.height) / 100,
                  ),
                  Positioned(
                    child: Container(
                      width: (11.3 * MediaQuery.of(context).size.width) / 100,
                      height: (5.2 * MediaQuery.of(context).size.height) / 100,
                      child: Image.asset('assets/images/Group 7.png'),
                    ),
                    left: -(2.8 * MediaQuery.of(context).size.width) / 100,
                    top: (15.8 * MediaQuery.of(context).size.height) / 100,
                  ),
                  Positioned(
                    child: Container(
                      width: (12 * MediaQuery.of(context).size.width) / 100,
                      height: (5.5 * MediaQuery.of(context).size.height) / 100,
                      child: Image.asset('assets/images/Group 5.png'),
                    ),
                    left: (76 * MediaQuery.of(context).size.width) / 100,
                    top: (8.5 * MediaQuery.of(context).size.height) / 100,
                  ),
                ],
              ),
              SizedBox(
                height: (8 * MediaQuery.of(context).size.height) / 100,
              ),
              Container(
                height: (40.2 * MediaQuery.of(context).size.height) / 100,
                width: (84.5 * MediaQuery.of(context).size.width) / 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        (3.3 * MediaQuery.of(context).size.height) / 100)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: (5.0 * MediaQuery.of(context).size.height) / 100,
                    ),
                    Container(
                      width: (73.6 * MediaQuery.of(context).size.width) / 100,
                      height: (6.2 * MediaQuery.of(context).size.height) / 100,
                      child: const Center(
                        child: Text(
                          "Expore global map of wind, weather, and ocean conditions",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: (75.6 * MediaQuery.of(context).size.width) / 100,
                      height: (6.2 * MediaQuery.of(context).size.height) / 100,
                      child: const Center(
                        child: Text(
                          "Planing your trip become more easier with ideate weather app. you can instantly see the whole word weather within few second",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: Color(0xffff6B6A71)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (8.9 * MediaQuery.of(context).size.height) / 100,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signUp');
                        },
                        child: widgets.buttonEnabled(
                            'Get Started',
                            (63.7 * MediaQuery.of(context).size.width) / 100,
                            (6.6 * MediaQuery.of(context).size.height) / 100)),
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
              )
            ],
          )),
    );
  }
}
