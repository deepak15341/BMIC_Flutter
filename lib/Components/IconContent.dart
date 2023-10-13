import 'package:flutter/material.dart';


class ChildCard extends StatelessWidget{
  final IconData iconImg;
  final String gender;

   const ChildCard({super.key, required this.iconImg,required this.gender });

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconImg,
          color: Colors.white,size: 80,),
        const SizedBox(height: 15,),
         Text(gender,style: const TextStyle(fontSize: 18),)
      ],
    );
  }

}