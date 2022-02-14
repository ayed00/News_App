import 'package:flutter/material.dart';

class PageModel {

   String _title ;
  // ignore: non_constant_identifier_names
   String _Description ;
   IconData _icons ;
   String _images ;

 PageModel(this._title , this._Description ,this._icons , this._images ) ;


String get title => _title ;
String get description => _Description;
IconData get icons => _icons ;
String get images => _images ;



}