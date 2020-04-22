import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './widget.dart';

class Subticketdetail extends StatefulWidget {
  final String uniqueid;
  final String path;
  Subticketdetail(this.uniqueid,this.path);
  @override
  _SubticketdetailState createState() => _SubticketdetailState(uniqueid,path);
}

class _SubticketdetailState extends State<Subticketdetail> {
  final String uniqueid; 
  final String path; 
  List data;
  var data2;
  _SubticketdetailState(this.uniqueid,this.path);

  @override
  void initState() {
    super.initState();
    this.getticket(uniqueid);
  }

  Future<void> getticket(uniqueid) async {
    String url = 'http://10.60.1.25/ithelpdesk/api/api/sub_ticket/$uniqueid/ticket_uniqid';
    final response = await http.get(url);
    Map<Object, dynamic> data = jsonDecode(response.body);
    data2 = data['sub_tickets'];
    // if (this.mounted) {
    setState(() {dispose();});
    // print(data2);
    // }
  }

  @override
  Widget build(BuildContext context) {
    getticket(uniqueid);
    return Scaffold(
      appBar: subtaskappbar(context),
      backgroundColor: Color(0xFFB0B7BD),
      body: Stack(
        children: <Widget>[
          // Image.network('http://10.60.1.25:3000/uploads/images_ticket/$path'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: data2 == null ? 0 : data2.length,
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        // Image.network('http://10.60.1.25:3000/uploads/images_ticket/$path'),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              data2[index]['subject'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Problem Type : " + data2[index]['p_title'].toString(),
                        ),
                        Text(
                          "Sub Problem Type : " + data2[index]['sp_title'].toString(),
                        ),
                        Text(
                          "Estimated time : " +
                              data2[index]['estimated_time'].toString(),
                        ),
                        Text(
                          "Responsible : " + data2[index]['responsible'].toString(),
                        ),
                        Text(
                          "Create By : " + data2[index]['create_by'].toString(),
                        ),
                        Text(
                          "Create At : " + data2[index]['create_at'].toString(),
                        ),
                        Text(
                          "Last update : " + data2[index]['last_update'].toString(),
                        ),
                        Text(
                          "Status : " + data2[index]['status'].toString(),
                        ),
                        Text(
                          "Detail : " + data2[index]['details'].toString(),
                        ),
                        Text(
                          "Remark : " + data2[index]['remark'].toString(),
                        ),
                        Text(
                          "Link : " + data2[index]['link'].toString(),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
