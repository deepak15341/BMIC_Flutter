import 'package:flutter/material.dart';

class Reusable extends StatelessWidget{
  final Color color;
  final Widget? childCard;
  const Reusable({super.key, this.childCard, required this.color}  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: childCard,
        ),
      ),
    );
  }

}

