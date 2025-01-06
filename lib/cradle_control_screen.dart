import 'package:flutter/material.dart';

class CradleControlScreen extends StatefulWidget {
  @override
  _CradleControlScreenState createState() => _CradleControlScreenState();
}

class _CradleControlScreenState extends State<CradleControlScreen> {
  bool isRocking = false;
  double rockingSpeed = 1.0;
  Duration rockingDuration = Duration(minutes: 5);
  bool autoRockingEnabled = false;
  double minSoundLevel = 50.0;
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 23, minute: 59);

  void toggleRocking() {
    setState(() {
      isRocking = !isRocking;
    });
  }

  void toggleAutoRocking() {
    setState(() {
      autoRockingEnabled = !autoRockingEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cradle Control'),
        backgroundColor: Colors.pink[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Manual Controls
            Text(
              'Manual Controls',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: toggleRocking,
                  child: Text(isRocking ? 'Stop Rocking' : 'Start Rocking'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rocking Speed: ${rockingSpeed.toStringAsFixed(1)}'),
                      Slider(
                        value: rockingSpeed,
                        min: 0.5,
                        max: 5.0,
                        divisions: 9,
                        label: rockingSpeed.toStringAsFixed(1),
                        onChanged: (value) {
                          setState(() {
                            rockingSpeed = value;
                          });
                        },
                      ),
                      Text('Rocking Duration: ${rockingDuration.inMinutes} minutes'),
                      Slider(
                        value: rockingDuration.inMinutes.toDouble(),
                        min: 1,
                        max: 60,
                        divisions: 59,
                        label: rockingDuration.inMinutes.toString(),
                        onChanged: (value) {
                          setState(() {
                            rockingDuration = Duration(minutes: value.toInt());
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            // Automation Settings
            Text(
              'Automation Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SwitchListTile(
              title: Text('Enable Automatic Rocking'),
              value: autoRockingEnabled,
              onChanged: (value) {
                setState(() {
                  autoRockingEnabled = value;
                });
              },
            ),
            if (autoRockingEnabled) ...[
              SizedBox(height: 16),
              Text('Trigger Rocking Based on Sound Detection'),
              SizedBox(height: 8),
              Text('Minimum Sound Level: ${minSoundLevel.toStringAsFixed(1)} dB'),
              Slider(
                value: minSoundLevel,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: minSoundLevel.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    minSoundLevel = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text('Scheduled Rocking Time'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Start Time: ${startTime.format(context)}'),
                  ElevatedButton(
                    onPressed: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: startTime,
                      );
                      if (time != null && time != startTime) {
                        setState(() {
                          startTime = time;
                        });
                      }
                    },
                    child: Text('Set Start Time'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('End Time: ${endTime.format(context)}'),
                  ElevatedButton(
                    onPressed: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: endTime,
                      );
                      if (time != null && time != endTime) {
                        setState(() {
                          endTime = time;
                        });
                      }
                    },
                    child: Text('Set End Time'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
