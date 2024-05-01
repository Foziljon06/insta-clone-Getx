import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/controllers/signUp_controller.dart';


class SignUpPage extends StatefulWidget {
  static const String id = "signup_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _controller=Get.find<SignUpController>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: GetBuilder<SignUpController>(
          builder:(_){
            return Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(193, 53, 132, 1),
                        Color.fromRGBO(131, 58, 180, 1),
                      ])),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Instagram",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontFamily: "Billabong"),
                            ),

                            //#fullname
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 50,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(7)),
                              child: TextField(
                                controller: _controller.fullnameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintText: "Fullname",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 17, color: Colors.white54)),
                              ),
                            ),

                            //#email
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 50,
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(7)),
                              child: TextField(
                                controller: _controller.emailController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    border: InputBorder.none,
                                    hintStyle:
                                    TextStyle(fontSize: 17, color: Colors.white54)),
                              ),
                            ),

                            //#password
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 50,
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(7)),
                              child: TextField(
                                controller: _controller.passwordController,
                                style: const TextStyle(color: Colors.white),
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                    hintStyle:
                                    TextStyle(fontSize: 17, color: Colors.white54)),
                              ),
                            ),

                            //#cpassword
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 50,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(7)),
                              child: TextField(
                                controller: _controller.cpasswordController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    hintText: "Confirm Password",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 17, color: Colors.white54)),
                              ),
                            ),

                            //#signin
                            GestureDetector(
                              onTap: () {
                                _controller.doSignUp(context);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 50,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 17),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),


                      //#footer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                _controller.callSignInPage();
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),

                    ],
                  ),

                  _controller.isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}