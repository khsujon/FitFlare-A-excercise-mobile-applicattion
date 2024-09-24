import 'dart:convert';

import 'package:fitflare/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  List info = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  var _isPlayingIndex = -1;

  VideoPlayerController? _controller;
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
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: !_playArea
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                    AppColor.gradientFirst.withOpacity(0.9),
                    AppColor.gradientSecond,
                  ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight))
            : BoxDecoration(color: AppColor.gradientSecond),
        child: Column(
          children: [
            //Upper Part
            !_playArea
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 50, left: 30, right: 30),
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
                            const Spacer(),
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
                        const SizedBox(
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
                                    AppColor
                                        .secondPageContainerGradient1stColor,
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
                                  const SizedBox(
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
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 220,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
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
                                  const SizedBox(
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
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: AppColor.secondPageTopIconColor,
                                ),
                              ),
                              const Spacer(),
                              Icon(Icons.info_outline,
                                  size: 20,
                                  color: AppColor.secondPageTopIconColor)
                            ],
                          ),
                        ),

                        //play video over screen
                        _playView(context),

                        //control video
                        _controlView(context),
                      ],
                    ),
                  ),

            //Video info part
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
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
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: AppColor.loopColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColor.setsColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    const SizedBox(
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

  Widget _controlView(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index >= 0 && info.length >= 0) {
                  _initializeVideo(index);
                } else {
                  Get.snackbar("Video", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.error,
                        size: 30,
                        color: Colors.red,
                      ),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        'No videos ahead',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ));
                }
              },
              icon: Icon(
                Icons.fast_rewind,
                size: 35,
                color: Colors.white,
              )),

          //play and pause
          IconButton(
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              },
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 35,
                color: Colors.white,
              )),

          IconButton(
              onPressed: () async {
                final index = _isPlayingIndex + 1;
                if (index <= info.length - 1) {
                  _initializeVideo(index);
                } else {
                  Get.snackbar("Video List", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.error,
                        size: 30,
                        color: Colors.red,
                      ),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        'You have finish watching all the videos',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ));
                }
              },
              icon: Icon(
                Icons.fast_forward,
                size: 35,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(child: CircularProgressIndicator()));
    }
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (_onUpdateControllerTime > 0) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;

    if (controller == null) {
      debugPrint('Controller is null');
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint('Controller is not initialized');
      return;
    }

    final playing = controller.value.isPlaying;

    _isPlaying = playing;
  }

  _initializeVideo(var index) async {
    final controller =
        VideoPlayerController.networkUrl(Uri.parse(info[index]['videoUrl']));

    final Old = _controller;
    _controller = controller;

    if (Old != null) {
      Old.removeListener(_onControllerUpdate);
      Old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        Old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(var index) {
    _initializeVideo(index);
  }

  _listView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      itemCount: info.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            setState(() {
              if (!_playArea) _playArea = true;
            });
          },
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
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info[index]['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
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
          const SizedBox(height: 15),
          //second row
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xFFeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
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
                          color:
                              i.isEven ? const Color(0xFF839fed) : Colors.white,
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
