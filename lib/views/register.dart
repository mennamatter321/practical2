import 'package:flutter/material.dart';
import 'package:flutter_email_validator/email_validator.dart';
import 'package:practical2/widgets/button.dart';

import 'package:practical2/widgets/textbutton.dart';
import 'package:practical2/widgets/textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisiable = true;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isSpesialCharacter = false;
  onchangedPassword(String password) {
    setState(() {
      isUpperCase = false;
      isLowerCase = false;
      isSpesialCharacter = false;
      if (password.contains(RegExp(r'[A-Z]'))) {
        isUpperCase = true;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        isLowerCase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        isSpesialCharacter = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.green,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/bcbd716088094b157ab7f6dfa1b28095.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200),
                  const CustomTextField(hinttext: "name", obscureText: false),
                  CustomTextField(
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? "Enter a valid email"
                            : null;
                      },
                      hinttext: "Email",
                      suffixIcon: const Icon(Icons.email),
                      obscureText: false),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisiable = !isVisiable;
                          });
                        },
                        icon: isVisiable
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    validator: (value) {
                      return value!.length < 6
                          ? "Enter at least 6 characters"
                          : null;
                    },
                    onChanged: (password) {
                      onchangedPassword(password);
                    },
                    hinttext: "password",
                    obscureText: isVisiable ? true : false,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const Forgetpassword()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ))),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    text: "Rigester",
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   // return const MobileScreen();
                      // },));
                    },
                  ),
                  const SizedBox(height: 170),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account?',
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
