import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class LockedButton extends StatelessWidget {
  const LockedButton({
    Key key,
    @required Animation fadeAnimation,
    @required AnimationController slideController,
  })  : _fadeAnimation = fadeAnimation,
        _slideController = slideController,
        super(key: key);

  final Animation _fadeAnimation;
  final AnimationController _slideController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideController
            .drive(Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)),
        child: Container(
          margin: EdgeInsets.all(kDefaultPadding),
          height: size.height * 0.08,
          width: size.width * 0.7,
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-2, -2),
                    color: Colors.white24,
                    blurRadius: 5),
                BoxShadow(
                    offset: Offset(2, 2), color: Colors.black54, blurRadius: 1)
              ]),
          child: Center(
            child: Text('LOCKED',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.055,
                    color: kAccentColor)),
          ),
        ),
      ),
    );
  }
}