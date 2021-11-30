import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SendUserItem extends StatelessWidget {
  const SendUserItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.color})
      : super(key: key);

  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 150,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade50,
                  blurRadius: 0.2,
                  offset: const Offset(0, 2),
                  spreadRadius: 0.2)
            ]),
        child: ListTile(
          horizontalTitleGap: 4,
          minVerticalPadding: 18,
          leading: CircleAvatar(
              backgroundColor: color,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/images/image.png'),
              )),
          title: Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Iconsax.card,
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                subtitle,
                style:
                    const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
