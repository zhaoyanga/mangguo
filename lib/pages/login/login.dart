import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Totas.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 计数参数
  final duration = 60;
  int num = 0;
  void _countdown() async {
    num = duration;
    for (int i = 0; i < duration; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (mounted == true) {
          setState(() {
            num--;
          });
          if (num == 0) {}
        }
      });
    }
  }

  // 手机号验证
  final Map phoneRule = {
    "isShow": false,
    "message": "",
  };
  // 验证么验证
  final Map codeRule = {
    "isShow": false,
    "message": "",
  };
  // 复选框同意
  bool checkChange = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildView() {
    // 输入框边框样式
    const inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 33,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "手机快捷登录",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff222229),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "未注册的手机号将自动创建账号",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff888889),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            // controller: _unameController,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                width: 64,
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  '手机号',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(top: 3),
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                            ),
                          ),
                          phoneRule['isShow']
                              ? Text(phoneRule['message'])
                              : const SizedBox(),
                          const SizedBox(height: 16),
                          TextFormField(
                            // controller: _pwdController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                width: 64,
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  '验证码',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                              suffixIcon: TextButton(
                                child: Text(
                                  num == 0 ? "获取验证码" : '$num秒',
                                  style: const TextStyle(
                                    color: Color(0xff0FAB6B),
                                  ),
                                ),
                                onPressed: () {
                                  if (num == 0) {
                                    _countdown();
                                  }
                                },
                              ),
                              contentPadding: const EdgeInsets.only(top: 3),
                            ),
                          ),
                          codeRule['isShow']
                              ? Text(codeRule['message'])
                              : const SizedBox(),
                          const SizedBox(height: 16),
                          // 隐私声明
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        value: checkChange,
                        checkColor: Colors.white,
                        activeColor: const Color(0xff0FAB6B),
                        shape: const CircleBorder(),
                        onChanged: (value) {
                          setState(() {
                            checkChange = !checkChange;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(text: "我已阅读并同意"),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print(1111);
                                },
                              text: "《芒果在线用户服务协议》",
                              style: const TextStyle(
                                color: Color(0xff0FAB6B),
                              ),
                            ),
                            const TextSpan(text: "以及"),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print(222);
                                },
                              text: "《隐私政策》",
                              style: const TextStyle(
                                color: Color(0xff0FAB6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0, right: 16, left: 16),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff0FAB6B)),
                            ),
                            onPressed: () {
                              if (!checkChange) {
                                Toast.show(
                                    context: context, message: "请阅读并确认隐私政策");
                              }
                              // 通过_formKey.currentState 获取FormState后，
                              // 调用validate()方法校验用户名密码是否合法，校验
                              // 通过后再提交数据。
                              // if ((_formKey.currentState as FormState)
                              //     .validate()) {
                              //   //验证通过提交数据
                              // }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "立刻登录",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text("账号密码登录"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text("无法接收验证码？"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("其它登录方式"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("微信"),
                  SizedBox(width: 32),
                  Text("苹果"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "登录",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildView(),
    );
  }
}
