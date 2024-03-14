import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../ui_components/custom_widget.dart';

 class CustomDialogueBox{


    void openSignOutDialog({
    required String title,
    description,
    svg,
      required Callback onTap
  }) {

    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.px, vertical: 28.px),
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 32.h),
                      Row(
                        children: [
                          Container(height: 5.2.h,width: 5.2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.px),
                              color: const Color(0xffF20707).withOpacity(0.2),
                            ),
                            child: getSvgImage('$svg',boxFit: BoxFit.cover),
                          ),
                          getHorSpace(1.h),
                           Text(
                             title ,
                          )
                        ],
                      ),
                      SizedBox(height: 18.px),
                       Text(
                        '$description',
                      ),
                      getVerSpace(1.h),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 44.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.px),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(
                                        1,
                                        1,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Text(
                                    'No',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          getHorSpace(1.h),
                          Expanded(
                            child: GestureDetector(
                              onTap: onTap,
                              child: Container(
                                height: 44.px,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.px),
                                  color: const Color(0xffF20707),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Yes',style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}