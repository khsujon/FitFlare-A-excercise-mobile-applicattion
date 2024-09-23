import 'dart:convert';

import 'package:fitflare/Screens/video_info_page.dart';
import 'package:fitflare/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            children: [
              //HomePage Appbar
              Row(
                children: [
                  Text(
                    'Training',
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              //HomePage Subtitle
              Row(
                children: [
                  Text(
                    'Your program',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageDetail,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => VideoInfoPage());
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: AppColor.homePageIcons,
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //Homepage Suggestion Cards
              Container(
                width: width,
                height: 220,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.gradientFirst.withOpacity(0.8),
                        AppColor.gradientSecond.withOpacity(0.9)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(80),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 15),
                          blurRadius: 20,
                          color: AppColor.gradientSecond.withOpacity(0.2))
                    ]),
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next Workout',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Legs Toning',
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'and Glutes Workout',
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: 20,
                                color: AppColor.homePageContainerTextSmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '60 min',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.homePageContainerTextSmall,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8),
                                  )
                                ]),
                            child: Icon(
                              Icons.play_circle_fill,
                              size: 60,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              //HomePge 2nd Card
              Container(
                height: 180,
                width: width,
                child: Stack(
                  children: [
                    //Stack Card Image
                    Container(
                      width: width,
                      height: 120,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/card.jpg',
                              ),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 40,
                                offset: Offset(8, 10),
                                color:
                                    AppColor.gradientSecond.withOpacity(0.3)),
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(-1, -5),
                                color:
                                    AppColor.gradientSecond.withOpacity(0.3)),
                          ]),
                    ),

                    //Stack Lady Image
                    Container(
                      height: 200,
                      width: width,
                      margin: EdgeInsets.only(right: 200, bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/figure.png',
                          ),
                        ),
                      ),
                    ),

                    //Stack text
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: EdgeInsets.only(left: 140, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You re doing great',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.homePageDetail),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Keep it up\n',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.homePagePlanColor),
                                children: [
                                  TextSpan(text: 'stick to your plan')
                                ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Focus area Text
              Row(
                children: [
                  Text(
                    'Area of focus',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.homePageTitle),
                  )
                ],
              ),

              //Homepage Grid View
              Expanded(
                  child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.builder(
                  itemCount: info.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                    mainAxisSpacing: 5, // Vertical spacing
                    crossAxisSpacing: 5, // Horizontal spacing
                    // childAspectRatio: 0.7, // Adjust this ratio to control item height
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          padding: EdgeInsets.only(bottom: 5),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[index]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: AppColor.gradientSecond
                                        .withOpacity(0.1)),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: AppColor.gradientSecond
                                        .withOpacity(0.1))
                              ]),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[index]['title'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.homePageDetail),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )),
            ],
          )),
    );
  }
}
