/**
 * created by Huai 2019/3/27 0027
 * 请求
 * GET
 * var response = await NetUtils.get(urlString, params: {'userName':"kangkang",'passWord':20});
 */
import 'dart:async';
//import 'dart:convert';  // 解码编码
//import 'dart:io';

import 'package:dio/dio.dart';

var dio = new Dio();

class NetUtils {

  static final host = 'http://59.61.72.38:8000/'; // 服务器路径

  static Future post(String url,Map<String,dynamic> params) async{
    var response = await dio.post(url, data: params);
    return response.data;
  }

  static Future get(String path, {Map<String, dynamic> params}) async {
    var response = await dio.get(path, queryParameters: params);
    return response.data;
  }
}
