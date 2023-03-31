import 'package:flutter/material.dart';
import 'messageDetail.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List messageList = [
    {
      "avatar":
          "https://img1.baidu.com/it/u=2501886897,209737142&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
      "name": "系统通知",
      "date": "2023-03-23",
      "message": "您是需要改善还是看学区呢？",
      "status": "false"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=3814667313,3000795201&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "name": "A",
      "date": "2023-03-23",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=2033560038,2705926360&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=1000",
      "name": "B",
      "date": "2023-03-23",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=3558302342,4178626602&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=682",
      "name": "C",
      "date": "2023-03-23",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=3814667313,3000795201&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "name": "D",
      "date": "2023-03-22",
      "message": "在吗",
      "status": "false"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=2033560038,2705926360&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=1000",
      "name": "E",
      "date": "2023-03-21",
      "message": "在吗",
      "status": "false"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=3558302342,4178626602&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=682",
      "name": "F",
      "date": "2023-03-20",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img1.baidu.com/it/u=1968972138,2369028845&fm=253&fmt=auto&app=138&f=GIF?w=200&h=278",
      "name": "G",
      "date": "2023-03-22",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img2.baidu.com/it/u=1565102931,1496232926&fm=253&fmt=auto&app=120&f=JPEG?w=640&h=944",
      "name": "H",
      "date": "2023-03-21",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=102503057,4196586556&fm=253&fmt=auto&app=138&f=BMP?w=500&h=724",
      "name": "I",
      "date": "2023-03-20",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img2.baidu.com/it/u=3640403080,2964819952&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
      "name": "J",
      "date": "2023-03-22",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img1.baidu.com/it/u=2555904807,2390319494&fm=253&fmt=auto&app=138&f=JPEG?w=333&h=500",
      "name": "K",
      "date": "2023-03-21",
      "message": "在吗",
      "status": "true"
    },
    {
      "avatar":
          "https://img0.baidu.com/it/u=618736129,972855535&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500",
      "name": "L",
      "date": "2023-03-20",
      "message": "在吗",
      "status": "true"
    }
  ];

  @override
  void initState() {
    super.initState();
    messageList = messageList.asMap().keys.map((e) {
      messageList[e]['background'] = "false";
      return messageList[e];
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "消息",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: messageList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: messageList[index]['background'].startsWith("true")
                  ? BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                    )
                  : const BoxDecoration(),
              child: InkWell(
                highlightColor: Colors.transparent,
                radius: 0,
                onTap: () {
                  messageList = messageList.asMap().keys.map((e) {
                    if (e == index) {
                      messageList[e]['background'] = 'true';
                    } else {
                      messageList[e]['background'] = 'false';
                    }
                    return messageList[e];
                  }).toList();
                  messageList[index]['status'] = 'false';
                  setState(() {});
                  int count = 0;
                  for(int i = 0; i < messageList.length;i++) {
                    if(messageList[i]['status'] == 'true') {
                      count += 1;
                    }
                  };
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MessageDetail(item: messageList[index],count:count),
                    ),
                  ).then((value) {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      messageList[index]['background'] = "false";
                      setState(() {});
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 头像
                          Stack(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                //超出部分，可裁剪
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Image.network(
                                  messageList[index]['avatar'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              messageList[index]['status'].startsWith("true")
                                  ? Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        messageList[index]['name'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        messageList[index]['date'],
                                        style: const TextStyle(
                                          color: Color(0xff888889),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  messageList[index]['message'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xff888889),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 56, top: 16),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xffE6E6E8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
