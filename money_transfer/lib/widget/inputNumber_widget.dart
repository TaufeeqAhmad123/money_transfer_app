import 'package:flutter/material.dart';
import 'package:money_transfer/Core/utils/text_stl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputnumberWidget extends StatefulWidget {
  final Function(String) onDigitPressed;

  const InputnumberWidget({super.key, required this.onDigitPressed});

  @override
  State<InputnumberWidget> createState() => _InputnumberWidgetState();
}

class _InputnumberWidgetState extends State<InputnumberWidget> {
  List<String> inputNumbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    'cross',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        children: [
          SizedBox(
            height: 40.h  ,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 15.0,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final number = inputNumbers[index];
                return GestureDetector(
                  onTap: () {
                    widget.onDigitPressed(number);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd0c7bd),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        number == 'cross' ? "X" : number,
                        style: subtitleStyle(context).copyWith(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
