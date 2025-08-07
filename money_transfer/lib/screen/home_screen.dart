import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_transfer/Core/utils/color.dart';
import 'package:money_transfer/Core/utils/extansion.dart';
import 'package:money_transfer/Core/utils/image.dart';
import 'package:money_transfer/Core/utils/text_stl.dart';
import 'package:money_transfer/screen/send_money.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.vSpace,
              Text('Hi, Ahmad 🖐️', style: titleStyle(context)),

              20.vSpace,
              topbannerwidget().animate(
                delay: 200.ms,
                effects: [
                  FadeEffect(),
                  SlideEffect(
                    begin: const Offset(0, -0.2),
                    curve: Curves.easeInOut,
                  ),
                ],
              ),
              40.vSpace,
              transactionWidget()
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 500.ms, curve: Curves.easeInOut),
              20.vSpace,
              Text(
                'Last Transaction',
                style: titleStyle(context),
              ).animate().fadeIn(duration: 500.ms, curve: Curves.easeInOut),

              lasttransactonWidget()
                  .animate(delay: 600.ms)
                  .fadeIn(duration: 500.ms, curve: Curves.easeInOut)
                  .slide(
                    begin: const Offset(0, 0.2),
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class lasttransactonWidget extends StatelessWidget {
  lasttransactonWidget({super.key});

  final List<Map<String, dynamic>> list = [
    {'icon': shopingIcon, 'title': 'Shopping Fund'},
    {'icon': appleIcon, 'title': 'Purchased Mac'},
    {'icon': ticketIcon, 'title': 'Purchased Ticket'},
    {'icon': historyIcon, 'title': 'Membership'},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            height: 12.h,
            width: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  width: 20.w,
                  height: 9.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.sp),
                    color: const Color(0xff2d4147),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      list[index]['icon'],
                      color: Colors.white,
                    ),
                  ),
                ),
                20.hSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      list[index]['title'],
                      style: subtitleStyle(
                        context,
                      ).copyWith(color: Colors.white70),
                    ),
                    Text(
                      '\$ 100.00',
                      style: subtitleStyle(
                        context,
                      ).copyWith(color: Colors.white70),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0, // No shadow
                    side: BorderSide(color: Colors.grey.shade600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  child: Text(
                    '+ \$${index == 0
                        ? 2.98
                        : index == 1
                        ? 1640
                        : index == 2
                        ? 30.0
                        : 44.7}',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class transactionWidget extends StatelessWidget {
  transactionWidget({super.key});
  List name = ['Send', 'Deposit', "change", 'History'];
  List icon = [sendIcon, depositeIcon, changeIcon, historyIcon];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => 30.hSpace,
        itemCount: name.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  index==0 ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SendMoney(),
                    ),
                  ) : null; // Add navigation for other icons if needed 
                },
                child: Container(
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xff2d4147),
                
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 5.h,
                      child: SvgPicture.asset(icon[index], color: Colors.white),
                    ),
                  ),
                ),
              ),
              20.vSpace,
              Text(
                name[index],
                style: subtitleStyle(context).copyWith(color: Colors.white70),
              ),
            ],
          );
        },
      ),
    );
  }
}

class topbannerwidget extends StatelessWidget {
  const topbannerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        color: kPrimaryClr,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.vSpace,
                Text('Your Balance', style: subtitleStyle(context)),
                10.vSpace,
                Text('\$ 1,000.00', style: titleStyle(context)),
              ],
            ),
          ),
          20.hSpace,
          Image.asset(atm),
        ],
      ),
    );
  }
}
