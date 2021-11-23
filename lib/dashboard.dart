import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progmob_2021/dosen/dashboarddosen.dart';
import 'package:flutter_progmob_2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mahasiswa/dashboardMhs.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  final _formkey = GlobalKey<FormState>();

  @override
  void initstate(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
        ),
        drawer: Drawer(
            child : ListView(
                children : <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Dwi Arnindita"),
                    accountEmail: Text("dwindita@si.ukdw.ac.id"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "DA",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Data Dosen"),
                    trailing : Icon(Icons.people),
                    subtitle : Text("Ini menu Dosen"),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardDosen(title: "Dashboard Dosen")),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Data Mahasiswa"),
                    trailing : Icon(Icons.people_outline),
                    subtitle : Text("Ini menu Mahasiswa"),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardMhs(title: "Dashboard Mahasiswa")),
                      );
                    },
                  ),
                  Divider(
                    color : Colors.black,
                    height: 20,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    title: Text("Logout"),
                    trailing : Icon(Icons.exit_to_app),
                    onTap: () async {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setInt("is_login", 0);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: "Halo!",)),
                      );
                    },
                  )
                ]
            )
        ),
        body: Container(
          child : Center(
            child : Text("Dashboard",
                style: TextStyle(
                    fontSize: 20
                )
            ),
          ),
        )
    );
  }
}