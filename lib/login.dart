// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';

// DELIGHT TOAST
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future getToken() async {
    var urlogin = Uri.parse(
      'http://localhost:8000/token',
    );
    var responselogin = await http.get(urlogin);
    var token = jsonDecode(responselogin.body);
    login(token);
  }

  Future login(token) async {
    var url = Uri.http('localhost:8000', '/api/diceklogin');
    // var url = Uri.https('localhost:8000', 'api/login');
    var response = await http.post(url, headers: {
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*',
      'Connection': 'Keep-Alive',
      'X-CSRF-TOKEN': token,
    }, body: {
      "username": user.text,
      "password": pass.text,
    });

    var data = json.decode(response.body); // MEMAKAI JSON ECHO
    if (response.statusCode == 302) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => const ToastCard(
          leading: Icon(
            Icons.warning_rounded,
            color: Colors.orange,
            size: 28,
          ),
          title: Text(
            "Username and Password Kosong",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(context);
    } else if (data == "OK") {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => const ToastCard(
          leading: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 28,
          ),
          title: Text(
            "Login Successful",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(context);
      user.clear();
      pass.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ),
      );
    } else if ((data == "ERROR") || (response.statusCode == 404)) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => const ToastCard(
          leading: Icon(
            Icons.warning_rounded,
            color: Colors.orange,
            size: 28,
          ),
          title: Text(
            "Username and Password Invalid",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        const Text(
          "SELAMAT DATANG DI",
          style: TextStyle(
            fontSize: 10,
            color: Color.fromARGB(255, 255, 255, 255),
            height: 2,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "Jejakami Inventori.",
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            height: 1.2,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: user,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Email / Username',
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          obscureText: true,
          style: const TextStyle(color: Colors.black),
          controller: pass,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        InkWell(
          highlightColor: Colors.blue.withOpacity(0.4),
          splashColor: Colors.green.withOpacity(0.5),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              // color: const Color(0xFF1C1C1C),
              color: Color.fromARGB(255, 2, 2, 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 9, 9, 9).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: GestureDetector(
                  onTap: getToken,
                  child: const Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 3.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Lupa Password ?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            // fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1,
          ),
        ),
      ],
    );
  }
}
