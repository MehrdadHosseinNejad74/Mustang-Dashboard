import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustang_dashboard/constant.dart';
import 'package:mustang_dashboard/screen/dashboard/widget/LockedButton.dart';
import 'package:mustang_dashboard/screen/dashboard/widget/car_detail.dart';
import 'package:mustang_dashboard/screen/dashboard/widget/engine_detail.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  AnimationController _gaugeAnimationController;
  AnimationController _slideController;
  AnimationController _engineFadeController;
  AnimationController _oilFadeController;
  AnimationController _tempFadeController;
  Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();

    //GaugeAnimationController
    _gaugeAnimationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    //SliderAnimationController
    _slideController =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);

    //Fade Animation
    _fadeAnimation = _slideController.drive(Tween<double>(begin: 0, end: 1));

    //engineFadeController
    _engineFadeController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    //oilFadeController
    _oilFadeController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    //tempFadeController
    _tempFadeController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    //When _slideController is done then it starts _engineFadeController
    _slideController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _engineFadeController.forward();
      }
    });

    //When _engineFadeController is done then it starts _oilFadeController
    _engineFadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _oilFadeController.forward();
      }
    });

    //When _oilFadeController is done then it starts _TempFadeController and _gaugeAnimationController
    _oilFadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _tempFadeController.forward();
        _gaugeAnimationController.forward();
      }
    });

    //When all components rendered then start _slideController
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _gaugeAnimationController.dispose();
    _slideController.dispose();
    _engineFadeController.dispose();
    _oilFadeController.dispose();
    _tempFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context, size),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //Km, Image, Traveled...
            CarDetail(
                fadeAnimation: _fadeAnimation,
                slideController: _slideController),
            //Needle, Engine, ...
            EngineDetail(
                engineFadeController: _engineFadeController,
                oilFadeController: _oilFadeController,
                tempFadeController: _tempFadeController,
                gaugeAnimationController: _gaugeAnimationController,
                fadeAnimation: _fadeAnimation,
                slideController: _slideController),
            LockedButton(
              fadeAnimation: _fadeAnimation,
              slideController: _slideController,
            )
          ],
        ),
      ),
    );
  }


  AppBar _buildAppBar(BuildContext context, Size size) {
    return AppBar(
      elevation: 0,
      actions: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(right: kDefaultPadding),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideController.drive(
                    Tween<Offset>(begin: Offset(0.2, 0), end: Offset.zero)),
                child: Text(
                  'INFO',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: size.width * 0.050,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
      leading: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideController
              .drive(Tween<Offset>(begin: Offset(-0.2, 0), end: Offset.zero)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              "assets/icon/Back.svg",
              width: size.width * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
