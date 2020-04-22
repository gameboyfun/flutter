import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './widget.dart';

class Servicepage extends StatefulWidget {
  final String name;
  final String email;
  final String mngname;
  final String mngemail;
  final String userid;
  final String reqoffice;

  Servicepage(this.name, this.email, this.mngemail, this.mngname, this.userid,this.reqoffice);

  @override
  _ServicepageState createState() =>
      _ServicepageState(name, email, mngemail, mngname, userid, reqoffice);
}

class _ServicepageState extends State<Servicepage> {
  @override
  void initState() {
    super.initState();

    reqnameedit.text = name;
    reqforedit.text = name;
    reqofficeedit.text = reqoffice;
    reqname = name;
    reqfor = name;
    reqoffice = reqoffice;
  }

  final String name;
  final String email;
  final String mngname;
  final String mngemail;
  final String userid;
  String reqoffice;
  _ServicepageState(
      this.name, this.email, this.mngemail, this.mngname, this.userid, this.reqoffice);

  String subject;
  String reqname;
  String reqfor;
  String detail;
  File _imageFile;
  String imgpath;
  final FocusNode subjectNode = new FocusNode();
  final FocusNode reqnameNode = new FocusNode();
  final FocusNode reqforNode = new FocusNode();
  final FocusNode reqofficeNode = new FocusNode();
  final FocusNode detailNode = new FocusNode();
  var reqnameedit = TextEditingController();
  var reqforedit = TextEditingController();
  var reqofficeedit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      backgroundColor: Color(0xFFB0B7BD),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            alignment: Alignment(0.0, -0.85),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Service',
                    style: TextStyle(
                      fontFamily: 'PrintAble4U',
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text('Subject : '),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 260,
                          child: TextField(
                            focusNode: subjectNode,
                            maxLines: null,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFB0B7BD),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onChanged: (val) {
                              subject = val;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(reqnameNode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text('Requester Name : '),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 200,
                          child: TextField(
                            controller: reqnameedit,
                            focusNode: reqnameNode,
                            maxLines: null,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFB0B7BD),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onChanged: (val) {
                              reqname = val;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(reqforNode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text('Requested For : '),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 215,
                          child: TextField(
                            controller: reqforedit,
                            focusNode: reqforNode,
                            maxLines: null,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFB0B7BD),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onChanged: (val) {
                              reqfor = val;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(reqofficeNode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text('Requestor Office : '),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 200,
                          child: TextField(
                            controller: reqofficeedit,
                            focusNode: reqofficeNode,
                            maxLines: null,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFB0B7BD),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onChanged: (val) {
                              reqoffice = val;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(reqofficeNode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text('Detail : '),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 325,
                          child: TextField(
                            focusNode: detailNode,
                            maxLines: 5,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFB0B7BD),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onChanged: (val) {
                              detail = val;
                            },
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buildimagesv(context),
                  submitbutsv(context, name, email, subject, reqname, reqfor,
                      reqoffice, detail, userid, imgpath),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          );
        },
      ),
      // floatingActionButton: logoutButton(context),
    );
  }

  Future<void> _getImage(BuildContext context, ImageSource source) async {
    File galleryfile =
        await ImagePicker.pickImage(source: source, maxWidth: 400);

    setState(
      () {
        _imageFile = galleryfile;
        imgpath = _imageFile.path;
      },
    );
    Navigator.pop(context);
    print(imgpath);
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 160.0,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 9.0,
              ),
              Text(
                'Pick an Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 9.0,
              ),
              FlatButton(
                textColor: Color(0xFF348AB9),
                child: Text('Use Camera'),
                onPressed: () {
                  _getImage(context, ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Color(0xFF348AB9),
                child: Text('Use Gallery'),
                onPressed: () {
                  _getImage(context, ImageSource.gallery);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildimagesv(BuildContext context) {
    return Container(
      width: 340,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          OutlineButton(
            borderSide: BorderSide(),
            onPressed: () {
              _openImagePicker(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.camera_alt),
                SizedBox(
                  width: 5.0,
                ),
                Text('Add Image')
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _imageFile == null
              ? Text('Please pick an image.')
              : Image.file(
                  _imageFile,
                  fit: BoxFit.cover,
                ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
