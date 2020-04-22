import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './homepage.dart';
import './loginpage.dart';

Widget appbar() {
  return AppBar(
    elevation: 0.0,
    title: Text(
      'PanelPlus HelpDesk',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        fontSize: 30,
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF348AB9),
    bottom: PreferredSize(
      child: Container(
        color: Color(0xFF356D8E),
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0),
    ),
  );
}

Widget myreqappbar() {
  return AppBar(
    elevation: 0.0,
    title: Text(
      'My Request',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        fontSize: 30,
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF348AB9),
    bottom: PreferredSize(
      child: Container(
        color: Color(0xFF356D8E),
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0),
    ),
  );
}

Widget subticketappbar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    title: Text(
      'Sub Ticket',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        fontSize: 30,
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF348AB9),
    bottom: PreferredSize(
      child: Container(
        color: Color(0xFF356D8E),
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0),
    ),
  );
}

Widget subtaskappbar(BuildContext context) {
  void backpage(BuildContext context) {
    Navigator.of(context).pop(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home('again', 'again', 'again', 'again', 'again', 'again', 'again');
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
    Navigator.of(context).pop(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home('again', 'again', 'again', 'again', 'again', 'again', 'again');
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  return AppBar(
    elevation: 0.0,
    title: Text(
      'Sub Task',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        fontSize: 30,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          backpage(context);
        },
      ),
    ],
    centerTitle: true,
    backgroundColor: Color(0xFF348AB9),
    bottom: PreferredSize(
      child: Container(
        color: Color(0xFF356D8E),
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0),
    ),
  );
}

Widget createsubtaskappbar(BuildContext context) {
  void backpage(BuildContext context) {
    Navigator.of(context).pop(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home('again', 'again', 'again', 'again', 'again', 'again', 'again');
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
    Navigator.of(context).pop(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home('again', 'again', 'again', 'again', 'again', 'again', 'again');
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
    Navigator.of(context).pop(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home('again', 'again', 'again', 'again', 'again', 'again', 'again');
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  return AppBar(
    elevation: 0.0,
    title: Text(
      'Create Sub Task',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        fontSize: 30,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          backpage(context);
        },
      ),
    ],
    centerTitle: true,
    backgroundColor: Color(0xFF348AB9),
    bottom: PreferredSize(
      child: Container(
        color: Color(0xFF356D8E),
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0),
    ),
  );
}

Widget logoutButton(BuildContext context) {
  void logout(BuildContext context) {
    Navigator.of(context).pushReplacement(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new LoginPage();
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  return FloatingActionButton.extended(
    onPressed: () {
      logout(context);
    },
    label: Text(
      'Logout',
      style: TextStyle(
          fontFamily: 'PrintAble4U', color: Colors.white, fontSize: 25),
    ),
    icon: Icon(Icons.exit_to_app),
    backgroundColor: Color(0xFF348AB9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      side: BorderSide(
        color: Color(0xFF356D8E),
        width: 3,
      ),
    ),
  );
}

Widget appbarWithHome(BuildContext context) {
  void backpage(BuildContext context) {
    Navigator.of(context).pop(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home('again', 'again', 'again', 'again', 'again', 'again', 'again');
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  return AppBar(
    title: Text(
      'PanelPlus HelpDesk',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        fontSize: 30,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          backpage(context);
        },
      ),
    ],
    centerTitle: true,
    backgroundColor: Color(0xFF348AB9),
    bottom: PreferredSize(
      child: Container(
        color: Color(0xFF356D8E),
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0),
    ),
  );
}

Widget loginpic(BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Image.asset("user.png"),
            height: 45.0,
          ),
          SizedBox(height: 35.0),
          SizedBox(
            child: Image.asset("key.png"),
            height: 40.0,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    ),
  );
}

alerttb(
  BuildContext context,
  String name,
  String email,
  String subject,
  String reqname,
  String reqfor,
  String reqoffice,
  String detail,
  String userid,
  String imgpath,
) {
  upload(String subject, String reqname, String reqfor, String reqoffice,
      String detail, String userid, String imgpath) async {
    Response response;
    String reqtype = 'trouble';
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap(
      {
        'subject': subject,
        'requestor_name': reqname,
        'requested_for': reqfor,
        'requestor_office': reqoffice,
        'request_type': reqtype,
        'ticket_detail': detail,
        'requestor_id': userid,
        'image': await MultipartFile.fromFile(imgpath)
      },
    );
    response = await dio.post('http://10.60.1.25/ithelpdesk/api/api/ticket/create',
        data: formData);
    print(response);
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new CupertinoAlertDialog(
        title: new Text("Confirm Task"),
        content: new Text(
            "Please check the information before confirm, Do you really want to submit this task?"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop(
                new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new Home(
                        'again', 'again', 'again', 'again', 'again', 'again', 'again');
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("OK"),
            onPressed: () {
              upload(
                  subject, reqname, reqfor, reqoffice, detail, userid, imgpath);
              Navigator.of(context).pop(
                new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new Home(
                        'again', 'again', 'again', 'again', 'again', 'again', 'again');
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
              Navigator.of(context).pop(
                new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new Home(
                        'again', 'again', 'again', 'again', 'again', 'again', 'again');
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return new CupertinoAlertDialog(
                    title: new Text("Task Confirmed"),
                    content: new Text(
                      "The task has been confirmed, and it is pending to take time at your task",
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: new Text(
                          "OK",
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(
                            new PageRouteBuilder(
                              pageBuilder: (BuildContext context, _, __) {
                                return new Home('again', 'again', 'again',
                                    'again', 'again', 'again', 'again');
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
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      );
    },
  );
}

Widget submitbuttb(
  BuildContext context,
  String name,
  String email,
  String subject,
  String reqname,
  String reqfor,
  String reqoffice,
  String detail,
  String userid,
  String imgpath,
) {
  return RaisedButton(
    child: Text(
      'Submit',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
      side: BorderSide(
        color: Color(0xFF356D8E),
        width: 3,
      ),
    ),
    color: Color(0xFF348AB9),
    onPressed: () {
      alerttb(context, name, email, subject, reqname, reqfor, reqoffice, detail,
          userid, imgpath);
    },
  );
}

Widget submitbutsv(
    BuildContext context,
    String name,
    String email,
    String subject,
    String reqname,
    String reqfor,
    String reqoffice,
    String detail,
    // String mngname,
    // String mngemail,
    String userid,
    String imgpath) {
  return RaisedButton(
    child: Text(
      'Submit',
      style: TextStyle(
        fontFamily: 'PrintAble4U',
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
      side: BorderSide(
        color: Color(0xFF356D8E),
        width: 3,
      ),
    ),
    color: Color(0xFF348AB9),
    onPressed: () {
      print('press sv button');
      alertsv(context, name, email, subject, reqname, reqfor, reqoffice, detail,
          // mngname, mngemail, 
          userid, imgpath);
    },
  );
}

alertsv(
    BuildContext context,
    String name,
    String email,
    String subject,
    String reqname,
    String reqfor,
    String reqoffice,
    String detail,
    // String mngname,
    // String mngemail,
    String userid,
    String imgpath) {
  upload(String subject, String reqname, String reqfor, String reqoffice,
      String detail, String userid, String imgpath) async {
    Response response;
    String reqtype = 'service';
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap(
      {
        'subject': subject,
        'requestor_name': reqname,
        'requested_for': reqfor,
        'requestor_office': reqoffice,
        'request_type': reqtype,
        'ticket_detail': detail,
        'user_id': userid,
        'image': await MultipartFile.fromFile(imgpath)
      },
    );
    response = await dio.post('http://10.60.1.25/ithelpdesk/api/api/ticket/create',
        data: formData);
    print(response);
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new CupertinoAlertDialog(
        title: new Text("Confirm Task"),
        content: new Text(
            "Please check the information before confirm, Do you really want to submit this task?"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop(
                new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new Home(
                        'again', 'again', 'again', 'again', 'again', 'again', 'again');
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("OK"),
            onPressed: () {
              upload(
                  subject, reqname, reqfor, reqoffice, detail, userid, imgpath);
              Navigator.of(context).pop(
                new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new Home(
                        'again', 'again', 'again', 'again', 'again', 'again', 'again');
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
              Navigator.of(context).pop(
                new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new Home(
                        'again', 'again', 'again', 'again', 'again', 'again', 'again');
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return new CupertinoAlertDialog(
                    title: new Text("Task Confirmed"),
                    content: new Text(
                      "The task has been confirmed, and it is pending to take time at your task",
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: new Text(
                          "OK",
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(
                            new PageRouteBuilder(
                              pageBuilder: (BuildContext context, _, __) {
                                return new Home('again', 'again', 'again',
                                    'again', 'again', 'again', 'again');
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
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      );
    },
  );
}
