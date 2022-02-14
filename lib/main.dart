import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/utilities/app_theme.dart';

import 'screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

main()async {
  
 
 Widget _screen  =  const OnBoarding() ;
   


  Map<String, Object> values = <String, Object>{'counter': 1};
SharedPreferences.setMockInitialValues(values);
  //seen=false ;
  print(values);
if(values=={'counter': 1})
{
  _screen =  const HomeScreen() ;
}else{
  
  _screen =  const OnBoarding() ;
}
    

runApp(NewsApp(_screen));

}



 


class NewsApp extends StatelessWidget {
  Widget Screen ;

  NewsApp(this.Screen, {Key? key}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
   
      
   return MaterialApp(
      theme:AppTheme.appTheme ,
      debugShowCheckedModeBanner: false ,
    home: Screen,
    ) ;
  }
}