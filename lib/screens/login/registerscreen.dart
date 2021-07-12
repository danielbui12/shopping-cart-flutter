import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = "";
  String _password = "";
  String _name = "";
  bool loading = false;
  Timer _timer = Timer(Duration(seconds: 5), () => print('done'));
  register() async {
    setState(() {
      loading = true;
    });
    _timer = Timer(Duration(seconds: 5), () {
      setState(() {
        loading = true;
      });
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register"), centerTitle: true),
        body: Stack(
          children: [
            WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.red, Color(0xEEF44336)],
                  [Colors.red.shade800, Color(0x77E57373)],
                  [Colors.purple.withOpacity(0.3), Colors.purpleAccent],
                  [Colors.white, Colors.white]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email"),
                      onChanged: (text) => setState(() {
                        _email = text;
                      }),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      //hidden password
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                      onChanged: (text) => setState(() {
                        _password = text;
                      }),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: "Name"),
                      onChanged: (text) => setState(() {
                        _name = text;
                      }),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 45.0,
                    child: ElevatedButton(
                        onPressed: register,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: !loading
                              ? Text(
                                  "Sign up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: (_email.isNotEmpty &&
                                              _name.isNotEmpty &&
                                              _password.isNotEmpty)
                                          ? Colors.white
                                          : Colors.grey),
                                )
                              : CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                        )),
                  ),
                  SizedBox(height: 30.0),
                  InkWell(
                      child: Text(
                        "Already have an account? Sign in",
                        style: TextStyle(color: Colors.blue, fontSize: 12.0),
                      ),
                      onTap: () => Navigator.of(context).pushNamed("/login"))
                ],
              ),
            ),
          ],
        ));
  }
}
