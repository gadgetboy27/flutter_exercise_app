import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/screens/details_screen.dart';
import 'package:flutter_exercise_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_exercise_app/widgets/category_card.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'widgets/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            //Height of the container is 45% of total screen
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFc0ffee),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFABB2B9),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Hello Let\'s \nExercise',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: 'Diet Recommedation',
                          svgSrc: 'assets/icons/Hamburger.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Pilates',
                          svgSrc: 'assets/icons/Excrecises.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Meditation',
                          svgSrc: 'assets/icons/Meditation.svg',
                          press: () {
                            Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: 'Yoga',
                          svgSrc: 'assets/icons/yoga.svg',
                          press: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

