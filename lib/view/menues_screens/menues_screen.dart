import 'dart:developer';

import 'package:boli_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../api_services/my_shared_preferance.dart';
import '../../controllers/get_resturants_controller.dart';
import '../../ui_components/custom_widget.dart';
import '../../utils/bottomnavigationBar.dart';
import '../mycart_screens/mycart_main_screen.dart';
import '../profiles_screens/edit_profile_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, this.title});
  final String? title;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GetResturantsController getResturantsController =
      Get.put(GetResturantsController());
  MySharedPreferanse mySharedPreferanse = MySharedPreferanse();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('This is Arguments :${Get.arguments}');
    mySharedPreferanse.getUserLoginToken().then((value) {
      getResturantsController.getResturantsMenue(
          getResturantsController.allResturant.value!.data![Get.arguments].id
              .toString(),
          mySharedPreferanse.gettoken);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    RxInt selectedMenu = 0.obs;
    return Scaffold(
      body: Obx(
        () => getResturantsController.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(
                  color: ConstantColors.greenColor,
                ),
              )
            : getResturantsController.menueResturant.value == null
                ? const Center(
                    child: Text('There are No Menue Found'),
                  )
                : Column(
                    children: [
                      getVerSpace(5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.to(() => const BottomNavBar(
                                          commingIndex: 0,
                                        ));
                                  },
                                  icon: Icon(Icons.arrow_back_ios_sharp,
                                      size: 18.px,
                                      color: const Color(0xff444444))),
                              Text(
                                'Menu',
                                style: TextStyle(
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'segoeui',
                                    color: const Color(0xff444444)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.h),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const MyCartMainScreen());
                                  },
                                  child: Container(
                                      height: 4.h,
                                      width: 4.h,
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
                                    backgroundImage: const AssetImage(
                                        'assets/jpgs/profile.jpg'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.4.h),
                        child: Column(
                          children: [
                            customTextFormField(
                              searchController,
                              'Search menu, restaurant or etc',
                              isObsecure: false,
                              prefixIcon: Icons.search_sharp,
                              iconColor: const Color(0xff878787),
                            ),
                            getVerSpace(1.8.h),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: getResturantsController
                                    .menueResturant.value?.categories?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedMenu.value = index;
                                    },
                                    child: Obx(
                                      () => Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.h, vertical: 1.h),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.px),
                                          color: selectedMenu.value == index
                                              ? ConstantColors.greenColor
                                              : Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              offset: const Offset(0, 1),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                            )
                                          ],
                                        ),
                                        child: Text(
                                          getResturantsController.menueResturant
                                              .value!.categories![index].name!
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 12.px,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'segoeui',
                                              color: selectedMenu.value == index
                                                  ? Colors.white
                                                  : const Color(0xff717171)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            getVerSpace(1.8.h),
                          ],
                        ),
                      ),
                      selectedMenu.value == 0
                          ? Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.h,
                                ),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.2.h),
                                    child: Card(
                                      color: Colors.white,
                                      child: ListTile(
                                        leading: Container(
                                          alignment: Alignment.center,
                                          height: 6.h,
                                          width: 6.h,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.px),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 1),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                              )
                                            ],
                                          ),
                                          child: getSvgImage('login.svg',
                                              boxFit: BoxFit.cover),
                                        ),
                                        title: Text(
                                          "Lorem ipsum dolor sit amets",
                                          style: TextStyle(
                                              fontSize: 13.px,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'segoeui',
                                              color: const Color(0xff3D405B)),
                                        ),
                                        subtitle: Text(
                                          "Lorem ipsum",
                                          style: TextStyle(
                                              fontSize: 11.px,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: 'segoeui',
                                              color: const Color(0xff3D405B)),
                                        ),
                                        trailing: Text(
                                          "\$5.49",
                                          style: TextStyle(
                                              fontSize: 12.px,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'segoeui',
                                              color: const Color(0xff00BF63)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : selectedMenu.value == 1
                              ? Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.h,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.2.h),
                                        child: Card(
                                          color: Colors.white,
                                          child: ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: 6.h,
                                              width: 6.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.px),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    offset: const Offset(0, 1),
                                                    spreadRadius: 1,
                                                    blurRadius: 2,
                                                  )
                                                ],
                                              ),
                                              child: getSvgImage(
                                                  'welcome (2).svg',
                                                  boxFit: BoxFit.cover),
                                            ),
                                            title: Text(
                                              "Lorem ipsum dolor sit amets",
                                              style: TextStyle(
                                                  fontSize: 13.px,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'segoeui',
                                                  color:
                                                      const Color(0xff3D405B)),
                                            ),
                                            subtitle: Text(
                                              "Lorem ipsum",
                                              style: TextStyle(
                                                  fontSize: 11.px,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: 'segoeui',
                                                  color:
                                                      const Color(0xff3D405B)),
                                            ),
                                            trailing: Text(
                                              "\$5.49",
                                              style: TextStyle(
                                                  fontSize: 12.px,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'segoeui',
                                                  color:
                                                      const Color(0xff00BF63)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : selectedMenu.value == 2
                                  ? Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 2.h,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.2.h),
                                            child: Card(
                                              color: Colors.white,
                                              child: ListTile(
                                                leading: Container(
                                                  alignment: Alignment.center,
                                                  height: 6.h,
                                                  width: 6.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.px),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        offset:
                                                            const Offset(0, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 2,
                                                      )
                                                    ],
                                                  ),
                                                  child: getSvgImage(
                                                      'signup.svg',
                                                      boxFit: BoxFit.cover),
                                                ),
                                                title: Text(
                                                  "Lorem ipsum dolor sit amets",
                                                  style: TextStyle(
                                                      fontSize: 13.px,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff3D405B)),
                                                ),
                                                subtitle: Text(
                                                  "Lorem ipsum",
                                                  style: TextStyle(
                                                      fontSize: 11.px,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff3D405B)),
                                                ),
                                                trailing: Text(
                                                  "\$5.49",
                                                  style: TextStyle(
                                                      fontSize: 12.px,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff00BF63)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 2.h,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.2.h),
                                            child: Card(
                                              color: Colors.white,
                                              child: ListTile(
                                                leading: Container(
                                                  alignment: Alignment.center,
                                                  height: 6.h,
                                                  width: 6.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.px),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        offset:
                                                            const Offset(0, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 2,
                                                      )
                                                    ],
                                                  ),
                                                  child: getSvgImage(
                                                      'login.svg',
                                                      boxFit: BoxFit.cover),
                                                ),
                                                title: Text(
                                                  "Lorem ipsum dolor sit amets",
                                                  style: TextStyle(
                                                      fontSize: 13.px,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff3D405B)),
                                                ),
                                                subtitle: Text(
                                                  "Lorem ipsum",
                                                  style: TextStyle(
                                                      fontSize: 11.px,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff3D405B)),
                                                ),
                                                trailing: Text(
                                                  "\$5.49",
                                                  style: TextStyle(
                                                      fontSize: 12.px,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'segoeui',
                                                      color: const Color(
                                                          0xff00BF63)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                    ],
                  ),
      ),
    );
  }
}
