//主页
import 'package:flutter/material.dart';
import 'package:my_shop/components/Home/home_category.dart';
import 'package:my_shop/components/Home/home_hot.dart';
import 'package:my_shop/components/Home/home_morelist.dart';
import 'package:my_shop/components/Home/home_slider.dart';
import 'package:my_shop/components/Home/home_suggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> getSlivers() {
    return [
      //轮播图
      SliverToBoxAdapter(child: HomeSlider()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置分类组件
      SliverToBoxAdapter(child: HomeCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置推荐组件
      SliverToBoxAdapter(child: HomeSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置热门商品组件
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HomeHot()),
              SizedBox(width: 20),
              Expanded(child: HomeHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置更多商品组件
      HomeMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: getSlivers());
  }
}
