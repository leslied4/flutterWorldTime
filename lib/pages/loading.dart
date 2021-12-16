import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recap/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  setWorldTime() async {
    WorldTime instance = WorldTime('Accra', 'Africa/Accra', 'ghana.png');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'success': instance.success
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}
