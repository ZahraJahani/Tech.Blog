import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 58),
              child: Image.asset(
                Assets.images.avatar.path,
                height: 100,
              ),
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
                  myStrings.imageProfileEdit,
                  style: textTheme.headline3,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "زهرا جهانی",
              style: textTheme.headline4,
            ),
            Text(
              "zahra.jahani.dez@gmail.com",
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            Divider(
              thickness: 0.5,
              color: SolidColors.divider,
              indent: size.width / 5,
              endIndent: size.width / 5,
            )
          ],
        ));
  }
}
