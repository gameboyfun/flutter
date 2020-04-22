import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'subticketdetail.dart';
import 'widget.dart';

class Request extends StatefulWidget {
  final String userid;
  Request(this.userid);
  @override
  _RequestState createState() => _RequestState(userid);
}

class _RequestState extends State<Request> {
  final String userid;
  _RequestState(this.userid);
  List data;
  var data2;
  List task;

  Future<void> getdata(userid) async {
    String url = 'http://10.60.1.25/ithelpdesk/api/api/ticket/$userid/user';
    final response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    data2 = data['tickets'];
    setState(() {
      alltask();
    });
  }

  alltask() {
    task = [];
    for (int i = 0; i < data2.length; i++) {
      task.add(data2[i]);
    }
    print(task);
  }

  finishtask() {
    task = [];
    for (int i = 0; i < data2.length; i++) {
      if (data2[i]['request_status'] == 'done') {
        task.add(data2[i]);
      }
    }
    print(task);
  }

  pendingtask() {
    task = [];
    for (int i = 0; i < data2.length; i++) {
      if (data2[i]['request_status'] != 'done') {
        task.add(data2[i]);
      }
    }
    print(task);
  }

  @override
  void initState() {
    this.getdata(userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myreqappbar(),
      backgroundColor: Color(0xFFB0B7BD),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: task == null ? 0 : task.length,
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
                        Center(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text(
                                task[index]['subject'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Create at : " + task[index]['create_at'],
                        ),
                        Text(
                          "Request Status : " + task[index]['request_status'],
                        ),
                        Text(
                          "Request Type : " + task[index]['request_type'],
                        ),
                        Text(
                          "Requestor Name : " + task[index]['requestor_name'],
                        ),
                        Text(
                          "Requested For : " + task[index]['requested_for'],
                        ),
                        Text(
                          "Detail : " + task[index]['ticket_detail'],
                        ),
                        Image.network(
                            'http://10.60.1.25/ithelpdesk/api/uploads/images_ticket/' +
                                task[index]['img_path']),
                        RaisedButton(
                          child: Text(
                            'View Subtask',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color(0xFF348AB9),
                          onPressed: () {
                            var uniqueid = task[index]['uniqid'];
                            var path = task[index]['img_path'];
                            Navigator.of(context).push(
                              new PageRouteBuilder(
                                pageBuilder: (BuildContext context, _, __) {
                                  return new Subticketdetail(uniqueid,path);
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
                        )
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
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
        children: [
          SpeedDialChild(
            backgroundColor: Color(0xFF348AB9),
            child: Icon(Icons.assignment_turned_in),
            label: 'Finished Task',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              side: BorderSide(
                color: Color(0xFF356D8E),
                width: 3,
              ),
            ),
            onTap: () {
              setState(() {
                finishtask();
              });
            },
          ),
          SpeedDialChild(
            backgroundColor: Color(0xFF348AB9),
            child: Icon(Icons.assignment_late),
            label: 'Pending Task',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              side: BorderSide(
                color: Color(0xFF356D8E),
                width: 3,
              ),
            ),
            onTap: () {
              setState(() {
                pendingtask();
              });
            },
          ),
          SpeedDialChild(
            backgroundColor: Color(0xFF348AB9),
            child: Icon(Icons.assignment),
            label: 'All Task',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              side: BorderSide(
                color: Color(0xFF356D8E),
                width: 3,
              ),
            ),
            onTap: () {
              setState(() {
                alltask();
              });
            },
          ),
        ],
      ),
    );
  }
}
