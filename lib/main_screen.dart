import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/my_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu),
              Image.asset(
                Assets.images.logo.path,
                height: size.height / 13.6,
              ),
              const Icon(Icons.search)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Stack(
            children: [
              Container(
                  width: size.width / 1.19,
                  height: size.height / 4.2,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          image: (Image.asset(Assets.images.programming.path)
                              .image),
                          fit: BoxFit.cover))),
              Container(
                  width: size.width / 1.19,
                  height: size.height / 4.2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          colors: gradientColors.homePosterCover,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)))
            ],
          )
        ]),
      )),
    );
  }
}
