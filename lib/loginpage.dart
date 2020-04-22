import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ScaffoldState scaffold;
  String username = '';
  String password = '';
  String name;
  String email;
  String mngname;
  String mngemail;
  String picurl;
  String userid;
  String reqoffice;

  final FocusNode _firstInputFocusNode = new FocusNode();
  final FocusNode _secondInputFocusNode = new FocusNode();

  void nextpage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return new Home(name, email,mngname,mngemail,picurl,userid,reqoffice);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  void showSnackBar() {
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          'Login Failed, Invalid Username/Password Please check again !!!',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    return Scaffold(
      backgroundColor: Color(0xFFB0B7BD),
      body: Builder(
        builder: (BuildContext buildContext) {
          scaffold = Scaffold.of(buildContext);
          return Center(
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xFFB0B7BD),
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "logo.jpeg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 45.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF356D8E),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                          color: Color(0xFF348AB9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffCBD0D9),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        // loginpic(context),
                                        Container(
                                          child: Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: TextField(
                                                    focusNode:
                                                        _firstInputFocusNode,
                                                    obscureText: false,
                                                    style: style,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFB0B7BD),
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              20.0,
                                                              15.0,
                                                              20.0,
                                                              15.0),
                                                      hintText: "Username",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32.0),
                                                      ),
                                                    ),
                                                    onChanged: (val) {
                                                      username = val;
                                                    },
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    onEditingComplete: () =>
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                _secondInputFocusNode),
                                                  ),
                                                ),
                                                SizedBox(height: 25.0),
                                                Container(
                                                  child: TextField(
                                                    focusNode:
                                                        _secondInputFocusNode,
                                                    obscureText: true,
                                                    style: style,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFB0B7BD),
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              20.0,
                                                              15.0,
                                                              20.0,
                                                              15.0),
                                                      hintText: "Password",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32.0),
                                                      ),
                                                    ),
                                                    onChanged: (val) {
                                                      password = val;
                                                    },
                                                    textInputAction:
                                                        TextInputAction.done,
                                                  ),
                                                ),
                                                SizedBox(height: 20.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: RaisedButton(
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: style.copyWith(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    );
                                    await login(username, password);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> login(String username, String password) async {
    const url = 'https://api.mitrphol.com:3001/authentication/login';
    final response = await http.post(
      url,
      headers: {
        'App-Key':
            'c4oaP5hFqLYM7Z8tSeGG.WwuulZwkSVPUoeKH7AwKxyyhxKhEsbimWrC6rf9yJvxFyS6o0rr.bnxHRZH7Zc-Hw',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'username': username,
        'password': password,
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      print(data['success']['message']);
      name = data['success']['data']['user_info']['fullname']['en'];
      email = data['success']['data']['user_info']['email'];
      mngname = data['success']['data']['commander_info']['commander']['fullname']['en'];
      mngemail = data['success']['data']['commander_info']['commander']['email'];
      picurl = data['success']['data']['user_info']['photo'];
      userid = data['success']['data']['user_info']['id'];
      reqoffice = data['success']['data']['job_info']['company']['branch']['name'];
      nextpage(context);
      } else {
      showSnackBar();
      print('login failed');
      throw Exception('Login Failed!!');
    }
  }
}
