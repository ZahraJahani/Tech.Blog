import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

import '../gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.images.techbot.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcome, style: textTheme.headline4)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return textTheme.headline1;
                    }
                    return textTheme.subtitle1;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return SolidColors.seeMore;
                    }
                    return SolidColors.primaryColor;
                  }),
                ),
                child: const Text(
                  "بزن بریم",
                )),
          )
        ]),
      ),
    ));
  }
}
