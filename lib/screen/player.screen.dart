/*


import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late VideoPlayerController videoPlayerController;
 ChewieController? chewieController;

  @override
  void initState(){
    // //_controller = VideoPlayerController.asset("D:\test")..
    // initialize().then((_){
    //  setState(() {
    //
    //  });
    // });

 //   _controller!.play();
    _initPlayer();
    super.initState();
  }

  void _initPlayer() async{
    VideoPlayerController.network("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4");
    await videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
            autoPlay: true,
            looping: true

    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: content(),
    );
  }
  Widget
  // Widget content(){
  //   return Center(
  //     child: Container(
  //       width: 350,
  //       height: 350,
  //       child: _controller!.value.isInitialized? VideoPlayer(_controller!):Container()
  //     ),
  //   );
  // }
}
*/
import 'package:first_call_app/common/api_common.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../model/transaction.model.dart';
import '../service/network.service.dart';
import 'dashboard.screen.dart';

/*void main() {
  ShowVideoModel? video;
  runApp( MyApp(video: video,));
}*/

class MyApp extends StatelessWidget {
  ShowVideoModel? video;
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  MyApp({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        video: video,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const name = "/myhomepage";
  ShowVideoModel? video;
  MyHomePage({Key? key, required this.video}) : super(key: key);

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(video: video /*video: video*/);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({Key? key, required this.video});
  final NetworkService _networkService = Get.find();
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  ShowVideoModel? video;
  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  bool get loading => _loading.value;

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  void _initPlayer() async {
    final data = "${video?.unid}";
    String? phone = _networkService.userId;
    String url = previewVideoButtonUrl;
    // url = "$url${phone!}${"/"}${data}";
    url = url + data;
    print("play video:-$url");
    videoPlayerController = VideoPlayerController.network("${video?.filepath}");
    //   videoPlayerController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await videoPlayerController
      ..initialize().then((value) {
        setState(() {});
      });
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      aspectRatio: 0.6,
      materialProgressColors: ChewieProgressColors(
        playedColor: const Color(0x8E6BED).withOpacity(.9),
        handleColor: Colors.purpleAccent,
        backgroundColor: Colors.white,
        bufferedColor: Colors.white10,
      ),
      placeholder: Container(color: Colors.black),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RxList<ShowVideoModel> Video = RxList<ShowVideoModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor.withOpacity(.9),
        title: const Text("PreviewVideo"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.offNamed(DashboardScreen.name);
            }),
        elevation: 1,
      ),
      body: chewieController != null
          ? Chewie(controller: chewieController!)
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black26,
                valueColor: AlwaysStoppedAnimation<Color>(
                    const Color(0x008e6bed).withOpacity(.9)),
              ),
            ),
    );
  }
}
