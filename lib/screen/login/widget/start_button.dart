import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mustang_dashboard/constant/constant.dart';
import 'package:mustang_dashboard/model/car_model.dart';
import 'package:mustang_dashboard/routing/fade_route.dart';
import 'package:mustang_dashboard/screen/dashboard/screen/dashboard_screen.dart';

class StartButton extends StatefulWidget {
  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _buttonController;
  AudioCache _engineSound;

  @override
  void initState() {
    super.initState();

    //Create Controller
    _buttonController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    //When button animation is done then route to new page
    _buttonController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, FadeRoute(page: Dashboard(car: mustang,)));
      }
    });

    //Pre cache sound
    _engineSound = AudioCache();
    _engineSound.load("audio/Ignition.mp3");
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _buttonController.reset();
    Size size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: () {
          engineSound();
          _buttonController.forward();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.white10,
                    offset: Offset(-1, -1),
                    blurRadius: 0),
                BoxShadow(
                    color: Colors.black54, offset: Offset(1, 1), blurRadius: 0)
              ]),
          width: size.width * 0.32,
          height: size.width * 0.27,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _buttonController,
                builder: (context, child) {
                  return SvgPicture.asset(
                    "assets/image/MustangLogo.svg",
                    color: _buttonController
                        .drive(ColorTween(
                            begin: kWatermarkColor, end: kAccentColor))
                        .value,
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedBuilder(
                animation: _buttonController,
                builder: (context, child) {
                  return Text(
                    'START',
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        color: _buttonController
                            .drive(ColorTween(
                                begin: kWatermarkColor, end: kAccentColor))
                            .value,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void engineSound() {
    _engineSound.play("audio/Ignition.mp3");
  }
}
