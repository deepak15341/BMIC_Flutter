import 'package:flutter/material.dart';
import '../Constants.dart';

class Reusable extends StatelessWidget{
  final Color color;
  final Widget? childCard;
 /* final VoidCallback? onPress;*/
  const Reusable({super.key, this.childCard, required this.color/*,  this.onPress*/}  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(

        /*onTap: onPress,*/

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

class ReusableWA extends StatefulWidget{

  final String title;
  final Function pressed;
  int data;
  ReusableWA({super.key, required this.title,required this.data,required this.pressed});


  @override
  ReusableWAState createState() => ReusableWAState(data);

}

class ReusableWAState extends State<ReusableWA>{
  int data;

  ReusableWAState(this.data);
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: kLabelTextStyle,
        ),
        Text(
          data.toString(),
          style: kLabelLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    data++;
                  });
                },
                backgroundColor: Color(kInactiveCardcolour),
                child: const Icon(Icons.add)),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if(data>0) {
                      data--;
                    }
                  });
                },
                backgroundColor: Color(kInactiveCardcolour),
                child: const Icon(Icons.remove))
          ],
        )
      ],
    );
  }
}
