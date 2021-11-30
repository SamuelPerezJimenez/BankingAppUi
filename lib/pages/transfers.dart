import 'package:animate_do/animate_do.dart';
import 'package:banking_app_ui/pages/send_money.dart';
import 'package:banking_app_ui/widgets/transfer_button.dart';
import 'package:banking_app_ui/widgets/transfer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class Transfers extends StatefulWidget {
  Transfers({Key? key}) : super(key: key);

  @override
  _TransfersState createState() => _TransfersState();
}

class _TransfersState extends State<Transfers> {
  List<TransferItem> transferItems = const [
    TransferItem(title: 'Groceries', subtitle: '5:20 PM', amount: -678),
    TransferItem(title: 'Shopping', subtitle: '6:25 PM', amount: -892),
    TransferItem(title: 'Parking', subtitle: '8:50 PM', amount: -200),
    TransferItem(title: 'Rent', subtitle: '8:50 AM', amount: -1200),
    TransferItem(title: 'Flowers🌻 ', subtitle: '7:50 PM', amount: -60),
    TransferItem(title: 'Groceries', subtitle: '5:20 PM', amount: -678),
    TransferItem(title: 'Shopping', subtitle: '6:25 PM', amount: -892),
    TransferItem(title: 'Parking', subtitle: '8:50 PM', amount: -200),
    TransferItem(title: 'Rent', subtitle: '8:50 AM', amount: -1200),
    TransferItem(title: 'Flowers🌻 ', subtitle: '7:50 PM', amount: -60),
  ];

  bool maximizeLastSend = false;
  int flag = 1;
  AnimationController? balancedController;
  AnimationController? actionsController;
  AnimationController? transacController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              if (!maximizeLastSend) ...[
                _buildBalanceWidget(),
                _buildTransacActions(),
              ],
              _buildLastSend(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          width: double.maxFinite,
          child: IconButton(
            splashRadius: 1,
            icon: Icon(
              maximizeLastSend ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                maximizeLastSend = !maximizeLastSend;
                flag = 2;

                switch (maximizeLastSend) {
                  case true:
                    transacController?.repeat();
                    break;
                  case false:
                    // if (balancedController?.status ==
                    //     AnimationStatus.completed) {
                    //   // balancedController.
                    // }

                    // actionsController?.reset();
                    // transacController?.reset();
                    break;
                  default:
                }
              });
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Color(0xffFFCA6E)),
          child: ClipRRect(
            child: Image.asset('assets/images/image.png'),
          ),
        ),
      ),
      leading: const Icon(
        Iconsax.mobile_programming4,
        color: Color(0xff5195B8),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  _buildBalanceWidget() {
    return FadeInDown(
      manualTrigger: true,
      controller: (controller) => balancedController = controller,
      child: Container(
        margin: const EdgeInsets.only(top: 48, bottom: 32),
        child: Column(
          children: const [
            Text(
              'Avaible Balance',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 10),
            Text('\$ 28,800',
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.w700,
                ))
          ],
        ),
      ),
    );
  }

  _buildTransacActions() {
    return FadeInLeft(
      manualTrigger: true,
      controller: (controller) => actionsController = controller,
      child: Row(
        children: [
          TransferButton(
              iconData: Icons.north_east,
              text: 'Send',
              color: const Color(0xffB4E7F0),
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: SendMoney()))),
          const Spacer(),
          TransferButton(
            iconData: Icons.south_west,
            text: 'Received',
            isOpened: false,
            color: const Color(0xffD1E8AE),
            onTap: () {
              print('object');
            },
          ),
          const Spacer(),
          TransferButton(
            iconData: Iconsax.menu,
            text: 'Send',
            isOpened: false,
            color: const Color(0xffF7E7CB),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  _buildLastSend() {
    return Expanded(
        child: FadeInUp(
      duration: const Duration(milliseconds: 300),
      manualTrigger: true,
      // animate: false,
      controller: (controller) => transacController = controller,
      child: Container(
        margin: const EdgeInsets.only(top: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Send',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [...transferItems],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
