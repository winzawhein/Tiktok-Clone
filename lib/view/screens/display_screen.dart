
import 'package:flutter/material.dart';
import 'package:titok_clone/view/widgets/profile_button.dart';
import 'package:titok_clone/view/widgets/tiktok_video_player.dart';

class DisplayVideoScreen extends StatelessWidget {
  const DisplayVideoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
      controller: PageController(initialPage: 0,viewportFraction: 1),
      itemCount: 10,
        itemBuilder: (context,index){
          return Stack(
            children: [
              TikTokVideoPlayer(videoUrl: "https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png",),  
              Container(
                margin: const EdgeInsets.only(bottom:10,left:15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    Text("@Username",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                    Text("My Caption is here"),
                    Text("Song name",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Positioned(
                right: 5,
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileButton(profilePhotoUrl: "aa"),
                       Column(
                        children:const [
                          Icon(Icons.favorite,size: 35,color: Colors.white,),
                          Text("Love",style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                      Column(
                        children:const [
                          Icon(Icons.share,size: 35,color: Colors.white,),
                          Text("Share",style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                      Column(
                        children:const [
                          Icon(Icons.comment,size: 35,color: Colors.white,),
                          Text("Comments",style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      
      ),
    );
  }
}