import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titok_clone/constant.dart';
import 'package:titok_clone/controller/auth_controller.dart';
import 'package:titok_clone/view/screens/auth/signup_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();Get.put(AuthController()); runApp(const MyApp());
}
    

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
       scaffoldBackgroundColor: backgroungColor
      ),
      home:  SignUpScreen(),
    );
  }
}

