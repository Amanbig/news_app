import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'News.dart';
import 'mainscreen.dart'; // Make sure this import points to the correct file

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    navigateToNews();
  }

  Future<void> navigateToNews() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(cate: "top",)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
