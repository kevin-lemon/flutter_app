class HomeArticleBean {
  DataBean data;
  int errorCode;
  String errorMsg;

  static HomeArticleBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    HomeArticleBean homeArticleBeanBean = HomeArticleBean();
    homeArticleBeanBean.data = DataBean.fromMap(map['data']);
    homeArticleBeanBean.errorCode = map['errorCode'];
    homeArticleBeanBean.errorMsg = map['errorMsg'];
    return homeArticleBeanBean;
  }

  Map toJson() => {
    "data": data,
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class DataBean {
  int curPage;
  List<DatasBean> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.curPage = map['curPage'];
    dataBean.datas = List()..addAll(
      (map['datas'] as List ?? []).map((o) => DatasBean.fromMap(o))
    );
    dataBean.offset = map['offset'];
    dataBean.over = map['over'];
    dataBean.pageCount = map['pageCount'];
    dataBean.size = map['size'];
    dataBean.total = map['total'];
    return dataBean;
  }

  Map toJson() => {
    "curPage": curPage,
    "datas": datas,
    "offset": offset,
    "over": over,
    "pageCount": pageCount,
    "size": size,
    "total": total,
  };
}

class DatasBean {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<dynamic> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  static DatasBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DatasBean datasBean = DatasBean();
    datasBean.apkLink = map['apkLink'];
    datasBean.audit = map['audit'];
    datasBean.author = map['author'];
    datasBean.canEdit = map['canEdit'];
    datasBean.chapterId = map['chapterId'];
    datasBean.chapterName = map['chapterName'];
    datasBean.collect = map['collect'];
    datasBean.courseId = map['courseId'];
    datasBean.desc = map['desc'];
    datasBean.descMd = map['descMd'];
    datasBean.envelopePic = map['envelopePic'];
    datasBean.fresh = map['fresh'];
    datasBean.id = map['id'];
    datasBean.link = map['link'];
    datasBean.niceDate = map['niceDate'];
    datasBean.niceShareDate = map['niceShareDate'];
    datasBean.origin = map['origin'];
    datasBean.prefix = map['prefix'];
    datasBean.projectLink = map['projectLink'];
    datasBean.publishTime = map['publishTime'];
    datasBean.realSuperChapterId = map['realSuperChapterId'];
    datasBean.selfVisible = map['selfVisible'];
    datasBean.shareDate = map['shareDate'];
    datasBean.shareUser = map['shareUser'];
    datasBean.superChapterId = map['superChapterId'];
    datasBean.superChapterName = map['superChapterName'];
    datasBean.tags = map['tags'];
    datasBean.title = map['title'];
    datasBean.type = map['type'];
    datasBean.userId = map['userId'];
    datasBean.visible = map['visible'];
    datasBean.zan = map['zan'];
    return datasBean;
  }

  Map toJson() => {
    "apkLink": apkLink,
    "audit": audit,
    "author": author,
    "canEdit": canEdit,
    "chapterId": chapterId,
    "chapterName": chapterName,
    "collect": collect,
    "courseId": courseId,
    "desc": desc,
    "descMd": descMd,
    "envelopePic": envelopePic,
    "fresh": fresh,
    "id": id,
    "link": link,
    "niceDate": niceDate,
    "niceShareDate": niceShareDate,
    "origin": origin,
    "prefix": prefix,
    "projectLink": projectLink,
    "publishTime": publishTime,
    "realSuperChapterId": realSuperChapterId,
    "selfVisible": selfVisible,
    "shareDate": shareDate,
    "shareUser": shareUser,
    "superChapterId": superChapterId,
    "superChapterName": superChapterName,
    "tags": tags,
    "title": title,
    "type": type,
    "userId": userId,
    "visible": visible,
    "zan": zan,
  };
}