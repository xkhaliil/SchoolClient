import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StudentScreen extends StatelessWidget {
  static String routeName=(StudentScreen).toString();

  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xFFEAC7C7),
                  expandedHeight: 300.0,
                  centerTitle: true,
                  floating: false,
                  pinned: true,
                  automaticallyImplyLeading:false,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    
                      collapseMode: CollapseMode.parallax,
                      title:
                         Image.asset('images/logo-eliteee.png',  height: 200,alignment: Alignment.center),
           
                      background: Lottie.asset("video/homebg.json", 
                        fit: BoxFit.cover,
                      )),
                ),
                SliverPersistentHeader(
                 
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Color(0xFFA0C3D2),
                      unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                      tabs: _tabs,
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            // ignore: prefer_const_constructors
            body: TabBarView(
               children: const [
                Center(
        child: Text(
      'Profile Page: |nom et prenom| |classe| |changer lenfant| |change password| |report a problem|',              /// Index:0
      style: TextStyle(fontSize: 32),
    )),
    Center(
        child: Text(
      'Cours et travaux page',                     /// Index:1
      style: TextStyle(fontSize: 32),
    )),
    Center(
        child: Text(
      'Annonces page',                      /// Index:2
      style: TextStyle(fontSize: 32),
    )),
               ],
          ),
        ),
      ),
    ),);
  }
}

const _tabs = [
  Tab(icon: Icon(Icons.person), text: "Profile"),
  Tab(icon: Icon(Icons.assignment_outlined), text: "Cours et travaux"),
  Tab(icon: Icon(Icons.newspaper), text: "Annonces"),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
