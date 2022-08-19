import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:titok_clone/model/myuser.dart';
import 'package:titok_clone/view/screens/auth/login_screen.dart';
import 'package:titok_clone/view/screens/auth/signup_screen.dart';
import 'package:titok_clone/view/screens/home.dart';

class AuthController extends GetxController {
  static AuthController instance= Get.find();
 File? proImg;
  pickImage() async{
   final image= await ImagePicker().pickImage(source: ImageSource.gallery);
   if(image==null) return;
   final img= File(image.path);
   proImg =img;
  }

  
  //user state 
 late Rx<User?> _user;
  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser) ;
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user){
   if(user ==null){
    Get.offAll(()=>SignUpScreen());
   }else{
    Get.offAll(()=>const HomeScreen());
   }}
  

  //Use Register

  Future<void> signUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential _credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
       String downloadUrl= await _uploadProPic(image);

        MyUser user = MyUser(name: username, profilePhoto: downloadUrl, email: email, uid: _credential.user!.uid);
       
       await FirebaseFirestore.instance.collection("users").doc(_credential.user!.uid).set(user.toJson());
      }
      else{
          Get.snackbar("Error Creating Account", "Please filled full required");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error occured", e.toString());
    }
  }

  Future<String> _uploadProPic(File img) async {
    Reference _ref = FirebaseStorage.instance
        .ref()
        .child("ProfiePics")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = _ref.putFile(img);
    TaskSnapshot snapshot = await uploadTask;
    String imageDownUrl = await snapshot.ref.getDownloadURL();
    return imageDownUrl;
  }

 void login(String email,String password) async{
    try{
      
    if(email.isNotEmpty && password.isNotEmpty){
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }else{
      Get.snackbar("Error Logging In", "Please entered all the fields");
    }
    }catch(e){
      Get.snackbar("Error Logging In", e.toString());
    }
  }

}