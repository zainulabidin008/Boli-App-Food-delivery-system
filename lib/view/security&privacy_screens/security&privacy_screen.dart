import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';

class SecurityAndPrivacy extends StatelessWidget {
  const SecurityAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getVerSpace(5.h),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(()=>const BottomNavBar(commingIndex: 0,));
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp,
                      size: 18.px, color: const Color(0xff444444))),
              Text(
                'Security & Privacy',
                style: TextStyle(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'segoeui',
                    color: const Color(0xff444444)),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.4.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              getVerSpace(1.2.h),
              Text(
                '1. Types data we collect',
                style: TextStyle(
                    fontSize: 12.px,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'segoeui',
                    color: const Color(0xff444444)),
              ),
                getVerSpace(.6.h),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(2.2.h),
                Text(
                  '2. Use of your personal data',
                  style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(.6.h),
                Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit\n voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(2.2.h),
                Text(
                  '3. Disclosure of your personal data',
                  style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),
                getVerSpace(.6.h),
                Text(
                  'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.\n\nEt harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\n\nTemporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus',
                  style: TextStyle(
                      fontSize: 10.px,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'segoeui',
                      color: const Color(0xff444444)),
                ),


            ],),
          ),
        ],
      ),
    );
  }
}
