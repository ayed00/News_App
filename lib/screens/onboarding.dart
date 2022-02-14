// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:news_app/pagemodel.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
// ignore: non_constant_identifier_names, prefer_collection_literals
  late List<PageModel> pages = <PageModel>[];
  List<Widget> Widgets =  <Widget>[] ;
/*List <String> images=["assets/images/dark.jpg" ,"assets/images/dark2.jpg","assets/images/dark3.jpg"];
List icons =[Icons.ac_unit , Icons.access_alarm , Icons.accessibility_new];*/
//ValueNotifier<int>_pageValueNotifier = ValueNotifier(0);
 final _pageValueNotifier = ValueNotifier<int>(0);
   _addpages() {
    

    pages.add(PageModel(
        'Weclome!',
        'Making friends is easy as waving your hand back and forth in easy step',
        Icons.ac_unit,
        "assets/images/dark.jpg"));
    pages.add(PageModel(
        'Weclome!',
        'Making friends is easy as waving your hand back and forth in easy step',
        Icons.dangerous,
        "assets/images/dark2.jpg"));
    pages.add(PageModel(
        'Weclome!',
        'Making friends is easy as waving your hand back and forth in easy step',
        Icons.padding,
        "assets/images/dark3.jpg"));
  }

  @override
  Widget build(BuildContext context) {

   _addpages();

    return Stack(
      children: [
        Scaffold(
          body: PageView.builder(
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                            pages[index].images,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icons,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -120),
                      ),
                      Transform.translate(
                        child: Text(
                          pages[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        offset: Offset(0, 10),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48, right: 48, top: 20),
                        child: Text(
                          pages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index){
                _pageValueNotifier.value =index ;
            },
            
          ),
        ),
        Transform.translate(
          offset: Offset(0, 175),
          child:  Align(
            alignment: Alignment.center,
          child: _buildCircleIndicator(pages.length),
          ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: ()  {
                  Navigator.push(context,MaterialPageRoute(builder: (context)  {
                      _updateseen();
                      return  HomeScreen();
                     
                  } ,

                  ),
                  );
                },
                child: const Text(
                  "GET STARTED",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, letterSpacing: 1),
                ),
                color: Colors.red.shade900,
              ),
            ),
          ),
        )
      ],
    );
  } 
  _buildCircleIndicator(_length) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: _length,
          currentPageNotifier:_pageValueNotifier,
        ),
      ),
    );
  }
  List <Widget> _drawPageIndicateur (){

     
       for(var i in pages)
      Widgets.add( _drawCircle(Colors.grey));
  
   
     
     
       return Widgets ;
       
      
  
  
  }
Widget _drawCircle (Color color ){
  return  Container(
             margin: const EdgeInsets.only(right :10),
             width: 10,
           decoration: BoxDecoration(
              shape: BoxShape.circle ,
              color: color,
            ),
           );
}

  void _updateseen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
  }
}


