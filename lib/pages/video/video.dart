import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String videoUrl;
  const Video({super.key, required this.videoUrl});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  // 是否在播放
  bool isPlay = false;
  // 进度条
  double _slidervalue = 0.0;
  // 是否拖动进度条
  bool isDrag = false;

  void videoPlay() {
    _controller = VideoPlayerController.network(//定义连接器内容，这里初学者可能有点难懂下面详细讲
        widget.videoUrl)
      ..initialize().then((a) {
        setState(() {
          _controller.play();
        });
      });
  }

  void _videoListener() {
    if (!isDrag) {
      _slidervalue = _controller.value.position.inMilliseconds /
          _controller.value.duration.inMilliseconds;
      setState(() {});
    }

    var curPosition = _controller.value.position;
    var totalPosition = _controller.value.duration;
    if (curPosition.toString() != "0:00:00.000000" &&
        curPosition == totalPosition) {
      setState(() {
        _controller.play();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    videoPlay();
    _controller.addListener(_videoListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller.removeListener(_videoListener);
  }

  Widget _buildItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.value.isPlaying) {
          _controller.pause();
          isPlay = true;
        } else {
          _controller.play();
          isPlay = false;
        }
        setState(() {});
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      //     这里和上面是联动的，下面详细讲
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            isPlay
                ? const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                : Container(),
            isPlay
                ? Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Slider(
                      // 当前值
                      value: _slidervalue,
                      // 拖动中
                      onChanged: (value) {
                        setState(() {
                          _slidervalue = value;
                        });
                      },
                      // 拖动开始
                      onChangeStart: (value) {
                        setState(() {
                          isDrag = true;
                        });
                      },
                      // 拖动结束
                      onChangeEnd: (value) {
                        setState(() {
                          isDrag = false;
                        });
                        _slidervalue = value;
                        _controller.seekTo(_controller.value.duration * value);
                        setState(() {});
                      },
                      min: 0,
                      max: 1,
                      // label的数量，比如最小0、最大10、divisions是10，那么label的数量就是10
                      // divisions: ,
                      // 拖动时上方会显示当前值
                      label: "$_slidervalue",
                      // 激活的颜色
                      activeColor: Colors.pink,
                      // 未激活的颜色
                      inactiveColor: const Color(0xffE6E6E8),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}
