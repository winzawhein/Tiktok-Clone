import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:titok_clone/controller/auth_controller.dart';
import 'package:titok_clone/view/screens/home.dart';
import 'package:titok_clone/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const  GlitchEffect(child: Text("TikTok Clone",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
         const SizedBox(height: 20,),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
                controller: _emailController,
                myIcon: Icons.email,
                myLabelText: "Email"),
          ),
             const SizedBox(height: 8,),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
                toHide: true,
                controller: _passwordController,
                myIcon: Icons.lock,
                myLabelText: "Password"),
          ),
        const  SizedBox(height: 30,),
        Container(
          margin:const EdgeInsets.only(left: 60,right: 20),
          height: 50,
          width: MediaQuery.of(context).size.width-50,
          child: ElevatedButton(onPressed:() {
            AuthController.instance.login(_emailController.text, _passwordController.text);
            Get.to(()=>const HomeScreen());
          }, child:const Text("LOGIN")))
        ],
      ),
    ));
  }
}
