import 'dart:convert';

import 'package:flutterapp/api/api_manager.dart';
import 'package:flutterapp/bean/home_article_bean.dart';

typedef NotifyDataChange = Function();

class HomeModel {
  NotifyDataChange notifyDataChange;
  DataBean dataBean;

  HomeModel(NotifyDataChange notifyDataChange) {
    this.notifyDataChange = notifyDataChange;
  }

  void getHomeArticleList(int pageNum) {
    ApiManager.instance
        .request(RequestType.GET, "article/list/$pageNum/json", "",
            success: (dynamic data) {
      if (data != null) {
        dataBean = HomeArticleBean.fromMap(json.decode(data.toString()))?.data;
        notifyDataChange();
      }
    }, fail: (int code, String msg) {
          dataBean = null;
    });
  }
}
