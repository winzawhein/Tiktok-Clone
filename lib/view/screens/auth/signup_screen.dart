

import 'package:flutter/material.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:titok_clone/controller/auth_controller.dart';
import 'package:titok_clone/view/widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _comfirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const  GlitchEffect(
                 child: Text(
                  "Signup For Tiktok ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                             ),
               ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children:  [
                  const  CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      radius: 57,
                    ),
                    Positioned(
                      right: 13,
                      bottom: 10,
                      child: Container(
                        padding:const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child:const Icon(Icons.edit,size: 20,color: Colors.black,),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _usernameController,
                    myIcon: Icons.people,
                    myLabelText: "Username"),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    myIcon: Icons.email,
                    myLabelText: "Email"),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    toHide: true,
                    controller: _passwordController,
                    myIcon: Icons.lock,
                    myLabelText: "Password"),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    toHide: true,
                    controller: _comfirmPasswordController,
                    myIcon: Icons.lock,
                    myLabelText: "Comfirm Password"),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 60, right: 20),
                  height: 50,
                  width: MediaQuery.of(context).size.width - 50,
                  child: ElevatedButton(
                      onPressed: () {
                        AuthController.instance.signUp(_usernameController.text, _emailController.text, _passwordController.text, AuthController.instance.proImg);
                      }, child: const Text("SignUp",style: TextStyle(fontSize: 20),))),
            ],
          ),
        ),
      ),
    );
  }
}
