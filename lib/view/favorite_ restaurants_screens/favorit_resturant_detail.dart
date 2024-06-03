import 'package:boli_app/view/favorite_%20restaurants_screens/rate_resturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../ui_components/custom_widget.dart';
import '../menues_screens/menues_screen.dart';
import '../reservation_screens/reservation_screen.dart';

class FavoriteResturant extends StatelessWidget {
 const FavoriteResturant({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt selectedIndexes = 0.obs;

    return Scaffold(
      body: Obx(()=>

          Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              height: 32.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/pngs/resturent.png'),
                ),
                borderRadius: BorderRadius.circular(16.px),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(
                            radius: 10.px,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.black,
                              size: 2.h,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 10.px,
                              backgroundColor: Colors.white,
                              child:
                                  getSvgImage('selectheart.svg', height: 1.6.h)),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 5.px,
                          backgroundColor: selectedIndexes.value == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                        ),
                        getHorSpace(.6.h),
                        CircleAvatar(
                          radius: 5.px,
                          backgroundColor: selectedIndexes.value == 1
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                        ),
                        getHorSpace(.6.h),
                        CircleAvatar(
                          radius: 5.px,
                          backgroundColor: selectedIndexes.value == 2
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                        ),
                        getHorSpace(.6.h),
                        CircleAvatar(
                          radius: 5.px,
                          backgroundColor: selectedIndexes.value == 3
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 9.2.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection:
                          Axis.horizontal, // Set scroll direction to horizontal
                      shrinkWrap: true, // Ensure it takes only the space required
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedIndexes.value = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.px)),
                            margin: EdgeInsets.symmetric(horizontal: .6.h),
                            height: 9.2.h,
                            width: 9.2.h,
                            child: const Image(
                                image: AssetImage('assets/pngs/more.png')),
                          ),
                        );
                      },
                    ),
                  ),
                  getVerSpace(1.8.h),
                  GestureDetector(onTap:(){
                    Get.to(()=> const RateResturant());
                  },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Belmond Copacabana',
                          style: TextStyle(
                              fontSize: 14.px,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'segoeui',
                              color: const Color(0xff444444)),
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color(0xffFFA500),

                              size: 12.px,
                            ),
                            Icon(Icons.star,                                   color: const Color(0xffFFA500),
                                size: 12.px),
                            Icon(Icons.star,                                   color: const Color(0xffFFA500),
                                size: 12.px),
                            Icon(Icons.star,                                  color: const Color(0xffFFA500),
                                size: 12.px),
                            Icon(Icons.star,                                   color: const Color(0xffFFA500),
                                size: 12.px),
                            getHorSpace(.3.h),
                            Text(
                              '5.0',
                              style: TextStyle(
                                  fontSize: 12.px,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'segoeui',
                                  color: const Color(0xff404040)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Address: Av. Atlântica, 1702 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brazil',
                    style: TextStyle(
                        fontSize: 11.px,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'segoeui',
                        color: const Color(0xff404040)),
                  ),
                  getVerSpace(1.6.h),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'segoeui',
                        color: const Color(0xff444444)),
                  ),
                  getVerSpace(1.h),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ullamco laboris nisised do eiusmod tempor incididunt ut labore ullamco laboris nisi ut aliquip Read more',
                    style: TextStyle(
                        fontSize: 11.px,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'segoeui',
                        color: const Color(0xff404040)),
                  ),
                  getVerSpace(1.8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() =>  MenuScreen());
                        },
                        child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(0, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16.px)),
                            margin: EdgeInsets.all(.2.h),
                            height: 14.2.h,
                            width: 15.3.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                getSvgImage('mobile.svg', height: 8.h),
                                Text(
                                  'Menu',
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'segoeui',
                                      color: const Color(0xff444444)),
                                ),
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ReservationScreen(selectedIndex: 0,));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  offset: const Offset(0, 2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(16.px)),
                          margin: EdgeInsets.all(.2.h),
                          height: 14.2.h,
                          width: 15.3.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              getSvgImage('repair.svg', height: 8.h),
                              Text(
                                'Reservation',
                                style: TextStyle(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'segoeui',
                                    color: const Color(0xff444444)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
