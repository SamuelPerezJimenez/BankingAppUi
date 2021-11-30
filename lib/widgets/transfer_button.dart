import 'package:flutter/material.dart';

class TransferButton extends StatefulWidget {
  TransferButton(
      {Key? key,
      required this.text,
      required this.iconData,
      required this.onTap,
      this.color = Colors.lightBlue,
      this.isOpened = true})
      : super(key: key);

  final String text;
  final IconData iconData;
  final Color color;
  final bool isOpened;
  void Function()? onTap;

  @override
  _TransferButtonState createState() => _TransferButtonState();
}

class _TransferButtonState extends State<TransferButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isOpened
        ? GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: widget.color,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        widget.iconData,
                        color: widget.color,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                      child: Text(
                    widget.text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
          )
        : Container(
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(color: widget.color, width: 5)),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                widget.iconData,
                color: widget.color,
                size: 20,
              ),
            ),
          );
  }
}
