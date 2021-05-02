import 'package:course_app/constans.dart';
import 'package:course_app/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/menu.svg'),
                Image.asset('assets/images/user.png'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hey Alex,',
              style: kHeadingextStyle,
            ),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff5f5f7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/search.svg'),
                  SizedBox(width: 12),
                  Text(
                    'Search Any Thing You Want',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xfffa0a5ad),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (DetailsScreen()),
                        ),
                      );
                    },
                    child: Container(
                      height: index.isEven ? 200 : 240,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            categories[index].image,
                          ),
                          fit: BoxFit.fill,
                        ),
                        color: Color(0xffcdffff),
                      ),
                      child: Column(
                        children: [
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: kTextColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
