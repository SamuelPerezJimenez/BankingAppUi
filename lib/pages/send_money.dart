import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:banking_app_ui/widgets/numpad.dart';
import 'package:banking_app_ui/widgets/send_user_item.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  List<SendUserItem> sendUserItems = const [
    SendUserItem(
      title: 'Samuel',
      subtitle: '****4245',
      color: Color(0xffFABBC4),
    ),
    SendUserItem(
      title: 'James',
      subtitle: '****1680',
      color: Color(0xffB1CCDE),
    ),
    SendUserItem(
      title: 'Ryan',
      subtitle: '****7689',
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              _buildAppBar(),
              _buildSendToSection(),
              _buildNumPadSection()
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: IconButton(
                  splashRadius: 1,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.0,
                  ))),
        ),
        const SizedBox(width: 20),
        const Expanded(
            child: Text('Send Money',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
      ],
    );
  }

  _buildSendToSection() {
    return Column(
      children: [
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: Text(
            'Send To',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            'see all',
            style: TextStyle(
                decoration: TextDecoration.underline, color: Color(0xFF1FA2DB)),
          ),
        ),
        const SizedBox(height: 10),
        FadeInRight(
          child: SizedBox(
              height: 60,
              child: ListView.builder(
                  itemCount: sendUserItems.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return sendUserItems[index];
                  })),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  _buildNumPadSection() {
    return Expanded(
      child: FadeInLeft(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: const TextField(
                autofocus: true,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  prefix: Text('\$'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffD1E8AE)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffD1E8AE),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: NumPad(),
            )
          ],
        ),
      ),
    );
  }
}
