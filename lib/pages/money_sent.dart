import 'package:animate_do/animate_do.dart';
import 'package:banking_app_ui/pages/transfers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class MoneySent extends StatelessWidget {
  const MoneySent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: Transfers())),
                icon: Icon(Icons.close)),
          )
        ],
      ),
      backgroundColor: const Color(0xFFC0DA99),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDownBig(
              duration: const Duration(milliseconds: 600),
              child: CircleAvatar(
                maxRadius: 36,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: Color(0xffD1E8AE),
                ),
              ),
            ),
            SizedBox(height: 24),
            FadeInUpBig(
              duration: const Duration(milliseconds: 600),
              child: Text(
                'Money sent sucessfully!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
