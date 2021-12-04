import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:focused_youtube/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:focused_youtube/models/video_model.dart';
import 'package:focused_youtube/utilities/keys.dart';


import "package:focused_youtube/pages/home_page.dart";

class APIService{

  
  //converting api service into singleton for keeping track of pages 
  //through out the lifetime of  our app

   APIService._instantiate();

  static final APIService instance =APIService._instantiate();

  


  final String _baseUrl='https://www.googleapis.com';
  //contains string values for next page when paginating our app ,
  //at the end of each page requests to load more related videos
  String _nextPageToken='';

  Future<List<Video>> fetchVideos({required String searchQuery}) async{
    
    searchQuery=searchQuery.trim();
    String _attributes="part=snippet&q=$searchQuery&maxResults=20";
     String _finalUrl= _baseUrl+"/youtube/v3/search?"+_attributes+"&key="+API_KEY;

    //gettingresponse
    // print(_finalUrl);
    final response=await http.get(
      Uri.parse(_finalUrl),
      // headers: {
      //    HttpHeaders.authorizationHeader:API_KEY,
      // }
     
    );

    if(response.statusCode==200){
      // print("Success");

      // print(response.body);
      Map<String, dynamic>data=json.decode(response.body);

     _nextPageToken=data['nextPageToken']?? '';

      List<dynamic> videosJson=data['items'];

      // print("videoJson= ${videosJson['id']['videoId']}");
      // print("videosJson $videosJson");
      //Fetch the first 2 videos from the search results 

      List<Video> videoList =[];
      
      videosJson.forEach(
        (json) => videoList.add(
          // Video.fromMap(json['id']['videoId'])
          Video.fromMap(json),
        ),
        
        
        );
        
        // for(int i=0;i<videoList.length;i++){
        //   print(videoList[i].videoId);
        // }
        // print(videoList[1].videoId);
        return videoList;

        
      

    }else{
      print("error");
      throw json.decode(response.body)['error']['message'];
    }
    
  }
}

// if ()



// class ThisApp extends StatefulWidget {
//   const ThisApp({ Key? key }) : super(key: key);

//   @override
//   _ThisAppState createState() => _ThisAppState();
// }

// class _ThisAppState extends State<ThisApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }