import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatme/features/home/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  UserModel? userdata;
  @override
  void initState() {
    super.initState();
    userdata = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 250.w,
        backgroundColor: Colors.white,
        leading: _appbarLeading(),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Center(
            child: Text("data"),
          )),
          _chatTypeTextform(context),
        ],
      ),
    );
  }

  Row _appbarLeading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        SizedBox(width: 10.w),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Container(
            height: 35.h,
            width: 35.h,
            decoration: const BoxDecoration(),
            child: CachedNetworkImage(imageUrl: userdata!.image!),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userdata!.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "Last seen  10:20 pm",
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        )
      ],
    );
  }

  _chatTypeTextform(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_emotions)),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  ),
                ),
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            ],
          )),
          SizedBox(
            width: 50.w,
            child: MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              shape: const CircleBorder(),
              onPressed: () {},
              child: const Icon(
                Icons.send,
                size: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
