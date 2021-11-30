import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {
  const TransferItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.amount})
      : super(key: key);

  final String title;
  final String subtitle;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade50,
                blurRadius: 0.2,
                offset: const Offset(0, 2),
                spreadRadius: 0.2)
          ],
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Text(
          '\$ ${amount.toStringAsFixed(0)}',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFBB884E)),
        ),
      ),
    );
  }
}
