import 'dart:async';

import 'package:flutter/material.dart';

import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  late TextEditingController _emailEditingController;
  late TextEditingController _passEditingController;
  Timer _timer = Timer(Duration(seconds: 5), () => print('done'));

  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController();
    _passEditingController = TextEditingController();
  }

  login() async {
    // print(requestModel.toJson());
    setState(() {
      loading = true;
    });
    _timer = Timer(Duration(seconds: 5), () {
      setState(() {
        loading = false;
      });
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login"), centerTitle: true),
        body: Stack(
          children: [
            WaveWidget(
              backgroundColor: Colors.white,
              config: CustomConfig(
                gradients: [
                  [Colors.red, Color(0xEEF44336)],
                  [Colors.red.shade800, Color(0x77E57373)],
                  [Colors.orange, Color(0x66FF9800)],
                  [Colors.white, Color(0x55FFEB3B)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 1,
              backgroundImage: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
                ),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.softLight),
              ),
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    onChanged: (text) => _emailEditingController.text = text,
                  ),
                ),
                SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      //hidden password
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                      onChanged: (text) => _passEditingController.text = text),
                ),
                SizedBox(height: 50.0),
                FractionallySizedBox(
                    widthFactor: 0.7,
                    child: ElevatedButton(
                      onPressed: login,
                      child: !loading
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Sign in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: (Colors.white)),
                              ))
                          : CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                    )),
                SizedBox(height: 40.0),
                InkWell(
                  child: Text(
                    "Forgot your password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/register"),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  child: Text(
                    "Don't have account? Create one",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 14.0),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/register"),
                ),
              ],
            ),
          ],
        ));
  }
}
