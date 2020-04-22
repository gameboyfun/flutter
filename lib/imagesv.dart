import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInputsv extends StatefulWidget {
  final String name;
  final String email;
  final String userid;
  final String subject;
  final String reqname;
  final String reqfor;
  final String reqoffice;
  final String detail;
  final String mngname;
  final String mngemail;
  ImageInputsv(this.name, this.detail, this.email, this.reqfor, this.reqname,
      this.reqoffice, this.subject, this.userid, this.mngemail, this.mngname);

  @override
  _ImageInputsvState createState() => _ImageInputsvState(name, detail, email,
      reqfor, reqname, reqoffice, subject, userid, mngemail, mngname);
  // _ImageInputsvState createState() => _ImageInputsvState();
}

class _ImageInputsvState extends State<ImageInputsv> {
  File _imageFile;
  final String name;
  final String email;
  final String userid;
  final String subject;
  final String reqname;
  final String reqfor;
  final String reqoffice;
  final String detail;
  final String mngname;
  final String mngemail;

  _ImageInputsvState(
      this.name,
      this.detail,
      this.email,
      this.reqfor,
      this.reqname,
      this.reqoffice,
      this.subject,
      this.userid,
      this.mngemail,
      this.mngname);

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400).then(
      (File image) {
        setState(
          () {
            _imageFile = image;
          },
        );
        Navigator.pop(context);
      },
    );
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

  @override
  Widget build(BuildContext context) {
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
          // submitbutsv(context, name, email, subject, reqname, reqfor, reqoffice,
          //     detail, userid, mngemail, mngemail),
        ],
      ),
    );
  }
}
