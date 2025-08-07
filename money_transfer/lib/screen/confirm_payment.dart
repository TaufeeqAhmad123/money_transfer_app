import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_transfer/Core/utils/color.dart';
import 'package:money_transfer/Core/utils/extansion.dart';
import 'package:money_transfer/Core/utils/image.dart';
import 'package:money_transfer/Core/utils/text_stl.dart';
import 'package:money_transfer/widget/bottom.nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  final String user, img, amount;
  ConfirmPaymentScreen({
    super.key,
    required this.user,
    required this.img,
    required this.amount,
  });

  final now = DateTime.now();
  final dateFormate = DateFormat('dd/MM/yyyy');
  final timeFormate = DateFormat('hh:mm a');
  late final formattedDate = dateFormate.format(now);
  late final formattedTime = timeFormate.format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      appBar: AppBar(
        title: Text('Transaction proof', style: titleStyle(context)),
        backgroundColor: kBgClr,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            5.vSpace,
            SizedBox(
              height: 70.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  bottonwidget(),
                  transactionWidget(amount: amount, img: img, user: user, formattedDate: formattedDate, formattedTime: formattedTime),
                   SizedBox(
                      height: 22.h, width: 55.w, child: Image.asset(doodle)),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class transactionWidget extends StatelessWidget {
  const transactionWidget({
    super.key,
    required this.amount,
    required this.img,
    required this.user,
    required this.formattedDate,
    required this.formattedTime,
  });

  final String amount;
  final String img;
  final String user;
  final String formattedDate;
  final String formattedTime;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        padding: pagePadding,
        margin: EdgeInsets.only(bottom: 15.h),
        height: 35.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 202, 189, 174),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            10.vSpace,
            Material(
              borderRadius: BorderRadius.circular(30),
              color: kBgClr,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 5,
                ),
                child: Text(
                  'success',
                  style: subtitleStyle(context),
                ),
              ),
            ),
            10.vSpace,
            rowWidget(
              title: 'Transfer   Amount',
              subTitle: '\$ $amount',
            ),
            10.vSpace,
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 21.sp,
                    backgroundImage: NetworkImage(img),
                  ),
                  title: Text(
                    "@$user",
                    style: subtitleStyle(context).copyWith(
                      fontSize: 18.sp,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'ETTN-0070 8822 1001',
                    style: subtitleStyle(context).copyWith(
                      color: Colors.grey[700],
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date & time',
                  style: subtitleStyle(context).copyWith(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$formattedDate, $formattedTime',
                  style: subtitleStyle(context).copyWith(
                    color: Colors.grey[900],
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            10.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No. Ref',
                  style: subtitleStyle(context).copyWith(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '1923862905972',
                  style: subtitleStyle(context).copyWith(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class rowWidget extends StatelessWidget {
  final String title, subTitle;
  const rowWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: subtitleStyle(context).copyWith(
            fontSize: 18.sp,
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: subtitleStyle(context).copyWith(
            fontSize: 19.sp,
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class bottonwidget extends StatelessWidget {
  const bottonwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CupertinoButton(
        child: Container(
          width: double.infinity,
          height: 6.h,
          padding: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            color: kPrimaryClr,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Center(
            child: Text(
              "Send",
              style: subtitleStyle(
                context,
              ).copyWith(fontWeight: FontWeight.w600, fontSize: 19.sp),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBar()),
          );
        },
      ),
    );
  }
}
