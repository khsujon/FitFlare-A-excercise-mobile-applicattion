import 'dart:convert';

import 'package:fitflare/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  List info = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.gradientFirst.withOpacity(0.9),
          AppColor.gradientSecond,
        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              width: width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColor.secondPageIconColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Legs Toning',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.secondPageTitleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.secondPageTitleColor,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '68 min',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 220,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Resistent band, kettebell',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColor.circuitsColor,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColor.loopColor,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColor.setsColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _listView(),
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

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      itemCount: info.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(var index) {
    return Container(
      height: 130,
      child: Column(
        children: [
          //1st row
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(info[index]['thumbnail']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    info[index]['time'],
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          //second row
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 80; i++)
                    Container(
                      height: 3,
                      width: 3,
                      decoration: BoxDecoration(
                          color: i.isEven ? Color(0xFF839fed) : Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
