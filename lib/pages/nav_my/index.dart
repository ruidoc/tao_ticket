import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/model/global/app.dart';
import 'package:tao_ticket/model/global/user.dart';
import 'package:tao_ticket/pages/nav_my/custom_scaffold.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class MyIndex extends StatefulWidget {
  @override
  _MyIndexState createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  ScrollController _controller = new ScrollController();
  double _opacity = 0;
  double postop = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      double offset = _controller.offset / 50;
      if (offset < 0) {
        offset = 0;
      } else if (offset > 1) {
        offset = 1;
      }

      if (_controller.offset > 200) {
        postop = 200;
      } else {
        postop = _controller.offset;
      }
      // print(_controller.offset);
      setState(() {
        _opacity = offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel userInfo = Provider.of<UserModel>(context);
    return CostomScaffold(
      title: '我的',
      offset: postop,
      isStack: true,
      opacity: _opacity,
      child: ListView(
        controller: _controller,
        padding: EdgeInsets.all(0),
        children: <Widget>[
          _topView(userInfo),
          _cardWidget(
            child: Container(
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '会员中心',
                        style: TextStyle(
                          color: Color(0xffac8641),
                        ),
                      ),
                      Text(
                        '观影金 191',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 0.5,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '加油升级',
                          style: TextStyle(
                              // fontSize: 14,
                              ),
                        ),
                        Text(
                          '再积394经验可升级>',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _cardWidget(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          GradientText(
                            '\ue932',
                            shaderRect: Rect.fromLTWH(0.0, 0.0, 30.0, 20.0),
                            gradient: LinearGradient(
                                colors: [Color(0xffec6bac), Color(0xffea496d)]),
                            style: TextStyle(
                                fontSize: 30.0, fontFamily: 'Iconfont'),
                          ),
                          _textWrap('电影票'),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          GradientText(
                            '\ue92f',
                            shaderRect: Rect.fromLTWH(0.0, 0.0, 20.0, 20.0),
                            gradient: LinearGradient(
                                colors: [Color(0xfff0bf80), Color(0xffe8963d)]),
                            style: TextStyle(
                                fontSize: 30.0, fontFamily: 'Iconfont'),
                          ),
                          _textWrap('小食'),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          GradientText(
                            '\ue930',
                            shaderRect: Rect.fromLTWH(0.0, 0.0, 20.0, 20.0),
                            gradient: LinearGradient(
                                colors: [Color(0xffaf5ff1), Color(0xff9c56ec)]),
                            style: TextStyle(
                                fontSize: 30.0, fontFamily: 'Iconfont'),
                          ),
                          _textWrap('演出票'),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          _cardWidget(
            title: '我的优惠',
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Iconfont.youhuiquan,
                            size: 28,
                            // color: Color(0xFFeb5789),
                          ),
                          _textWrap('优惠券'),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Iconfont.yingchengka,
                            size: 28,
                            // color: Color(0xFFeeaa45),
                          ),
                          _textWrap('影城卡'),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Iconfont.lipinka,
                            size: 28,
                            // color: Color(0xFF9f58ec),
                          ),
                          _textWrap('礼品卡'),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          _cardWidget(
            title: '我的记录',
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
        ],
      ),
    );
  }

  Widget _topView(UserModel userInfo) {
    return Container(
      // color: Color(0xffabb3c3),
      margin: EdgeInsets.only(
        top: 100,
        bottom: 15,
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        // top: 100,
        // bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: ClipOval(
                  child: Image.network(
                    userInfo.avatar,
                    width: 60,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 7,
                child: Container(
                  padding: EdgeInsets.only(left: 6, right: 6, bottom: 1),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Iconfont.huiyuan11,
                          size: 12, color: Colors.blueGrey[100]),
                      Text(
                        '白银',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              // color: Colors.blue,
              margin: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userInfo.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "关注 0    粉丝 0",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 30,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 14),
                  child: GestureDetector(
                    child: Icon(
                      Iconfont.xiaoxizhongxin,
                      color: Colors.white,
                      size: 23,
                    ),
                    onTap: () {},
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Iconfont.shezhi,
                    color: Colors.white,
                    size: 23,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('setting');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardWidget({String title, Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: EdgeInsets.only(
        left: 13,
        right: 13,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Offstage(
            offstage: title is! String,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 8),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey[100], width: 0.5),
              )),
              child: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child ?? SizedBox()
        ],
      ),
    );
  }

  Widget _textWrap(String title) {
    return Container(
      margin: EdgeInsets.only(
        top: 4,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
