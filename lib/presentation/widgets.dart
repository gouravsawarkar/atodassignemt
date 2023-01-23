import 'package:flutter/material.dart';

class Widgets {
  buttonEnabled(name, width, height) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffff47BFDF), Color(0xffff4A91FF)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  buttonLoading(name, width, height) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffff47BFDF), Color(0xffff4A91FF)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.white,
      )),
    );
  }

  buttonDisabled(name, width, height) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffffD9D9D9), Color(0xffffD9D9D9)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  vector1(height, width) {
    return Positioned(
      child: Container(
        width: (27 * width) / 100,
        height: (26 * height) / 100,
        child: Image.asset('assets/images/Vector_1.png'),
      ),
      left: -(6 * width) / 100,
      top: (10.2 * height) / 100,
    );
  }

  vector2(height, width) {
    return Positioned(
      child: Container(
        width: (102 * width) / 100,
        height: (40.8 * height) / 100,
        child: Image.asset('assets/images/Vector_2.png'),
      ),
      left: (14.2 * width) / 100,
      top: -(6.0 * height) / 100,
    );
  }

  errorSnackBar(msg, context) {
    var snackBar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(msg),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  successSnackBar(msg, context) {
    var snackBar = SnackBar(
      backgroundColor: Colors.greenAccent,
      content: Text(msg),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  LoadingSnackBar(context) {
    var snackBar = SnackBar(
      backgroundColor: Color.fromARGB(255, 157, 156, 156),
      content: Text('Loading'),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
