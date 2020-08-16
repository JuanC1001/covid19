import 'package:flutter/material.dart';
class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Principals();
}

class Principals extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: true,
        body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 100),
                FlatButton(onPressed: () => {},
                    child: Container(
                      child: Icon(Icons.phone, size: 100.0, color: Colors.white),
                      height: 300.0,
                      width: 300.0,
                      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                      padding: const EdgeInsets.all(20.0),//I used some padding without fixed width and height
                      decoration: new BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle,// You can use like this way or like the below line
                        //borderRadius: new BorderRadius.circular(30.0),
                        color: Colors.red,
                      ),
                    ),),

                Text("BOTON DE", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
                Text("EMERGENCIA", style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600)),
              ],
            )
        ),
      )
    );
  }
}