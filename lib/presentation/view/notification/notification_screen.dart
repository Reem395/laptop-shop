import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  final String notificationTitle =
      "John Hammond commented on Isla Nublar SOC2 complaint report";
  final String notificationBody =
      "leaves are an integral part of the stem system. They are attached by a continuos vascular system to the rest of the plant so that free exchange of nutrients.";
  final String notificationDate = "Yesterday at 11:42 PM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(6, 255, 255, 255),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return const Divider();
            },
            separatorBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    "assets/images/A1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Padding(
                  padding:
                      EdgeInsets.only(top: elementHeight(elementHeight: 8).h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        notificationTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: elementHeight(elementHeight: 15).h,
                      ),
                      if (index == 1)
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: elementWidth(elementWidth: 2).w,
                                  height: elementHeight(elementHeight: 70).h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: elementWidth(elementWidth: 8).w,
                                ),
                                Expanded(
                                    child: Text(
                                  '" $notificationBody" ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                            ),
                            SizedBox(
                              // height: (
                              //   screenHeigth(context: context) -
                              //         MediaQuery.of(context).padding.top
                              //         ) *
                              //     0.02,
                              height: elementHeight(elementHeight: 10).h,
                            ),
                          ],
                        ),
                      Text(
                        notificationDate,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 10),
        // ListView.builder(itemBuilder: ((context, index) {
        //   return ListTile(
        //         leading: CircleAvatar(
        //           child: Image.asset("assets/images/A1.png",height: 300, width:300 ,fit: BoxFit.cover,),
        //         ),
        //         title:Column(
        //           children: [
        //               Text(notificationTitle),
        //               Row(
        //                 children: [
        //                   Container(width:screenSize.width*0.015,color: lightGrey,),
        //                 ],
        //               ),
        //           ],
        //         ),
        //       );
        // })

        // ),
      ),
    );
  }
}
