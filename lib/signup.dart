import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// DELIGHT TOAST
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

var _text = '';

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future getRegisterToken() async {
    var urltoken = Uri.parse(
      'http://localhost:8000/token',
    );
    var responsetoken = await http.get(urltoken);
    var token = jsonDecode(responsetoken.body);
    register(token);
  }

  final DateTime _currentTime = DateTime.now();
// Text("Current Time: ${_currentTime.format(context)}")

  Future register(token) async {
    var url = Uri.http('localhost:8000', '/api/register');
    var response = await http.post(url, headers: {
      "Access-Control-Allow-Origin": "*",
      'Accept': '*/*',
      'Connection': 'Keep-Alive',
      'X-CSRF-TOKEN': token,
    }, body: {
      "name": name.text,
      "username": user.text,
      "password": pass.text,
      "created_at": _currentTime.toString(),
      "updated_at": _currentTime.toString(),
    });
    // print(_currentTime.toString());
    var data = json.decode(response.body);
    if (data == "ERROR") {
      DelightToastBar(
        autoDismiss: true,
        builder: (context) => const ToastCard(
          leading: Icon(
            Icons.warning_rounded,
            color: Colors.orange,
            size: 28,
          ),
          title: Text(
            "Check Username or Password",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(context);
    } else if (data == "ERROR") {
      name.clear();
      pass.clear();
      user.clear();
      DelightToastBar(
        autoDismiss: true,
        builder: (context) => const ToastCard(
          leading: Icon(
            Icons.warning_rounded,
            color: Colors.orange,
            size: 28,
          ),
          title: Text(
            "User already exist!",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(context);
    } else {
      name.clear();
      pass.clear();
      user.clear();
      DelightToastBar(
        autoDismiss: true,
        builder: (context) => const ToastCard(
          leading: Icon(
            Icons.warning_rounded,
            color: Colors.green,
            size: 28,
          ),
          title: Text(
            "Registration Successful",
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
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "SIGN UP",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 0, 0, 0),
              height: 2,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          const Text(
            "Jejakami Inventori.",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 4, 4, 4),
              letterSpacing: 2,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            style: const TextStyle(color: Colors.black, fontSize: 14),
            controller: name,
            decoration: InputDecoration(
              hintText: 'Name',
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
              fillColor: Colors.black.withOpacity(0.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            style: const TextStyle(color: Colors.black, fontSize: 14),
            controller: user,
            decoration: InputDecoration(
              hintText: 'Enter Email / Username',
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
              fillColor: Colors.black.withOpacity(0.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            onChanged: (text) => setState(() => _text),
            style: const TextStyle(color: Colors.black, fontSize: 14),
            obscureText: true,
            controller: pass,
            decoration: InputDecoration(
              // errorText: validatePassword(pass.text),

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
              fillColor: Colors.black.withOpacity(0.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 26, 26, 26).withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
                child: GestureDetector(
              onTap: getRegisterToken,
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Or Signup with",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.facebook_rounded,
                size: 32,
                color: Colors.black,
              ),
              SizedBox(
                width: 24,
              ),
              Icon(
                Icons.window_sharp,
                size: 32,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
