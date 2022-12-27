import 'package:app/app/data/model/friend.dart';
import 'package:app/app/data/model/user.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MineFriendBox extends StatelessWidget {
  const MineFriendBox({Key? key, required this.friend}) : super(key: key);
  final FriendModel friend;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.toNamed(Routes.FRIEND, arguments: friend),
        child: Container(
            // width: 190.w,
            height: 100.h,
            constraints: BoxConstraints(minWidth: 190.w),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.h)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 75.w + 8,
                      height: 75.w + 8,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          borderRadius: BorderRadius.circular(75.w + 8)),
                      child: ClipOval(
                          child: Image.network(friend.avatar??"",
                              fit: BoxFit.cover,
                              width: 75.w,
                              height: 75.w,

                              errorBuilder: (context, _, __) => Image.asset(
                                  "assets/images/logo1.png",
                                  color: Colors.white,
                                  width: 75.w,
                                  height: 75.w)))),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Text(friend.nickname??"未知用户",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26.sp))),
                        Text(friend.mark??"未知",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 18.sp))
                      ])
                ])));
  }
}
