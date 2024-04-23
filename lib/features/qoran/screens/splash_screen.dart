import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../utils/style.dart';
import '../widgets/bottom_tab.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _isConnected;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _initConnectivityListener();
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
    if (_isConnected) {
      // Navigate to the home page
      _navigateToHome();
    }
  }

  void _initConnectivityListener() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        // If internet connectivity is available, navigate to the home page
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomTabBarr(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Style.partOne2(),
    );
  }
}
