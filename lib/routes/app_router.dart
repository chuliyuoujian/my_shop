import 'package:flutter/material.dart';
import 'package:my_shop/pages/Login/login_page.dart';
import 'package:my_shop/pages/Main/main_page.dart';

//返回App组件
Widget getRootWidget() {
  return MaterialApp(initialRoute: '/', routes: getRoutes());
}

//返回路由配置
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
}
