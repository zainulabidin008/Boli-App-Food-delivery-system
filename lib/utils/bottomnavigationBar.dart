import 'dart:developer';

import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/profiles_screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/constant_textstyle.dart';
import '../ui_components/custom_drawer.dart';
import '../view/favorite_ restaurants_screens/favorit_resturant_detail.dart';
import '../view/favorite_ restaurants_screens/rate_resturant.dart';
import '../view/home_screens/item_details.dart';
import '../view/menues_screens/menues_screen.dart';
import '../view/mycart_screens/mycart_main_screen.dart';
import '../view/reservation_screens/reservation_screen.dart';
import '../view/scanar_screens/scanar_main_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.commingIndex});
  final int? commingIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndexes = 0.obs;
  RxBool viewDetail = false.obs;
  RxBool isFav = false.obs;


  @override
  Widget build(BuildContext context) {
    Rx<int?> selectedIndex = widget.commingIndex.obs;

    return Obx(
      () => Scaffold(
        appBar: viewDetail.value == true
            ? null
            : AppBar(
                title: selectedIndex.value == 0
                    ? Text(
                        'Order Food',
                        style: TextStyle(
                            fontSize: 16.px,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'segoeui',
                            color: const Color(0xff444444)),
                      )
                    : selectedIndex.value == 1
                        ? Text(
                            'Restaurants',
                            style: TextStyle(
                                fontSize: 16.px,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'segoeui',
                                color: const Color(0xff444444)),
                          )
                        : selectedIndex.value == 1
                            ? Text(
                                'Restaurants',
                                style: TextStyle(
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'segoeui',
                                    color: const Color(0xff444444)),
                              )
                            : selectedIndex.value == 3
                                ? Text(
                                    'Favorite Restaurants',
                                    style: TextStyle(
                                        fontSize: 16.px,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'segoeui',
                                        color: const Color(0xff444444)),
                                  )
                                : Text(
                                    'Scan QR Code',
                                    style: TextStyle(
                                        fontSize: 16.px,
                                        color: const Color(
                                          0xff444444,
                                        ),
                                        fontFamily: 'segoeui',
                                        fontWeight: FontWeight.w700),
                                  ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 2.h),
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){
                          Get.to(()=>const MyCartMainScreen());
                        },
                          child: Container(
                              height: 3.h,
                              width: 3.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(0, 2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  )
                                ],
                              ),
                              child: getSvgImage('cart.svg')),
                        ),
                        getHorSpace(1.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const EditProfileScreen());
                          },
                          child: CircleAvatar(
                            radius: 16.px,
                            backgroundImage:
                                const AssetImage('assets/jpgs/profile.jpg'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
        drawer: CustomDrawer(),
        body: Obx(
          () => Stack(children: [
            selectedIndex.value == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerSpace(.5.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.5.h, vertical: 1.h),
                          decoration: BoxDecoration(
                              color: ConstantColors.greenColor,
                              borderRadius: BorderRadius.circular(10.px)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi, Lita !',
                                    style: TextStyle(
                                        fontSize: 12.px,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontFamily: 'segoeui'),
                                  ),
                                  getVerSpace(.5.h),
                                  Text(
                                    'You have 1400 Reward Points in your Loyalty\n card, redeem them before they expire.',
                                    style: TextStyle(
                                        fontSize: 10.px,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: 'segoeui'),
                                  ),
                                  getVerSpace(1.h),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 2.h,
                                    width: 8.5.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.px),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              blurRadius: 2,
                                              spreadRadius: 2,
                                              offset: const Offset(0, 1)),
                                        ]),
                                    child: Text(
                                      'Claim Now',
                                      style: TextStyle(
                                          fontSize: 10.px,
                                          color: ConstantColors.greenColor,
                                          fontFamily: 'segoeui'),
                                    ),
                                  )
                                ],
                              ),
                              getSvgImage('burgergroup.svg')
                            ],
                          ),
                        ),
                        getVerSpace(1.6.h),
                        customTextFormField(
                          searchController,
                          'XYZ restaurant',
                          isObsecure: false,
                          prefixIcon: Icons.search_sharp,
                          iconColor: const Color(0xff878787),
                        ),
                        getVerSpace(1.6.h),
                        Text(
                          'Popular Categories',
                          style: TextStyle(
                              fontSize: 14.px,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'segoeui',
                              color: const Color(0xff444444)),
                        ),
                        getVerSpace(2.h),
                        Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 1.5.h,
                                    mainAxisSpacing: 1.5.h,
                                    crossAxisCount: 2),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => const ItemDetailScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  height: 5.h,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      2.5.h,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/pngs/item.png')),
                                      borderRadius:
                                          BorderRadius.circular(16.px)),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 3.4.h,
                                          width: 10.7.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.px),
                                                bottomLeft:
                                                    Radius.circular(16.px),
                                              )),
                                          child: Text(
                                            'Beverages',
                                            style: TextStyle(
                                                fontSize: 13.px,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'segoeui',
                                                color: const Color(0xff404040)),
                                          ),
                                        )
                                      ]),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : selectedIndex.value == 1
                    ? viewDetail.value == true
                        ? Column(
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
                                    image:
                                        AssetImage('assets/pngs/resturent.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(16.px),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.h, vertical: 5.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              viewDetail.value = false;
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
                                            onTap: () {
                                              if (isFav.value == false) {
                                                isFav.value = true;
                                              } else {
                                                isFav.value = false;
                                              }
                                            },
                                            child: CircleAvatar(
                                                radius: 10.px,
                                                backgroundColor: Colors.white,
                                                child: isFav.value == true
                                                    ? getSvgImage(
                                                        'selectheart.svg',
                                                        height: 1.6.h)
                                                    : getSvgImage(
                                                        'emptyheart.svg')),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 5.px,
                                            backgroundColor:
                                                selectedIndexes.value == 0
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.6),
                                          ),
                                          getHorSpace(.6.h),
                                          CircleAvatar(
                                            radius: 5.px,
                                            backgroundColor:
                                                selectedIndexes.value == 1
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.6),
                                          ),
                                          getHorSpace(.6.h),
                                          CircleAvatar(
                                            radius: 5.px,
                                            backgroundColor:
                                                selectedIndexes.value == 2
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.6),
                                          ),
                                          getHorSpace(.6.h),
                                          CircleAvatar(
                                            radius: 5.px,
                                            backgroundColor:
                                                selectedIndexes.value == 3
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.6),
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
                                        scrollDirection: Axis
                                            .horizontal, // Set scroll direction to horizontal
                                        shrinkWrap:
                                            true, // Ensure it takes only the space required
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              selectedIndexes.value = index;
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.px)),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: .6.h),
                                              height: 9.2.h,
                                              width: 9.2.h,
                                              child: const Image(
                                                  image: AssetImage(
                                                      'assets/pngs/more.png')),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    getVerSpace(1.8.h),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const RateResturant());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              Icon(Icons.star,
                                                  color:
                                                      const Color(0xffFFA500),
                                                  size: 12.px),
                                              Icon(Icons.star,
                                                  color:
                                                      const Color(0xffFFA500),
                                                  size: 12.px),
                                              Icon(Icons.star,
                                                  color:
                                                      const Color(0xffFFA500),
                                                  size: 12.px),
                                              Icon(Icons.star,
                                                  color:
                                                      const Color(0xffFFA500),
                                                  size: 12.px),
                                              getHorSpace(.3.h),
                                              Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontSize: 12.px,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'segoeui',
                                                    color: const Color(
                                                        0xff404040)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => const MenuScreen());
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      offset:
                                                          const Offset(0, 2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.px)),
                                              margin: EdgeInsets.all(.2.h),
                                              height: 14.2.h,
                                              width: 15.3.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  getSvgImage('mobile.svg',
                                                      height: 8.h),
                                                  Text(
                                                    'Menu',
                                                    style: TextStyle(
                                                        fontSize: 12.px,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'segoeui',
                                                        color: const Color(
                                                            0xff444444)),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => ReservationScreen());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    offset: const Offset(0, 2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.px)),
                                            margin: EdgeInsets.all(.2.h),
                                            height: 14.2.h,
                                            width: 15.3.h,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                getSvgImage('repair.svg',
                                                    height: 8.h),
                                                Text(
                                                  'Reservation',
                                                  style: TextStyle(
                                                      fontSize: 12.px,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff444444)),
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
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                            child: Column(
                              children: [
                                getVerSpace(1.h),
                                customTextFormField(
                                  searchController,
                                  'Search menu, restaurant or etc',
                                  isObsecure: false,
                                  prefixIcon: Icons.search_sharp,
                                  iconColor: const Color(0xff878787),
                                ),
                                getVerSpace(1.h),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: 7,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        height: 26.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 2),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                              )
                                            ],
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/pngs/resturent.png')),
                                            borderRadius:
                                                BorderRadius.circular(16.px)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(16.px),
                                                    bottomLeft:
                                                        Radius.circular(16.px),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Belmond Copacabana',
                                                        style: TextStyle(
                                                            fontSize: 12.px,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'segoeui',
                                                            color: const Color(
                                                                0xff404040)),
                                                      ),
                                                      Text(
                                                        'Address: Av. Atlântica, 1702',
                                                        style: TextStyle(
                                                            fontSize: 9.px,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'segoeui',
                                                            color: const Color(
                                                                0xff404040)),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: const Color(
                                                                0xffFFA500),
                                                            size: 10.px,
                                                          ),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          getHorSpace(.3.h),
                                                          Text(
                                                            '5.0',
                                                            style: TextStyle(
                                                                fontSize: 10.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'segoeui',
                                                                color: const Color(
                                                                    0xff404040)),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      viewDetail.value = true;
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 3.h,
                                                      width: 7.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                            spreadRadius: 2,
                                                            blurRadius: 2,
                                                          )
                                                        ],
                                                      ),
                                                      child: Text(
                                                        'View',
                                                        style: CustomTextStyles
                                                            .buttonTextStyle,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                    : selectedIndex.value == 3
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                            child: Column(
                              children: [
                                getVerSpace(1.h),
                                customTextFormField(
                                  searchController,
                                  'Search menu, restaurant or etc',
                                  isObsecure: false,
                                  prefixIcon: Icons.search_sharp,
                                  iconColor: const Color(0xff878787),
                                ),
                                getVerSpace(1.h),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: 7,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        height: 26.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 2),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                              )
                                            ],
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/pngs/resturent.png')),
                                            borderRadius:
                                                BorderRadius.circular(16.px)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(16.px),
                                                    bottomLeft:
                                                        Radius.circular(16.px),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Belmond Copacabana',
                                                        style: TextStyle(
                                                            fontSize: 12.px,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'segoeui',
                                                            color: const Color(
                                                                0xff404040)),
                                                      ),
                                                      Text(
                                                        'Address: Av. Atlântica, 1702',
                                                        style: TextStyle(
                                                            fontSize: 9.px,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'segoeui',
                                                            color: const Color(
                                                                0xff404040)),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: const Color(
                                                                0xffFFA500),
                                                            size: 10.px,
                                                          ),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          Icon(Icons.star,
                                                              color: const Color(
                                                                  0xffFFA500),
                                                              size: 10.px),
                                                          getHorSpace(.3.h),
                                                          Text(
                                                            '5.0',
                                                            style: TextStyle(
                                                                fontSize: 10.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'segoeui',
                                                                color: const Color(
                                                                    0xff404040)),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          const FavoriteResturant());
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 3.h,
                                                      width: 7.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                            spreadRadius: 2,
                                                            blurRadius: 2,
                                                          )
                                                        ],
                                                      ),
                                                      child: Text(
                                                        'View',
                                                        style: CustomTextStyles
                                                            .buttonTextStyle,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                        : const ScanarScreen(),
            Positioned(
              bottom: 2.h,
              left: 1.5.h,
              right: 1.5.h,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                height: 6.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.px),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(0, 1)),
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          selectedIndex.value = 0;
                        },
                        child: selectedIndex.value == 0
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getSvgImage('selecteditem.svg'),
                                ],
                              )
                            : getSvgImage('unselecteditem.svg'),
                      ),
                      InkWell(
                        onTap: () {
                          selectedIndex.value = 1;
                        },
                        child: selectedIndex.value == 1
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getSvgImage('selectedresturant.svg'),
                                ],
                              )
                            : getSvgImage('unselectedresturant.svg'),
                      ),
                      InkWell(
                        onTap: () {
                          selectedIndex.value = 2;
                        },
                        child: selectedIndex.value == 2
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getSvgImage('selectbarcode.svg'),
                                  Container(
                                    height: .8.h,
                                    width: .8.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ConstantColors.greenColor),
                                  )
                                ],
                              )
                            : getSvgImage('unselectbarcode.svg'),
                      ),
                      InkWell(
                        onTap: () {
                          selectedIndex.value = 3;
                        },
                        child: selectedIndex.value == 3
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getSvgImage('selectheart.svg'),
                                  Container(
                                    height: .8.h,
                                    width: .8.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ConstantColors.greenColor),
                                  )
                                ],
                              )
                            : getSvgImage('unselectheart.svg'),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
