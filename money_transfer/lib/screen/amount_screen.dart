import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_transfer/Core/utils/color.dart';
import 'package:money_transfer/Core/utils/extansion.dart';
import 'package:money_transfer/Core/utils/text_stl.dart';
import 'package:money_transfer/screen/confirm_payment.dart';
import 'package:money_transfer/widget/inputNumber_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AmountScreen extends StatefulWidget {
  final String user;
  final String userImage;
  const AmountScreen({super.key, required this.user, required this.userImage});

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  TextEditingController numberController = TextEditingController();
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      appBar: AppBar(
        title: Text('Send Money', style: titleStyle(context)),
        backgroundColor: kBgClr,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white,size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          50.vSpace,
          Text('Enter Amount', style: subtitleStyle(context)),
          3.vSpace,
          TextFormField(
            keyboardType: TextInputType.none,
            controller: numberController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              border: InputBorder.none,
              hintText: '       \$100',
              hintStyle: subtitleStyle(context).copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
            cursorColor: Colors.white,
            style: subtitleStyle(
              context,
            ).copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
            autofocus: true,
          ),
          150.vSpace,
          Expanded(
            child: InputnumberWidget(
              onDigitPressed: (String inputText) {
                setState(() {
                  if (inputText == 'cross') {
                    if (numberController.text.isNotEmpty) {
                      numberController.text = numberController.text.substring(
                        0,
                        numberController.text.length - 1,
                      );
                    }
                  } else {
                    numberController.text += inputText;
                  }
                });
              },
            ),
          ),
          20.vSpace,
          SafeArea(
            child: CupertinoButton(
              child: Container(
                width: double.infinity,
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
                  MaterialPageRoute(
                    builder: (context) => ConfirmPaymentScreen(
                      user: widget.user,
                      img: widget.userImage,
                      amount: numberController.text,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
