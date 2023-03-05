import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';
import './models/models.dart';
import 'dart:convert' as json;
export 'package:lpinyin/lpinyin.dart';
import 'dart:developer' as developer;

class XDContactse extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<XDContactse> {
  List<ContactInfo> contactList = [];
  List<ContactInfo> topList = [];

  @override
  void initState() {
    super.initState();
    topList.add(ContactInfo(
        name: '新的朋友',
        tagIndex: '↑',
        bgColor: Colors.orange,
        iconData: Icons.person_add));
    topList.add(ContactInfo(
        name: '群聊',
        tagIndex: '↑',
        bgColor: Colors.green,
        iconData: Icons.people));
    topList.add(ContactInfo(
        name: '标签',
        tagIndex: '↑',
        bgColor: Colors.blue,
        iconData: Icons.local_offer));
    topList.add(ContactInfo(
        name: '公众号',
        tagIndex: '↑',
        bgColor: Colors.blueAccent,
        iconData: Icons.person));
    loadData();
  }

  List list = [
    {"name": "奥迪"},
    {"name": "阿斯顿・马丁"},
    {"name": "阿尔法・罗密欧"},
    {"name": "ARCFOX"},
    {"name": "AUXUN傲旋"},
    {"name": "爱驰"},
    {"name": "ALPINA"},
    {"name": "AC Schnitzer"},
    {"name": "安凯客车"},
    {"name": "铂驰"},
    {"name": "比德文汽车"},
    {"name": "博郡汽车"},
    {"name": "宝骐汽车"},
    {"name": "北京清行"},
    {"name": "北汽昌河"},
    {"name": "布加迪"},
    {"name": "宾利"},
    {"name": "别克"},
    {"name": "标致"},
    {"name": "比亚迪"},
    {"name": "比速汽车"},
    {"name": "本田"},
    {"name": "奔腾"},
    {"name": "奔驰"},
    {"name": "北汽制造"},
    {"name": "北汽新能源"},
    {"name": "北汽威旺"},
    {"name": "北汽绅宝"},
    {"name": "北汽幻速"},
    {"name": "北汽道达"},
    {"name": "北京"},
    {"name": "保时捷"},
    {"name": "宝沃"},
    {"name": "宝马"},
    {"name": "宝骏"},
    {"name": "巴博斯"},
    {"name": "车驰汽车"},
    {"name": "成功汽车"},
    {"name": "长城"},
    {"name": "长安轻型车"},
    {"name": "长安欧尚"},
    {"name": "长安跨越"},
    {"name": "长安"},
    {"name": "大乘汽车"},
    {"name": "东风・瑞泰特"},
    {"name": "东南"},
    {"name": "东风小康"},
    {"name": "东风风行"},
    {"name": "东风风神"},
    {"name": "东风风光"},
    {"name": "东风风度"},
    {"name": "东风"},
    {"name": "电咖"},
    {"name": "道奇"},
    {"name": "大众"},
    {"name": "大发"},
    {"name": "DS"},
    {"name": "福田乘用车"},
    {"name": "福田"},
    {"name": "福特"},
    {"name": "福汽启腾"},
    {"name": "福迪"},
    {"name": "丰田"},
    {"name": "菲亚特"},
    {"name": "法拉利"},
    {"name": "国机智骏"},
    {"name": "Genesis现代"},
    {"name": "广汽集团"},
    {"name": "广汽新能源"},
    {"name": "国金汽车"},
    {"name": "广汽吉奥"},
    {"name": "广汽传祺"},
    {"name": "光冈"},
    {"name": "观致"},
    {"name": "GMC"},
    {"name": "HYCAN合创"},
    {"name": "汉龙汽车"},
    {"name": "合众汽车"},
    {"name": "红星汽车"},
    {"name": "黄海"},
    {"name": "华泰新能源"},
    {"name": "华泰"},
    {"name": "华颂"},
    {"name": "华骐"},
    {"name": "华普"},
    {"name": "华利"},
    {"name": "华凯"},
    {"name": "红旗"},
    {"name": "恒天"},
    {"name": "悍马"},
    {"name": "汉腾汽车"},
    {"name": "海马"},
    {"name": "海格"},
    {"name": "哈弗"},
    {"name": "哈飞"},
    {"name": "Icona"},
    {"name": "捷达"},
    {"name": "几何汽车"},
    {"name": "钧天"},
    {"name": "捷途"},
    {"name": "君马汽车"},
    {"name": "九龙"},
    {"name": "金旅"},
    {"name": "金龙"},
    {"name": "金杯"},
    {"name": "捷豹"},
    {"name": "江铃集团新能源"},
    {"name": "江铃集团轻汽"},
    {"name": "江铃"},
    {"name": "江淮"},
    {"name": "吉利汽车"},
    {"name": "Jeep"},
    {"name": "Karma"},
    {"name": "克莱斯勒"},
    {"name": "科尼赛克"},
    {"name": "凯翼"},
    {"name": "凯迪拉克"},
    {"name": "开瑞"},
    {"name": "卡威"},
    {"name": "卡升"},
    {"name": "卡尔森"},
    {"name": "KTM"},
    {"name": "雷丁"},
    {"name": "罗夫哈特"},
    {"name": "理想智造"},
    {"name": "领途汽车"},
    {"name": "零跑汽车"},
    {"name": "LITE"},
    {"name": "路特斯"},
    {"name": "路虎"},
    {"name": "陆风"},
    {"name": "陆地方舟"},
    {"name": "领克"},
    {"name": "铃木"},
    {"name": "林肯"},
    {"name": "猎豹汽车"},
    {"name": "莲花汽车"},
    {"name": "力帆汽车"},
    {"name": "理念"},
    {"name": "雷诺"},
    {"name": "雷克萨斯"},
    {"name": "劳斯莱斯"},
    {"name": "兰博基尼"},
    {"name": "Lorinser"},
    {"name": "LOCAL MOTORS"},
    {"name": "迈迈"},
    {"name": "迈莎锐"},
    {"name": "摩根"},
    {"name": "名爵"},
    {"name": "迈凯伦"},
    {"name": "迈巴赫"},
    {"name": "玛莎拉蒂"},
    {"name": "马自达"},
    {"name": "MINI"},
    {"name": "哪吒汽车"},
    {"name": "NEVS国能汽车"},
    {"name": "南京金龙"},
    {"name": "纳智捷"},
    {"name": "欧拉"},
    {"name": "欧尚汽车"},
    {"name": "欧朗"},
    {"name": "欧宝"},
    {"name": "讴歌"},
    {"name": "Polestar"},
    {"name": "帕加尼"},
    {"name": "乔治・巴顿"},
    {"name": "庆铃汽车"},
    {"name": "前途"},
    {"name": "起亚"},
    {"name": "启辰"},
    {"name": "祺智"},
    {"name": "奇瑞"},
    {"name": "全球鹰"},
    {"name": "容大智造"},
    {"name": "瑞麒"},
    {"name": "瑞驰新能源"},
    {"name": "如虎"},
    {"name": "荣威"},
    {"name": "日产"},
    {"name": "思皓"},
    {"name": "SHELBY"},
    {"name": "SERES赛力斯"},
    {"name": "斯柯达"},
    {"name": "斯达泰克"},
    {"name": "斯巴鲁"},
    {"name": "思铭"},
    {"name": "双龙"},
    {"name": "双环"},
    {"name": "世爵"},
    {"name": "上汽大通"},
    {"name": "陕汽通家"},
    {"name": "三菱"},
    {"name": "赛麟"},
    {"name": "萨博"},
    {"name": "SWM斯威汽车"},
    {"name": "smart"},
    {"name": "天际汽车"},
    {"name": "腾势"},
    {"name": "特斯拉"},
    {"name": "泰卡特"},
    {"name": "潍柴汽车"},
    {"name": "威马汽车"},
    {"name": "五十铃"},
    {"name": "五菱汽车"},
    {"name": "沃尔沃"},
    {"name": "蔚来"},
    {"name": "潍柴英致"},
    {"name": "威兹曼"},
    {"name": "威麟"},
    {"name": "WEY"},
    {"name": "新宝骏"},
    {"name": "星途"},
    {"name": "小鹏汽车"},
    {"name": "新特汽车"},
    {"name": "雪铁龙"},
    {"name": "雪佛兰"},
    {"name": "鑫源"},
    {"name": "新凯"},
    {"name": "现代"},
    {"name": "西雅特"},
    {"name": "一汽凌河"},
    {"name": "远程汽车"},
    {"name": "银隆新能源"},
    {"name": "云雀汽车"},
    {"name": "云度"},
    {"name": "裕路"},
    {"name": "御捷"},
    {"name": "驭胜"},
    {"name": "宇通客车"},
    {"name": "永源"},
    {"name": "英菲尼迪"},
    {"name": "依维柯"},
    {"name": "一汽"},
    {"name": "野马汽车"},
    {"name": "众泰"},
    {"name": "中兴"},
    {"name": "中华"},
    {"name": "知豆"},
    {"name": "之诺"}
  ];

  void loadData() async {
    //加载联系人列表
    List _list = (list);
      _list.forEach((v) {
        contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(contactList);
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);

    // add topList.
    contactList.insertAll(0, topList);

    setState(() {});
  }

  Widget getWeChatListItem(
    BuildContext context,
    ContactInfo model, {
    double susHeight = 40,
    Color? defHeaderBgColor,
  }) {
    return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Offstage(
//          offstage: !(model.isShowSuspension == true),
//          child: getSusItem(context, model.getSuspensionTag(),
//              susHeight: susHeight),
//        ),
//        getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor),
//      ],
//    );
  }

  Widget getWeChatItem(
    BuildContext context,
    ContactInfo model, {
    Color? defHeaderBgColor,
  }) {
    DecorationImage? image;
//    if (model.img != null && model.img.isNotEmpty) {
//      image = DecorationImage(
//        image: CachedNetworkImageProvider(model.img),
//        fit: BoxFit.contain,
//      );
//    }
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        child: model.iconData == null
            ? null
            : Icon(
                model.iconData,
                color: Colors.white,
                size: 20,
              ),
      ),
      title: Text(model.name),
      onTap: () {
        // LogUtil.e("onItemClick : $model");
        // Utils.showSnackBar(context, 'onItemClick : ${model.name}');
        developer.log('onItemClick : ${model.name}', level: 4);
      },
    );
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 24}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Theme.of(context).primaryColor,
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AzListView(
        data: contactList,
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          return getWeChatListItem(
            context,
            model,
            defHeaderBgColor: Color(0xFFE5E5E5),
          );
        },
        physics: BouncingScrollPhysics(),
        susItemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          if ('↑' == model.getSuspensionTag()) {
            return Container();
          }
          return getSusItem(context, model.getSuspensionTag());
        },
        indexBarData: ['↑', '☆', ...kIndexBarData],
        indexBarOptions: const IndexBarOptions(
          needRebuild: true,
          ignoreDragCancel: true,
          downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
          downItemDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          indexHintWidth: 120 / 2,
          indexHintHeight: 100 / 2,
          indexHintDecoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/ic_index_bar_bubble_gray.png'),
                  fit: BoxFit.contain,
                ),
              ),
          indexHintAlignment: Alignment.centerRight,
          indexHintChildAlignment: Alignment(-0.25, 0.0),
          indexHintOffset: Offset(-20, 0),
        ),
      ),
    );
  }
}
