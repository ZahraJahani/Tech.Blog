import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_componnent.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.avatar.path,
                height: 100,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    Image.asset(Assets.icons.bluepen.path).image,
                    color: SolidColors.seeMore,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    MyStrings.imageProfileEdit,
                    style: textTheme.displaySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "زهرا جهانی",
                style: textTheme.headlineSmall,
              ),
              Text(
                "zahra.jahani.dez@gmail.com",
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 40,
              ),
              TechDivider(size: size),
              InkWell(
                onTap: (() {}),
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                    height: 45,
                    child: Center(
                        child: Text(MyStrings.myFavBlog,
                            style: textTheme.headlineMedium))),
              ),
              TechDivider(size: size),
              InkWell(
                onTap: (() {}),
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                    height: 45,
                    child: Center(
                        child: Text(MyStrings.myFavPodcast,
                            style: textTheme.headlineMedium))),
              ),
              TechDivider(size: size),
              InkWell(
                onTap: (() {}),
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                    height: 45,
                    child: Center(
                        child: Text(MyStrings.logOut,
                            style: textTheme.headlineMedium))),
              ),
              const SizedBox(
                height: 62,
              )
            ],
          ),
        ));
  }
}
