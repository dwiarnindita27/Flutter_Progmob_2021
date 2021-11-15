import 'package:flutter/material.dart';
import 'package:flutter_progmob_2021/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    children: [
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Misal : Dwi Arniindita",
                          labelText: "Masukkan Nama Lengkap",
                          icon: Icon(Icons.people),
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Tidak Boleh Dikosongkan';
                          }
                          return null;
                        },
                      ),
                      RaisedButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        color: Colors.yellow,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                      RaisedButton(
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        color: Colors.yellow,
                        onPressed: () async {
                          //Navigator.pop(context);
                          SharedPreferences pref = await SharedPreferences.getInstance();
                          await pref.setString("is_login", 1);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Tes Pertemuan 1',)),
                          );
                        },
                      )
                    ]
                )
            )
        )
    );
  }
}