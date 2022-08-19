
import 'package:flutter/material.dart';

class AlbumRotator extends StatelessWidget {
  String profilePicUrl;
   AlbumRotator({ Key? key ,required this.profilePicUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              gradient:const LinearGradient(colors: [
                Colors.grey,
                Colors.white
              ]),
              borderRadius: BorderRadius.circular(35)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child:const Image(image: 
              // NetworkImage(profilePicUrl)
              NetworkImage("https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png")
              ),
            ),
          )
        ],
      ),
    );
  }
}