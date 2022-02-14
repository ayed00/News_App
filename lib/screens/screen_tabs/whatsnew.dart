import 'package:flutter/material.dart';

class WhatsNEW extends StatefulWidget {
  const WhatsNEW({ Key? key }) : super(key: key);

  @override
  _WhatsNEWState createState() => _WhatsNEWState();
}

class _WhatsNEWState extends State<WhatsNEW> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child : Column(children: [
          _drawheader(),
      ],)
    );
  }
  Widget _drawheader(){
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height*0.25,
      decoration: const BoxDecoration(image: DecorationImage(
        image: ExactAssetImage('assets/images/dark.jpg'),
        fit: BoxFit.cover)
      ),
   child: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
      Text("test"),
      Text("lfqfqf"),
     ],)
     ),   
    );

  }
}