import 'package:flutter/material.dart';

class SignUpDone extends StatelessWidget {
  const SignUpDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: (84.2 * MediaQuery.of(context).size.height) / 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/logo_signUp.png',
                height: (14.6 * MediaQuery.of(context).size.height) / 100,
              )),
              Center(
                  child: Image.asset(
                'assets/images/signUpDone.png',
                height: (32.7 * MediaQuery.of(context).size.height) / 100,
              )),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back_ios_new),
                    const Text(
                      'Back to Login',
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
