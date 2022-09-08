import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12.46;

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(children: [
          //appbar
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
            height: 13,
          ),
          //poster
          Stack(
            children: [
              Container(
                width: size.width / 1.19,
                height: size.height / 4.2,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: AssetImage(homePagePosterMap["imageAsset"]),
                        fit: BoxFit.cover)),
                foregroundDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                        colors: GradientColors.homePosterCover,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          homePagePosterMap["writer"] +
                              " - " +
                              homePagePosterMap["date"],
                          style: textTheme.subtitle1,
                        ),
                        Row(
                          children: [
                            Text(
                              homePagePosterMap["view"],
                              style: textTheme.subtitle1,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.remove_red_eye_sharp,
                              color: SolidColors.posterSubtitle,
                              size: 17,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "دوازده قدم برنامه نویسی یک دوره ی ...س",
                      style: textTheme.headline1,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //taglist
          SizedBox(
            height: 35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, index == 0 ? bodyMargin : 15, 0),
                    child: Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
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
                        )),
                  );
                })),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: bodyMargin,
              bottom: 8,
            ),
            child: Row(
              children: [
                ImageIcon(
                  Image.asset(Assets.icons.bluepen.path).image,
                  color: SolidColors.seeMore,
                  size: 22,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(myStrings.viewHotestBlog, style: textTheme.headline3)
              ],
            ),
          ),
          //blog list
          SizedBox(
            height: size.height / 4.1,
            child: ListView.builder(
              itemCount: blogList.getRange(0, 5).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //blog item
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: SizedBox(
                    width: size.width / 2.5,
                    height: size.height / 5.4,
                    child: Stack(children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost),
                          )),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTheme.subtitle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
                                  style: textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: SolidColors.posterSubtitle,
                                  size: 17,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          )
        ]),
      )),
    );
  }
}
