import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: SolidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(200)),
          gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(31, 8, 14, 8),
          child: Row(
            children: [
              ImageIcon(
                Image.asset(
                  Assets.icons.hashtag.path,
                ).image,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 22,
              ),
              Text(
                tagList[index].title,
                style: textTheme.headline2,
              )
            ],
          ),
        ));
  }
}
