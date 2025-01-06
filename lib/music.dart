import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class MusicPage extends StatefulWidget {
  @override
  _Mstate createState() => _Mstate();
}

class _Mstate extends State<MusicPage> {
  String dropdownvalue = "Rock-A-Bye Baby"; 
  String check = "-1";
  String state = ""; 
  var items = ["Rock-A-Bye Baby", "Twinkle Twinkle Little Star", "Hush Little Baby"];
  double _volume = 0.5; 

  @override
  void initState() {
    super.initState();
    VolumeController().setVolume(_volume);

    VolumeController().getVolume().then((volume) {
      setState(() {
        _volume = volume;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        elevation: 0,
        title: Text("Music", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Play some music to soothe your baby...",
                  style: TextStyle(fontSize: 22, color: Colors.purple[900], fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/music.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      value: dropdownvalue,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) { 
                        if (newValue != null) {
                          setState(() {
                            dropdownvalue = newValue;
                            check = newValue;
                          });
                        }
                      },
                      hint: Text(
                        "Select a Song",
                        style: TextStyle(
                          color: Colors.purple[800],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.purple[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      icon: Icon(Icons.arrow_drop_down_circle, color: Colors.purple[800]),
                      isExpanded: true,
                      dropdownColor: Colors.purple[50],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 60,
                      color: Colors.green[700],
                      icon: Icon(Icons.play_circle_fill),
                      onPressed: () {
                        // Logic to play music
                      },
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      iconSize: 60,
                      color: Colors.red[700],
                      icon: Icon(Icons.stop_circle),
                      onPressed: () {
                        // Logic to stop music
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Slider(
                  value: _volume,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  activeColor: Colors.purple[700],
                  inactiveColor: Colors.grey[300],
                  onChanged: (double newVolume) {
                    setState(() {
                      _volume = newVolume;
                      VolumeController().setVolume(newVolume);
                    });
                  },
                ),
                Text(
                  "Volume",
                  style: TextStyle(
                    color: Colors.purple[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
