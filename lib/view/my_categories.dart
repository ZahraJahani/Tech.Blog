import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_componnent.dart';
import 'package:tec/my_strings.dart';
import 'package:tec/my_colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techbot.path,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(MyStrings.successfulRegistration,
                      style: textTheme.headlineMedium),
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی",
                        hintStyle: textTheme.headlineMedium),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(MyStrings.chooseCats, style: textTheme.headlineMedium),
                  //taglist
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 108,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: tagList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.3),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                setState(() {
                                  if (!selectedTags.contains(tagList[index])) {
                                    selectedTags.add(tagList[index]);
                                  } else {
                                    print(
                                        "${tagList[index].title} رو قبلا انتخابش کردی");
                                  }
                                });
                              }),
                              child: MainTags(
                                textTheme: textTheme,
                                index: index,
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    Assets.images.downArrow.path,
                    scale: 3,
                  ),
                  //selected tags
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 108,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: selectedTags.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.29),
                          itemBuilder: (context, index) {
                            return Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    color: SolidColors.surface),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        selectedTags[index].title,
                                        style: textTheme.headlineMedium,
                                      ),
                                      InkWell(
                                        onTap: (() {
                                          setState(() {
                                            selectedTags.removeAt(index);
                                          });
                                        }),
                                        child: const Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          }),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
