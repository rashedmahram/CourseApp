import 'package:course_app/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage('assets/images/ux_big.png'),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                      ),
                      SvgPicture.asset("assets/icons/more-vertical.svg"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        'BestSellers'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Design Thinking",
                    style: kHeadingextStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/person.svg"),
                      Text('15K'),
                      SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset("assets/icons/star.svg"),
                      Text('4.8'),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$20',
                          style: kHeadingextStyle,
                        ),
                        TextSpan(
                          text: '\$70',
                          style: TextStyle(color: kTextColor.withOpacity(.5), decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Content",
                            style: kTitleTextStyle,
                          ),
                          SizedBox(height: 20),
                          CourseContent(
                            classNumber: '01',
                            title: "Welcome to course",
                            time: 4.30,
                          ),
                          CourseContent(
                            classNumber: '01',
                            title: "Intro",
                            time: 4.30,
                          ),
                          CourseContent(
                            classNumber: '01',
                            title: "What is Python?",
                            time: 4.30,
                          ),
                          CourseContent(
                            classNumber: '01',
                            title: "VariablesFunctions",
                            time: 4.30,
                            isDone: false,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 56,
                              width: 80,
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Color(0xFFFfedee),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: SvgPicture.asset('assets/icons/shopping-bag.svg'),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'Buy Now',
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String title;
  final String classNumber;
  final double time;
  final bool isDone;
  const CourseContent({
    Key key,
    this.title,
    this.classNumber,
    this.time,
    this.isDone = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: "$classNumber",
              style: TextStyle(
                color: kTextColor.withOpacity(0.2),
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${time}mins\n",
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.2),
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: "$title",
                      style: TextStyle(
                        color: kTextColor.withOpacity(1),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kGreenColor.withOpacity(isDone ? 1 : 0.2),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
