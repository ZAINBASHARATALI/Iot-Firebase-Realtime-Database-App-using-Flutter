import 'package:flutter/material.dart';

import '../main.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
   String servoString;
   String nodeString;
   CustomSlider(
      {Key? key, required this.servoString, required this.nodeString})
      : super(key: key);
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _sliderVal = 0;
  void upDateData() {
    databaseReference.update({widget.nodeString: _sliderVal});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      //height:Get.height*0.2,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        elevation: 5,
        color: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                _sliderVal.round().toString(),
                style: const TextStyle(fontSize: 35),
              ),
              Slider(
                  divisions: 36,
                  max: 180,
                  min: 0,
                  inactiveColor: Colors.redAccent.withOpacity(0.2),
                  //label: sliderVal.round().toString(),
                  activeColor: Colors.orange,
                  value: _sliderVal,
                  onChanged: (double val) {
                    setState(() {
                      _sliderVal = val;
                    });
                  },
                  onChangeEnd: (double v) {
                    setState(() {
                      upDateData();
                    });
                  }),
              Text(
                widget.servoString,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
