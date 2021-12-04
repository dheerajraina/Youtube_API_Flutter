// String inprocess="inprocess";

import 'package:flutter/material.dart';

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class VideoScreen extends StatefulWidget {
  // const VideoScreen({ Key? key }) : super(key: key);
   String videoID='';
   List playlist=[];

  VideoScreen({this.videoID =''});

 

  @override
  _VideoScreenState createState() => _VideoScreenState();
}




class _VideoScreenState extends State<VideoScreen> {


//  late  YoutubePlayerController _controller;


//   @override

//   void initState(){
//     super.initState();

//       print(widget.videoID)
//     _controller=YoutubePlayerController(
      
//       initialVideoId: widget.videoID,
//       flags: YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         forceHD: true,
//       ),
//       );
      
//   }


late YoutubePlayerController _controller;


@override

void initState(){

  super.initState();

  
      _controller =  YoutubePlayerController(
          initialVideoId: widget.videoID,
          params: YoutubePlayerParams(
              // playlist: widget.playlist, // Defining custom playlist
              startAt: Duration(seconds:1),
              showControls: true,
              showFullscreenButton: true,
              autoPlay: true,
              desktopMode: true,

          ),
      );

      // YoutubePlayerIFrame(
      //     controller: _controller,
      //     aspectRatio: 16 / 9,
      // ),
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(),

      body:
        YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
      ),
      
      
    );
  }
}





