import 'package:flutter/material.dart';

import '../component/standard_button.dart';
import 'geolocation_aut_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login_background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image(image: AssetImage("assets/lmm_logo.png")),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Effettua il ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Kulim Park",
                                  color: Color(0XFF1E1E1E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "login",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Kulim Park",
                                  color: Color(0xFF00A550),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Username',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kulim Park',
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            debugPrint(value.toString());
                          },
                          style: const TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Kulim Park',
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (value) {
                            debugPrint(value.toString());
                          },
                          obscureText: true,
                          style: const TextStyle(color: Color(0xFFD9D9D9)),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GeolocationAut(),
                              ),
                            );
                          },
                          child: const StandardButton(nameButton: 'Login')
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
