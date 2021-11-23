import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMhs extends StatefulWidget{
  DashboardMhs({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardMhsState createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
          title : Text(widget.title),
        ),
        body : Container(
            child : Center(
              child : Text("Dashboard Mahasiswa",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            )
        )
    );
  }
}
