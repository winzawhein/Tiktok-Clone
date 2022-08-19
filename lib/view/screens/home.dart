import 'package:flutter/material.dart';
import 'package:titok_clone/constant.dart';
import 'package:titok_clone/view/widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
 const  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroungColor,
        onTap: (index){
          setState(() {
            pageIdx = index;
          });
        },
        currentIndex: pageIdx,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 25,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 25,),label: 'Search'),
          
          BottomNavigationBarItem(icon: CustomAddIcon(),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message,size: 25,),label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.people,size: 25,),label: 'Profile'),
        ]),
        body: Center(
          child:pageindex[pageIdx],
        ),
    );
  }
}