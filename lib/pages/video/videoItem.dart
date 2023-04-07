import 'package:flutter/material.dart';

import 'video.dart';

class VideoItem extends StatefulWidget {
  const VideoItem({super.key});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  List videoUrlList = [
    "https://media.w3.org/2010/05/sintel/trailer.mp4",
    "https://vd2.bdstatic.com/mda-pcfkm9faivp6kvxj/sc/cae_h264/1678978620406858303/mda-pcfkm9faivp6kvxj.mp4?v_from_s=hkapp-haokan-hna&auth_key=1680593245-0-0-daf6a968210897ec1022b75f67b0480a&bcevod_channel=searchbox_feed&pd=1&cd=0&pt=3&logid=3445630721&vid=4160327205297846360&abtest=107353_1&klogid=3445630721",
    "https://vd3.bdstatic.com/mda-nirf54bd53f73h74/sc/cae_h264/1664437501985171305/mda-nirf54bd53f73h74.mp4?v_from_s=hkapp-haokan-hnb&auth_key=1680751925-0-0-ea16e1c687d526c14bd77eda3b1d79ed&bcevod_channel=searchbox_feed&pd=1&cd=0&pt=3&logid=0125306147&vid=10825485020370419231&abtest=107353_1&klogid=0125306147",
    "https://vd3.bdstatic.com/mda-nig1m2av4vsr0h15/sc/cae_h264/1663378838306846812/mda-nig1m2av4vsr0h15.mp4?v_from_s=hkapp-haokan-hnb&auth_key=1680752035-0-0-334ad7f086dc5ccbdc4999e3460229f0&bcevod_channel=searchbox_feed&cd=0&pd=1&pt=3&logid=0235023254&vid=10371222235039990987&abtest=107353_1&klogid=0235023254",
    "https://vd3.bdstatic.com/mda-ndsb2zpsvcf9jk5p/sc/cae_h264_delogo/1651052606310480810/mda-ndsb2zpsvcf9jk5p.mp4?v_from_s=hkapp-haokan-hnb&auth_key=1680752060-0-0-629f0a033b50e9ada3048baf0fd9bcc6&bcevod_channel=searchbox_feed&cd=0&pd=1&pt=3&logid=0260414489&vid=7077772613622763914&abtest=107353_1&klogid=0260414489",
  ];

  Widget _buildItem(BuildContext context, int index) {
    return Video(videoUrl: videoUrlList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videoUrlList.length,
      itemBuilder: _buildItem,
      onPageChanged: (value) {
        if (value == (videoUrlList.length - 1)) {
          for (int i = 0; i < 5; i++) {
            videoUrlList.add(videoUrlList[i]);
          }
        }
        setState(() {});
      },
    );
  }
}
