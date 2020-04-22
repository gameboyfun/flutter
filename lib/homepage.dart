import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './problempage.dart';
import './servicepage.dart';
import './widget.dart';
import './drawer/drawerm.dart';

class Home extends StatefulWidget {
  final String name;
  final String email;
  final String mngname;
  final String mngemail;
  final String picurl;
  final String userid;
  final String reqoffice;

  Home(this.name, this.email, this.mngname, this.mngemail, this.picurl,this.userid,this.reqoffice);

  @override
  _HomeState createState() =>
      _HomeState(name, email, mngname, mngemail, picurl,userid,reqoffice);
}

class _HomeState extends State<Home> {
  ScaffoldState scaffold;

  final String name;
  final String email;
  final String mngname;
  final String mngemail;
  final String picurl;
  final String userid;
  final String reqoffice;
  _HomeState(this.name, this.email, this.mngname, this.mngemail, this.picurl,this.userid,this.reqoffice);
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBar());
  }

  void showSnackBar() {
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Hello $name'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void nextpage(BuildContext context) {
    Navigator.of(context).push(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Problempage(name, email,userid,reqoffice);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  void nextpage2(BuildContext context) {
    Navigator.of(context).push(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Servicepage(name, email, mngname, mngemail,userid,reqoffice);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      backgroundColor: Color(0xFFB0B7BD),
      body: Stack(
        children: <Widget>[
          Builder(
            builder: (BuildContext buildContext) {
              scaffold = Scaffold.of(buildContext);
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'เลือกบริการ',
                            style: TextStyle(
                              fontFamily: 'PrintAble4U',
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(
                            width: 85,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                            width: 250,
                            child: RaisedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.report_problem,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Trouble",
                                    style: TextStyle(
                                      fontFamily: 'PrintAble4U',
                                      color: Colors.white,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                nextpage(context);
                              },
                              color: Color(0xFF348AB9),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 4,
                                  color: Color(0xFF356D8E),
                                ),
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                            width: 250,
                            child: RaisedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.build,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Service",
                                    style: TextStyle(
                                      fontFamily: 'PrintAble4U',
                                      color: Colors.white,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                nextpage2(context);
                              },
                              color: Color(0xFF348AB9),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 4,
                                  color: Color(0xFF356D8E),
                                ),
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          DrawerM(
            name,
            picurl,
            email,
            mngemail,
            mngname,
            userid
          ),
        ],
      ),
      // floatingActionButton: logoutButton(context),
    );
  }
}
