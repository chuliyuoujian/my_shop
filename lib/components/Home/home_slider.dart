import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/viewmodels/home_slider.dart';

class HomeSlider extends StatefulWidget {
  final List<BannerItem> bannerItems;
  const HomeSlider({super.key, required this.bannerItems});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;
    print('teyodebug : bannerItems.length = ${widget.bannerItems.length}');
    return CarouselSlider(
      carouselController: _carouselController,
      items: List.generate(
        widget.bannerItems.length,
        (index) => Image.network(
          widget.bannerItems[index].imageUrl,
          fit: BoxFit.cover, // 图片填充模式
          width: screenWidth,
        ),
      ),
      options: CarouselOptions(
        // 轮播图选项
        height: 300,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5), // 自动播放间隔
        viewportFraction: 1, // 可见区域比例
        initialPage: 0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        width: double.infinity, // 宽度自适应
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          //设置边框
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 8),
            Text("搜索", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        height: 40,
        width: double.infinity, // 宽度自适应
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.bannerItems.length,
            (index) => GestureDetector(
              onTap: () {
                _carouselController.jumpToPage(index);
                setState(() {});
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 6,
                width: index == _currentIndex ? 40 : 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
