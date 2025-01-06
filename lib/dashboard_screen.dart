import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_screen.dart';
import 'webview_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String userName;
  final String email;

  const DashboardScreen({Key? key, required this.userName, required this.email})
      : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double? temperature;
  double? humidity;
  double? soundLevel;

  bool _isMusicOn = false;
  bool _isSwingOn = false;

  DatabaseReference? tempRef;
  DatabaseReference? humidityRef;
  DatabaseReference? soundLevelRef;
  DatabaseReference? predictionRef;
  late DatabaseReference musicRef;
  late DatabaseReference swingRef;

  String? _userUid;
  bool _isLoading = true;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _fetchUserUidByEmail();  // Fetch UID using email
  }

  /// Fetch UID by Email from Firebase Realtime Database
  Future<void> _fetchUserUidByEmail() async {
    DatabaseReference usersRef = FirebaseDatabase.instance.ref('users');
    final snapshot = await usersRef.get();

    if (snapshot.exists) {
      Map<dynamic, dynamic> users = snapshot.value as Map<dynamic, dynamic>;
      users.forEach((key, value) {
        if (value['email'] == widget.email) {
          print("Fetched User UID: $key");
          setState(() {
            _userUid = key;
          });
          _initializeDatabaseReferences();
          _listenForData();
        }
      });
    } else {
      print("No users found.");
    }

    setState(() {
      _isLoading = false;  // Stop loading once UID fetch completes
    });
  }

  /// Initialize Firebase Database References After UID is Found
  void _initializeDatabaseReferences() {
    if (_userUid != null) {
      DatabaseReference userRef = FirebaseDatabase.instance.ref('users/$_userUid');
      tempRef = userRef.child('sensors/temperature');
      humidityRef = userRef.child('sensors/humidity');
      soundLevelRef = userRef.child('sensors/soundLevel');
      musicRef = userRef.child('settings/music');
      swingRef = userRef.child('settings/swing');
      predictionRef = userRef.child('predictions/latest');
    }
  }

  /// Listen for Sensor Data and Predictions
  void _listenForData() {
    tempRef?.onValue.listen((event) {
      print("Temperature data: ${event.snapshot.value}");
      if (event.snapshot.value != null) {
        setState(() {
          temperature = double.tryParse(event.snapshot.value.toString());
        });
      }
    });

    humidityRef?.onValue.listen((event) {
      print("Humidity data: ${event.snapshot.value}");
      if (event.snapshot.value != null) {
        setState(() {
          humidity = double.tryParse(event.snapshot.value.toString());
        });
      }
    });

    soundLevelRef?.onValue.listen((event) {
      print("Sound Level data: ${event.snapshot.value}");
      if (event.snapshot.value != null) {
        setState(() {
          soundLevel = double.tryParse(event.snapshot.value.toString());
        });
      }
    });

    predictionRef?.onValue.listen((event) {
      if (event.snapshot.value != null) {
        _showNotification(event.snapshot.value.toString());
      }
    });
  }

  /// Show Notification for Predictions
  Future<void> _showNotification(String prediction) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'prediction_channel',
      'Prediction Notifications',
      channelDescription: 'Notifications for new predictions',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'New Prediction Received',
      prediction,
      platformChannelSpecifics,
    );
  }

  /// Initialize Local Notifications
  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Log Out and Navigate to Login
  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  /// Main UI Build Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _buildHeader(widget.userName),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            _buildSensorRow(),
                            SizedBox(height: 40),
                            _buildDashboardOptions(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildHeader(String userName) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple[400]!, Colors.purple[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Center(
        child: Text(
          "Hello, $userName!",
          style: GoogleFonts.montserrat(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSensorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildDataCard("Temperature", temperature, "°C")),
        SizedBox(width: 10),
        Expanded(child: _buildDataCard("Humidity", humidity, "%")),
        SizedBox(width: 10),
        Expanded(child: _buildDataCard("Sound Level", soundLevel, "dB")),
      ],
    );
  }

  Widget _buildDataCard(String label, double? value, String unit) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(label, style: GoogleFonts.montserrat(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              value != null ? "$value $unit" : "Loading...",
              style: GoogleFonts.montserrat(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardOptions() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildDashboardCard(Icons.music_note, "Music",
            toggle: _isMusicOn, onToggle: _toggleMusic),
        _buildDashboardCard(Icons.sync, "Swing",
            toggle: _isSwingOn, onToggle: _toggleSwing),
        _buildDashboardCard(
  Icons.videocam,
  "Monitor",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WebViewScreen(url: 'http://192.168.0.109'),  // Camera IP address
      ),
    );
  },
),

        _buildDashboardCard(Icons.logout, "Logout", onTap: _logout),
      ],
    );
  }
    /// Toggle music on/off
  void _toggleMusic(bool value) {
    setState(() {
      _isMusicOn = value;
    });
    if (musicRef != null) {
      musicRef.set(value);
    } else {
      print("Music Reference not initialized.");
    }
  }

    void _openMonitor() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const WebViewScreen(url: 'http://192.168.0.109'),
    ),
  );
}



  /// Toggle swing on/off
  void _toggleSwing(bool value) {
    setState(() {
      _isSwingOn = value;
    });
    if (swingRef != null) {
      swingRef.set(value);
    } else {
      print("Swing Reference not initialized.");
    }
  }

  /// Navigate to Monitoring Screen



  /// Builds individual dashboard cards with optional toggle switches
  Widget _buildDashboardCard(
    IconData icon,
    String label, {
    bool? toggle,
    Function(bool)? onToggle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: 140,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.purple[800]),
              SizedBox(height: 12),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (onToggle != null)
                Flexible(
                  child: Switch(
                    value: toggle ?? false,
                    onChanged: onToggle,
                    activeColor: Colors.purple,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

