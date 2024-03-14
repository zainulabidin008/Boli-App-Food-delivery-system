import 'package:boli_app/constants/constant_colors.dart';
import 'package:boli_app/ui_components/custom_widget.dart';
import 'package:boli_app/view/menues_screens/menues_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/custom_dialogeBox.dart';
import '../view/contact_us_screens/contact_our_team.dart';
import '../view/loyalty_screens/loyalty_main_screen.dart';
import '../view/my_order_screens/my_order_main.dart';
import '../view/my_reservationscreens/my_reservation_main.dart';
import '../view/payments_screens/addcart_screen.dart';
import '../view/security&privacy_screens/security&privacy_screen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
 final  RxBool light = false.obs;
final CustomDialogueBox customDialogueBox=CustomDialogueBox();
  @override
  Widget build(BuildContext context) {
    return Drawer(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.px),
            bottomRight: Radius.circular(30.px)),
      ),
      width: 36.h,
      child: Padding(
        padding: EdgeInsets.only(left: 2.5.px, right: 17.px),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: const Color(0xff222222),
                    size: 16.px,
                  ),
                ),
              ],
            ),
          GestureDetector(onTap: (){
Get.to(()=>const MyOrderMainScreen());
          },
            child: ListTile(title: const Text('My Orders'),
            leading: getSvgImage('myorder.svg'),),
          ),
            SizedBox(height: 4.px),
            GestureDetector(onTap: (){
              Get.to(()=> const MenuScreen(title: 'Drawer',));
            },
              child: ListTile(title: const Text('Menu'),
                leading: getSvgImage('menue.svg'),),
            ),
            SizedBox(height:4.px),
            GestureDetector(onTap: (){
              Get.to(()=> const AddCartScreen());
            },
              child: ListTile(title: const Text('Payment method'),
                leading: getSvgImage('payment.svg'),),
            ),
            SizedBox(height:4.px),
            GestureDetector(onTap: (){
              Get.to(()=>const MyReservationMain());
            },
              child: ListTile(title: const Text('My Reservations'),
                leading: getSvgImage('myreservation.svg'),),
            ),
            SizedBox(height: 4.px),
            Obx(()=>
               ListTile(title: const Text('Notifications'),trailing:
              Transform.scale(scale: 0.5,
                child: Switch(inactiveThumbColor: ConstantColors.textFieldGrey,
                    activeColor: Colors.white, // Change border color when switch is ON
                    inactiveTrackColor: Colors.grey,
                    trackColor: const MaterialStatePropertyAll(Colors.green),

                    value: light.value, onChanged:(value){
                  light.value=value;
                    }),
              ),
                leading: getSvgImage('notification.svg'),),
            ),  SizedBox(height: 4.px),  GestureDetector(
              onTap: (){
                Get.to(()=>const MainLoyaltyScreen());
              },
              child: ListTile(title: const Text('Loyalty Card'),
                leading: getSvgImage('loyalitycard.svg'),),
            ),
            SizedBox(height: 4.px),  GestureDetector(onTap: (){
              Get.to(()=>const ContactOurSupportTeam());
            },
              child: ListTile(title: const Text('Contact Us'),
                leading: getSvgImage('contactus.svg'),),
            ),
            SizedBox(height: 4.px),  GestureDetector(onTap: (){
              Get.to(()=>const SecurityAndPrivacy());
            },
              child: ListTile(title: const Text('Privacy policy'),
                leading: getSvgImage('privacypolicy.svg'),),
            ),
            SizedBox(height: 4.px),



            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  customDialogueBox.openSignOutDialog(title: 'Sign Out',
                      description: 'Are you sure you want to Sign Out?',
                      svg: 'logout1.svg',onTap: (){});
                },
                child: Container(
                  height: 36.px,
                  width: 117.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44.px),
                    color: const Color(0xffF32116),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.h),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                       getSvgImage('logout.svg'),
                        const Text(
                          'Log Out',style: TextStyle(color: Colors.white),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback ontap;
  const DrawerTile(
      {super.key,
        required this.title,
        required this.image,
        required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 20.px,
            width: 20.px,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.px),
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
            child: Padding(
              padding: EdgeInsets.all(4.5.px),
              child: Image.asset(
                image,
              ),
            ),
          ),
          SizedBox(width: 10.px),
          Text(
            title,

          ),
        ],
      ),
    );
  }}
