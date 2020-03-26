import 'package:flutter/material.dart';
import 'package:go_away_covid19/ui/home/faq/FaqPage.dart';
import 'package:go_away_covid19/ui/home/global/GlobalPage.dart';
import 'package:go_away_covid19/ui/home/map/MapPage.dart';
import 'package:go_away_covid19/ui/home/news/NewsPage.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [GlobalPage(), FaqPage(), NewsPage(), MapPage()];
  Widget currentScreen = GlobalPage();
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab,
      backgroundColor: getBottomNavigationBarColor(),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              "images/tab_icon_global.png",
            ),
            color: currentTab == 0 ? getPrimaryColor() : Color(0xffcccccc),
          ),
          title: Container(
            margin: EdgeInsets.all(8.0),
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              "images/tab_icon_faq.png",
            ),
            color: currentTab == 1 ? getPrimaryColor() : Color(0xffcccccc),
          ),
          title: Container(
            margin: EdgeInsets.all(8.0),
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              "images/tab_icon_news.png",
            ),
            color: currentTab == 2 ? getPrimaryColor() : Color(0xffcccccc),
          ),
          title: Container(
            margin: EdgeInsets.all(8.0),
          ),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              "images/tab_icon_map.png",
            ),
            color: currentTab == 3 ? getPrimaryColor() : Color(0xffcccccc),
          ),
          title: Container(
            margin: EdgeInsets.all(8.0),
          ),
        )
      ],
      onTap: (index) {
        setState(() {
          currentScreen = screens[index];
          currentTab = index;
        });
      },
    );
  }
}