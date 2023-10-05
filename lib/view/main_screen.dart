import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 12.46;
    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Drawer(
              backgroundColor: SolidColors.scaffoldBg,
              child: Padding(
                padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                child: ListView(
                  children: [
                    DrawerHeader(
                        child: Center(
                      child: Image.asset(
                        Assets.images.logo.path,
                        scale: 2.5,
                      ),
                    )),
                    ListTile(
                      title: Text(
                        "پروفایل کاربری",
                        style: textTheme.headlineMedium,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: SolidColors.divider,
                    ),
                    ListTile(
                      title: Text(
                        "درباره تکبلاگ",
                        style: textTheme.headlineMedium,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: SolidColors.divider,
                    ),
                    ListTile(
                      title: Text(
                        "اشتراک گذاری تکبلاگ",
                        style: textTheme.headlineMedium,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: SolidColors.divider,
                    ),
                    ListTile(
                      title: Text(
                        "تکبلاگ در گیت هاب",
                        style: textTheme.headlineMedium,
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: SolidColors.divider,
                    ),
                  ],
                ),
              )),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: SolidColors.scaffoldBg,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                Image.asset(
                  Assets.images.logo.path,
                  height: size.height / 13.6,
                ),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                  child: IndexedStack(index: selectedPageIndex, children: [
                HomeScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ProfileScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin)
              ])),
              BottomNavigation(
                size: size,
                bodyMargin: bodyMargin,
                changeScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                },
              ),
            ],
          )),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: ImageIcon(Image.asset(Assets.icons.home.path).image),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: (() {}),
                  icon: ImageIcon(Image.asset(Assets.icons.add.path).image),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(Image.asset(Assets.icons.profile.path).image),
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
