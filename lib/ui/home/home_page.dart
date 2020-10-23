import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/home_article_bean.dart';
import 'package:flutterapp/ui/home/home_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeModel homeModel;
  List<DatasBean> datas;
  int pageNum = 0;

  @override
  void initState() {
    print("wxk: init");
    homeModel = HomeModel(() {
      setState(() {
        if(pageNum == 0){
          datas = homeModel?.dataBean?.datas;
        }else{
          datas.addAll(homeModel?.dataBean?.datas);
        }
      });
    });
    pageNum = 0;
    homeModel.getHomeArticleList(pageNum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildSmartRefreshList());
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    pageNum = 0;
    homeModel.getHomeArticleList(pageNum);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    pageNum ++ ;
    homeModel.getHomeArticleList(pageNum);
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }

  Widget _buildSmartRefreshList() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else {
            body = Text("没有更多数据了");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: datas?.length ?? 0,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider();
          }
          return ListTile(
            title: Text(datas[index].author),
            leading: Text(datas[index].niceDate),
            trailing: Text(datas[index].chapterName),
          );
        },
        itemExtent: 100.0,
      ),
    );
  }
}
