
// import 'dart:ffi';

// import '../data.dart';


import 'package:flutter/material.dart';
import 'package:focused_youtube/pages/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool searchBtn=false;
  String searchQuery='';
  String centerText='Hello';



  

  
  
  @override
  Widget build(BuildContext context) {
    // print('called');
    // print(searchBtn);
    return Scaffold(
      
      // backgroundColor: Colors.black,

     body:  searchBtn? ResultPage(searchQuery:searchQuery) :getBodySearch(),
    );
  }


  Widget  getBodySearch(){

   if(searchBtn==true && searchQuery.isNotEmpty){
     centerText=searchQuery;
     searchBtn=false;
   } 
     
    
    
    return ListView(
      children: <Widget>[
        Padding(padding: const EdgeInsets.only(left: 2,right: 3,top: 10)),
            

        Container(
          child: Center(
            child: Text(
              "Focused Tube",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),

        Row (
          
          children:<Widget> [
            //  Padding(padding: const EdgeInsets.only(left: 2,right: 3,top: 30)),
              SizedBox(
                width: 30,
                height: 20,
                // child: DecoratedBox(
                  // decoration: BoxDecoration(
                  //    color: Colors.pink,
                  // ),
                  // ),
              ),
            
            Expanded(
              
              child: Padding(
              padding: EdgeInsets.only(left: 1,top: 20,),
              
              child: TextField(
               
                decoration: InputDecoration(
                  // hintStyle: TextStyle(backgroundColor: Colors.black),
                  // focusColor:Colors.red,
                  border: OutlineInputBorder(),
                  hintText: 'Enter your query here',
                ),
                onChanged: (text){
                  // print ("The query is $text");
                  setState(() {
                    searchQuery=text;
                  });
                },
              ),
              ), 
              
              ),
            
            IconButton(
              padding: const EdgeInsets.only(top:20),
              
              
              icon: Icon(
                Icons.search,
                
                color: /*searchBtn? Colors.green :*/ Colors.black,
                size: 30,
                
                ),
                 onPressed: (){
                   setState(() {
                     searchBtn=true;
                   });

                 }, 
              
              ),

             
          ],
          
          ),


          SizedBox(
          width: 70,
          height: 4,
          
          ),


          Container(
          padding: EdgeInsets.all(5),
          // color: Colors.red,
          child: Center(
            child: Text(
              "Search To Begin ",
              style: TextStyle(
                fontSize: 50,
              ),
              ),
          ),
        ),
          
        SizedBox(
          width: 70,
          height: 200,
          
          ),
        
        
        Container(
          padding: EdgeInsets.all(5),
          // color: Colors.red,
          child: Center(
            child: Text(
              "Made with ",
              style: TextStyle(
                fontSize: 20,
              ),
              ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          // color: Colors.red,
          child: Center(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          // color: Colors.red,
          child: Center(
            child: Text(
              "By Dheeraj",
              style: TextStyle(
                fontSize: 20,
              ),
              ),
          ),
        ),
       
      ],

    
    );
  }

  Widget searchTextField(){
    return ListView(
      children: [
        Row(
          children: [
             
          ],
        )
      ],
    );
  }
}


  