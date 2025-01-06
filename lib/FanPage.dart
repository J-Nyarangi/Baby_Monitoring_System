import 'package:flutter/material.dart';

class FanPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FanPage> {
  bool isSwitched = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Fan",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[900],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Turn on fan to soothe your baby...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.orange[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/fan.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select Speed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple[900],
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        title: Text("LOW"),
                        leading: Radio<int>(
                          value: 1,
                          groupValue: val,
                          onChanged: (int? value) {
                            setState(() {
                              if (value != null) {
                                val = value;
                              }
                            });
                          },
                          activeColor: Colors.purple[300],
                        ),
                      ),
                      ListTile(
                        title: Text("MEDIUM"),
                        leading: Radio<int>(
                          value: 2,
                          groupValue: val,
                          onChanged: (int? value) {
                            setState(() {
                              if (value != null) {
                                val = value;
                              }
                            });
                          },
                          activeColor: Colors.purple[500],
                        ),
                      ),
                      ListTile(
                        title: Text("MAXIMUM"),
                        leading: Radio<int>(
                          value: 3,
                          groupValue: val,
                          onChanged: (int? value) {
                            setState(() {
                              if (value != null) {
                                val = value;
                              }
                            });
                          },
                          activeColor: Colors.purple[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "POWER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red[900],
                        ),
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: isSwitched,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.red[200],
                          activeColor: Colors.red[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
