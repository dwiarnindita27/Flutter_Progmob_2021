import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDosen extends StatefulWidget{
  DashboardDosen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardDosenState createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon : Icon(Icons.add),
            onPressed: (){},
          )
        ],
      ),
      body : Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Nama Dosen"),
                subtitle: Text("NIDN"),
                onLongPress: (){
                  showDialog(context: context,
                      builder: (BuildContext context){
                      return AlertDialog(
                        content: Column(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Edit"),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("Delete"),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    });
                },
              )
            ],
          ),
        )
      )
  );
  }
}
