//封装一个api 目的是返回业务侧要的数据结构
import 'dart:js_interop';

import 'package:my_shop/constants/global_constants.dart';
import 'package:my_shop/utils/DioRequest.dart';
import 'package:my_shop/viewmodels/home_slider.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  print('teyodebug : getBannerListAPI');
  print('teyodebug : HttpConstants.BANNER_LIST = ${HttpConstants.BANNER_LIST}');
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}
