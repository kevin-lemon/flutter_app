import 'dart:convert';

import 'package:flutterapp/api/api_manager.dart';
import 'package:flutterapp/models/home_article_bean.dart';

typedef NotifyDataChange = Function();

class HomeModel {
  NotifyDataChange notifyDataChange;
  DataBean dataBean;
  List<DatasBean> homeArticleDatas = new List();
  HomeModel(NotifyDataChange notifyDataChange) {
    this.notifyDataChange = notifyDataChange;
  }

  void getHomeArticleList(int pageNum) {
    ApiManager.instance
        .request(RequestType.GET, "article/list/$pageNum/json", "",
            success: (dynamic data) {
      if (data != null) {
        dataBean = HomeArticleBean.fromMap(json.decode(data.toString()))?.data;
        if(dataBean.datas == null || dataBean.datas.length == 0){
          return;
        }
        if(pageNum == 0){
          homeArticleDatas.clear();
          homeArticleDatas.addAll(dataBean?.datas);
        }else{
          homeArticleDatas.addAll(dataBean?.datas);
        }
        notifyDataChange();
      }
    }, fail: (int code, String msg) {
          dataBean = null;
    });
  }
}
