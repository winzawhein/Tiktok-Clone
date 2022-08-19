import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:titok_clone/constant.dart';
import 'package:titok_clone/view/screens/addcaption_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({ Key? key }) : super(key: key);

   videoPick(ImageSource src,BuildContext context)async{
    final video = await ImagePicker().pickVideo(source: src);
    if(video !=null){
      Get.snackbar("Video Selected ", video.path);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCaptionScreen(videoFile: File(video.path), videoPath: video.path)));
    }else{
      Get.snackbar("Error In Selection Video", "Choose  a Different Video");
    }
   }

   showDialogOpt(BuildContext context){
    return showDialog(context: context, builder: (context)=> SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: ()=>videoPick(ImageSource.camera,context),
          child:const Text("Camera"),
        ),
         SimpleDialogOption(
          onPressed: ()=>videoPick(ImageSource.gallery,context),
          child:const Text("Gallery"),
        ),
         SimpleDialogOption(
          onPressed: ()=>Get.back(),
          child:const Text("Close"),
        )
      ],
    ));
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()=>showDialogOpt(context),
          child: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              color: buttomColor
            ),
            child:const Center(
              child:  Text("Add Video",style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      ),
    );
  }
}