// import 'package:flutter/material.dart';
// import 'package:focused_youtube/models/video_list_model.dart';
// import 'package:focused_youtube/pages/video_screen.dart';
// import 'package:focused_youtube/services/api_services.dart';

// import 'dart:developer';



// import 'dart:html';
import 'dart:ui' as ui;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:focused_youtube/models/video_model.dart';
import 'package:focused_youtube/pages/home_page.dart';
import 'package:focused_youtube/services/api_services.dart';

import 'dart:async';
import 'dart:core';


import 'package:focused_youtube/pages/video_screen.dart';



class ResultPage extends StatefulWidget {
  // const ResultPage({ Key? key }) : super(key: key);
  late String searchQuery='';
  ResultPage({required this.searchQuery,});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  // int index=0;
  // String channeltitle='';

  bool homeBtn=false;

  String thumbnailurl='';
  String videoid='';
  String videotitle='';
  String channeltitle='';
  List   playList=[];

  Future<List<Video>>? _futureVideoList;
  List<Video>? videoList=[];
  @override 
  void initState() {

    super.initState();

    _futureVideoList= APIService.instance.fetchVideos(searchQuery: widget.searchQuery);    

    toList();
    
    
  }

  void toList()async{
   List<Video>? tempList =await _futureVideoList;
    // print(tempList);

    setState(() {
      videoList=tempList;
    });

    

    for(int i=0;i<(int.parse((videoList?.length).toString()));i++){
      if (videoList?[i].videoId==null){
        videoList?.remove(videoList?[i]);
        i=0;
      }
    } 
    // for(int i=0;i<(int.parse((videoList?.length).toString()));i++){
    //   playList.add(videoList?[i].videoId);
    // }
}


    
    
   
  

 _buildVideo(thumbnailurl,videoid,videotitle,channeltitle){
  //  ui.platfo
  //  ui.platformViewRegistry.registerViewFactory(
  //     'videoFrame-html',
  //     (int viewId) => ImageElement()
  //       ..width = 150
  //       ..height = 50
  //       ..src = thumbnailurl);
        // ..style.width = '50');

   return GestureDetector(
     onTap: ()=>Navigator.push(
       context,

       MaterialPageRoute(
         
         builder:(_)=>VideoScreen(videoID: videoid,)),
       ),
    //  onTap: (){
    //    print(videoid);
    //  },

    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      height: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0,1),
            blurRadius: 6,
          ),
        ],
        
      ),
      child: Row(
        children: <Widget>[
          Image(
            width: 150,
         
            image: NetworkImage(thumbnailurl)),
         
         /*if you want to use HtmlElementView */

          // Container(
          //   width: 150,
          //   height: 120,
          //   // color: Colors.red,
          //   child:HtmlElementView(viewType: 'videoFrame-html'),
          //   ),
      /* **********************************************  */  
          SizedBox(
            width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            ),
          ),
           Expanded(
             child: Card(
               child: ListTile(
                  title:Text(
                 videotitle,
                 style: TextStyle(
                 color: Colors.black,
                 fontSize: 20,
               ),
          ),
          subtitle: Text(
            channeltitle
            
          ),
          
          contentPadding:EdgeInsets.all(10),
               ),
               
               
             ),
             
             ),
        ],
      ),
    ),
   );
 }

 backToHome(){
   return Navigator.push(
     context, 
     MaterialPageRoute(builder: (_)=>HomePage()));
 }



  @override
  Widget build(BuildContext context) {
    int videoListLength=int.parse((videoList?.length).toString());
    return Scaffold(

      appBar: AppBar(
        title: Text("Focused Youtube"),
        actions: [
          IconButton(
             icon: Icon(
               Icons.home,
              
              
             ),
             padding: EdgeInsets.only(right: 30),
             onPressed: (){
              //  print("Home");
              backToHome();
             },
            )
        ],
      ),

      body:  ListView.builder(
        itemCount: videoListLength,
        itemBuilder: (context,index){
          
           thumbnailurl= (videoList?[index].thumbnailUrl).toString();
           videoid=(videoList?[index].videoId).toString();
           videotitle=(videoList?[index].title).toString();
           channeltitle=(videoList?[index].channelTitle).toString();
          if(videoid!=null){
            // print("not");
          //   return Card(
          //   child: ListTile(
          //       title: Text(
          //     videoid+' '+thumbnailurl+' '+videotitle,
                
          //     ),
          //     ),
            
             
          // );
          return _buildVideo(thumbnailurl, videoid, videotitle,channeltitle);
          }
          else{
            // print('null');
            return Card(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  ),
              ),
            );
          }
          
        },),
    
   
    );
  }

   
}