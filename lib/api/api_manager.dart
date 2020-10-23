import 'dart:convert';

import 'package:dio/dio.dart';

typedef Success = Function(dynamic data);
typedef Fail = Function(int code, String msg);
class ApiManager {
  static Dio _dio;

  static const String API_PREFIX = "https://www.wanandroid.com/";
  static const int _CONNECT_TIMEOUT = 10000;
  static const int _SEND_TIMEOUT = 15000;
  static const int _RECEIVE_TIMEOUT = 3000;

  factory ApiManager() => _getInstance();

  static ApiManager get instance => _getInstance();

  static ApiManager _instance;

  static ApiManager _getInstance(){
    if(_instance == null){
      _instance = new ApiManager._internal();
    }
    return _instance;
  }

  ApiManager._internal(){
    if(_dio == null){
      var options = BaseOptions(
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: API_PREFIX,
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        sendTimeout: _SEND_TIMEOUT,
        responseType: ResponseType.plain,
        headers: httpHeaders
      );
      _dio = new Dio(options);
    }
  }
  /// 自定义Header
  Map<String, dynamic> httpHeaders = {
    'Accept': 'application/json,*/*',
    'Content-Type': 'application/json',
    'token': ""
  };

  Map<String, dynamic> parseData(String data) {
    return json.decode(data) as Map<String, dynamic>;
  }

  Future request(RequestType requestType,String path,dynamic params,{Success success,Fail fail}) async{
    try{
      Response response = await _dio.request(path,data:params,options: Options(method: RequestTypeValues[requestType]));
      if(response != null){
        if(success != null){
          success(response.data);
        }else{
          fail(response.statusCode,response.statusMessage);
        }
      }
    }on DioError catch(e){

    }

  }
}
enum RequestType { GET, POST, DELETE, PUT, PATCH, HEAD }
const RequestTypeValues = {
  RequestType.GET: "get",
  RequestType.POST: "post",
  RequestType.DELETE: "delete",
  RequestType.PUT: "put",
  RequestType.PATCH: "patch",
  RequestType.HEAD: "head",
};