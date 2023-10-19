import 'package:flutter/material.dart';
import '../Constants.dart';

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
class ReusableWA extends StatefulWidget {
  final String title;
  final int data;
  const ReusableWA({Key? key, required this.title, required this.data,})
      : super(key: key);

  @override
  ReusableWAState createState() => ReusableWAState();
}

class ReusableWAState extends State<ReusableWA> {
  late int _data;
  late String _title;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
    _title = widget.title;
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
          _data.toString(),
          style: kLabelLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_title == "WEIGHT") {
                      if (_data > 0) {
                        _data--;
                        weight=_data;// Call the callback function with updated data
                      }
                    } else {
                      if (_data > 0) {
                        _data--;
                        age=_data;
                      }
                    }
                  });
                },
                backgroundColor: const Color(kFABColour),
                child: const Icon(Icons.remove)),

            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_title == "WEIGHT") {
                      _data++;
                      weight=_data;// Call the callback function with updated data
                    } else {
                      _data++;
                      age=_data;// Call the callback function with updated data
                    }
                  });
                },
                backgroundColor: const Color(kFABColour),
                child: const Icon(Icons.add)),


          ],
        )
      ],
    );
  }

int getWeight(){
    return weight;
}
  int getAge(){
    return age;
  }
}
