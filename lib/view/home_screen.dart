import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_componnent.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
          HomePagePoster(size: size, textTheme: textTheme),
          const SizedBox(
            height: 20,
          ),
          HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 37,
          ),
          SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
          HomePageBlogList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 28,
          ),
          SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
          HomePagePodcastList(size: size, bodyMargin: bodyMargin),
          const SizedBox(
            height: 60,
          )
        ]),
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            MyStrings.viewHotestPodcast,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: size.height / 3.5,
        child: ListView.builder(
          itemCount: podcastList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Text(MyStrings.viewHotestBlog, style: textTheme.headline3)
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 0, index == 0 ? bodyMargin : 15, 0),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          })),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
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
