import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(children: [
          //appbar

          //poster
          homePagePoster(size: size, textTheme: textTheme),
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
            height: 37,
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
            height: size.height / 3.5,
            child: ListView.builder(
              itemCount: blogList.getRange(0, 5).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //blog item
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      SizedBox(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
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
                      SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            blogList[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(
            height: 28,
          ),
          //see more

          Padding(
            padding: EdgeInsets.only(right: bodyMargin),
            child: Row(
              children: [
                ImageIcon(
                  Image.asset(Assets.icons.microphone.path).image,
                  color: SolidColors.seeMore,
                  size: 22,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  myStrings.viewHotestPodcast,
                  style: textTheme.headline3,
                )
              ],
            ),
          ),
          // podcast list
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: size.height / 3.5,
              child: ListView.builder(
                itemCount: podcastList.getRange(0, 5).length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width / 2.5,
                          height: size.height / 5.4,
                          child: Stack(children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(blogList[index].imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                foregroundDecoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                )),
                          ]),
                        ),
                        SizedBox(
                            width: size.width / 2.4,
                            child: Text(
                              blogList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ]),
      ),
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
