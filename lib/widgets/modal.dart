import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomModal extends StatefulWidget {
  const CustomModal({super.key});

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {

  late VideoPlayerController   videoPlayerController;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   videoPlayerController = VideoPlayerController.asset("assets/videos/page_loading_video1.mp4");
  //   videoPlayerController.addListener(() { setState(() {
  //
  //   });});
  //   videoPlayerController.setLooping(true);
  //   videoPlayerController.initialize().then((value) => setState(() {}));
  //   videoPlayerController.play();
  // }
  @override
  Widget build(BuildContext context) {
    return

      const AlertDialog(
        backgroundColor:
        Colors.white,
        title: Text(
            "This page is under construction",
            style: TextStyle(
                fontWeight:
                FontWeight.w600,
                fontSize: 20)),
        icon: Icon(
          Icons.construction,
          color: Colors.red,
          size: 30,
        ),
        content: SizedBox(
          height: 100,
          width: 100,
          child: Icon(
              Icons.construction,
              size: 100),
        ),
      );
  }
}
