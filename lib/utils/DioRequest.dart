import 'package:dio/dio.dart';
import 'package:my_shop/constants/global_constants.dart';

class DioRequest {
  final Dio _dio = Dio();
  DioRequest() {
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = const Duration(
      seconds: GlobalConstants.TIME_OUT,
    );
    _dio.options.sendTimeout = const Duration(
      seconds: GlobalConstants.TIME_OUT,
    );
    _dio.options.receiveTimeout = const Duration(
      seconds: GlobalConstants.TIME_OUT,
    );
    _addInterceptor();
  }
  //添加拦截器
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在发送请求之前做一些事情
          handler.next(options); // 继续发送请求
        },
        onResponse: (response, handler) {
          // 在收到响应数据之前做一些事情
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            // 处理成功响应
            handler.next(response); // 继续处理响应
          } else {
            // 处理错误响应
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          // 在发生错误时做一些事情
          handler.reject(error);
        },
      ),
    );
  }

  get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  //进一步处理返回结果的函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        return data["result"];
      }
      throw Exception(data["msg"] ?? "请求失败");
    } catch (e) {
      throw Exception(e);
    }
  }
}

//单例对象
final dioRequest = DioRequest();
