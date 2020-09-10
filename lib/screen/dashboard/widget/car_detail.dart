import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mustang_dashboard/constant/constant.dart';
import 'package:mustang_dashboard/model/car_model.dart';

class CarDetail extends AnimatedWidget {
  final AnimationController slideController;
  final Animation fadeAnimation;
  final Car car;

  CarDetail({@required this.car, this.fadeAnimation, this.slideController})
      : super(listenable: slideController);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.35,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.only(left: kDefaultPadding),
            child: FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideController.drive(
                    Tween<Offset>(begin: Offset(0, 0.1), end: Offset.zero)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.mileage.toStringAsFixed(2)+'Km',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: size.width * 0.11),
                    ),
                    Text(
                      'Traveled',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale:
                      slideController.drive(Tween<double>(begin: 1.1, end: 1)),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(car.imageUrl))),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.width * 0.02,
            child: Padding(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                  position: slideController.drive(
                      Tween<Offset>(begin: Offset(0, -0.2), end: Offset.zero)),
                  child: Text(
                    car.model,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: size.width * 0.10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
