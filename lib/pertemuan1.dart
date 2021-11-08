import 'package:flutter/material.dart';


class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration : new InputDecoration(
                labelText: "Tes Input",
                hintText: "Formatnya bos :",
              )
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            TextFormField(
                decoration : new InputDecoration(
                  labelText: "Tes Input 2",
                  hintText: "Formatnya bos :",
                  border : OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5),
                  )
                ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () { },
            child: Text('Save'),
          )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
