
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:titok_clone/model/video.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController{
  static UploadVideoController instance = Get.find();
  var   uuid=const Uuid();

 Future<File> _getThumb(String videoPath)async{
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }
  
 Future<String> _uploadVideoThumbToStorage(String id,String videoPath)async{
    Reference reference= FirebaseStorage.instance.ref().child("thubmnail").child(id);
    UploadTask uploadTask= reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot= await uploadTask;
    String downloadUrl= await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  //Main video upload
  //video to storage
  //video compress
  //video thumb gen
  //video thumb to storage
  uploadVideo(String songName,String caption,String videoPath)async{
    
    try{

    String uid= FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userDoc= await FirebaseFirestore.instance.collection("users").doc(uid).get();

    //videoid - uuid
    String id= uuid.v1();
   String videoUrl= await _uploadVideoToStorage(id,videoPath);
    String thumbnail=await _uploadVideoThumbToStorage(id,videoPath);

    Video video = Video(userName: (userDoc.data()! as Map<String,dynamic>)['name'], uid: uid, thumbnail: thumbnail, caption: caption, commentsCount: 0, id: id, likes: [], profilePic: (userDoc.data()! as Map<String,dynamic>)['profilePic'], shareCount: 0, songName: songName, videoUrl: videoUrl);
    await FirebaseFirestore.instance.collection("videos").doc(id).set(video.toJson());
    Get.snackbar("Video Uploaded Successfully", "Thank you sharing your content");
    Get.back();
    }catch(e){
      Get.snackbar("Error Uploading Video", e.toString());
    }
  }


 Future<String> _uploadVideoToStorage(String videoId,String videoPath)async{
    Reference reference= FirebaseStorage.instance.ref().child("videos").child(videoId);
    UploadTask uploadTask= reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot= await uploadTask;
    String downloadUrl= await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(String videoPath)async{
    final compressVideo=await VideoCompress.compressVideo(videoPath,quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }
}