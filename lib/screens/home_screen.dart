import 'package:flutter/material.dart';
import 'package:news_app/screens/screen_tabs/favorites.dart';
import 'package:news_app/screens/screen_tabs/populair.dart';
import 'package:news_app/screens/screen_tabs/whatsnew.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController= TabController(length: 3,vsync: this ,initialIndex: 0 );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 title: const Text("Explore"),
centerTitle : false ,
actions: [
  IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
  IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
],
bottom: TabBar(
  indicatorColor: Colors.white,
  tabs: [
    const Tab(text:"WHAT'S NEW"),
    const Tab(text:"POPULAR"),
    const Tab(text:"FAVORITES"),

  ],
  controller : _tabController
   )
      ),
      drawer:Drawer() ,
      body : Center(
        child: Container(
          child: TabBarView(children: [
        WhatsNEW(),
        Populair(),
        Favorites() ,


          ],
          controller: _tabController,)
        ),
      ),
    );
  }
}