import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class LoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.33,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              image: AssetImage("assets/image/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: kDefaultPadding,
            child: Text('WELCOME',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: size.width * 0.09)),
          )
        ],
      ),
    );
  }
}
