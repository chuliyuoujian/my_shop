import 'package:flutter/material.dart';
import 'package:my_shop/pages/Cart/cart_view.dart';
import 'package:my_shop/pages/Category/category_view.dart';
import 'package:my_shop/pages/Home/home_view.dart';
import 'package:my_shop/pages/Mine/mine_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "text": "主页",
    },
    {
      "icon": "lib/assets/ic_public_pro.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  List<Widget> getBodyWidgets() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("主页")),
      //避开安全区(手机端上面的摄像头等)
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [...getBodyWidgets()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: getBottomNavigationBarItems(),
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
