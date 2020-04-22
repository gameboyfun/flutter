import 'package:flutter/material.dart';
import '../drawer/CollapsingListTile2.dart';
import '../drawer/theme.dart';

import '../loginpage.dart';
import '../request.dart';
import 'CollapsingListTile.dart';
import 'navigation.dart';

class DrawerM extends StatefulWidget {
  final String name;
  final String picurl;
  final String email;
  final String mngname;
  final String mngemail;
  final String userid;
  DrawerM(this.name, this.picurl, this.email, this.mngemail, this.mngname,this.userid);

  @override
  _DrawerMState createState() =>
      _DrawerMState(name, picurl, email, mngemail, mngname,userid);
}

class _DrawerMState extends State<DrawerM> with SingleTickerProviderStateMixin {
  final String name;
  final String picurl;
  final String email;
  final String mngname;
  final String mngemail;
  final String userid;
  _DrawerMState(
      this.name, this.picurl, this.email, this.mngemail, this.mngname,this.userid);
  double maxWidth = 220;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 10,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            CollapsingListTile2(
              title: name,
              picurl: picurl,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(
                    color: Colors.grey,
                    height: 12,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(
                        () {
                          currentSelectIndex = counter;
                          print(currentSelectIndex);
                          if (currentSelectIndex == 0) {
                            isCollapsed = !isCollapsed;
                            isCollapsed
                                ? _animationController.forward()
                                : _animationController.forward();
                          } else if (currentSelectIndex == 1) {
                            Navigator.of(context).push(
                              new PageRouteBuilder(
                                pageBuilder: (BuildContext context, _, __) {
                                  return new Request(userid);
                                },
                                transitionsBuilder: (_,
                                    Animation<double> animation,
                                    __,
                                    Widget child) {
                                  return new FadeTransition(
                                      opacity: animation, child: child);
                                },
                              ),
                            );
                          } else if (currentSelectIndex == 2) {
                            Navigator.of(context).pushReplacement(
                              new PageRouteBuilder(
                                pageBuilder: (BuildContext context, _, __) {
                                  return new LoginPage();
                                },
                                transitionsBuilder: (_,
                                    Animation<double> animation,
                                    __,
                                    Widget child) {
                                  return new FadeTransition(
                                      opacity: animation, child: child);
                                },
                              ),
                            );
                          }
                        },
                      );
                    },
                    isSelected: currentSelectIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(
                  () {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  },
                );
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 50,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
