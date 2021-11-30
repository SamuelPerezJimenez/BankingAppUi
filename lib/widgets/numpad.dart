import 'package:banking_app_ui/pages/money_sent.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NumPad extends StatefulWidget {
  NumPad({Key? key}) : super(key: key);

  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          NumPadItem(
            isNumber: true,
            number: 1,
          ),
          NumPadItem(
            isNumber: true,
            number: 2,
          ),
          NumPadItem(
            isNumber: true,
            number: 3,
          ),
          NumPadItem(
            isNumber: true,
            number: 4,
          ),
          NumPadItem(
            isNumber: true,
            number: 5,
          ),
          NumPadItem(
            isNumber: true,
            number: 6,
          ),
          NumPadItem(
            isNumber: true,
            number: 7,
          ),
          NumPadItem(
            isNumber: true,
            number: 8,
          ),
          NumPadItem(
            isNumber: true,
            number: 9,
          ),
          NumPadItem(
            isNumber: false,
            icon: Icon(
              Icons.backspace,
              color: Colors.grey,
            ),
            backgorundColor: Color(0xffEDEDED),
          ),
          NumPadItem(
            isNumber: true,
            number: 0,
            onTap: () => print('0'),
          ),
          NumPadItem(
            isNumber: false,
            number: 3,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onTap: () => Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: MoneySent())),
          ),
        ],
      ),
    );
  }
}

class NumPadItem extends StatelessWidget {
  NumPadItem({
    Key? key,
    required this.isNumber,
    this.number = 1,
    this.icon,
    this.onTap,
    this.backgorundColor = Colors.blue,
  }) : super(key: key);

  final bool isNumber;
  final int number;
  final Color backgorundColor;
  final Icon? icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        child: Center(
            child: isNumber
                ? Text(
                    number.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: backgorundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: icon)),
      ),
    );
  }
}
