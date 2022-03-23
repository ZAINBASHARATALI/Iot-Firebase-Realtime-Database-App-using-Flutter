import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomSheetX extends StatefulWidget {
  Function(String, String) sListFunc;
  BuildContext sctx;
  BottomSheetX({Key? key, required this.sListFunc, required this.sctx})
      : super(key: key);

  @override
  State<BottomSheetX> createState() => _BottomSheetXState();
}

class _BottomSheetXState extends State<BottomSheetX> {
  late String name;

  late String node;

  final sNameController = TextEditingController();

  final sNodeController = TextEditingController();

  void submitData() {
    name = sNameController.text;
    node = sNodeController.text;
    debugPrint(sNameController.text + '  ' + sNodeController.text);
    if (name.isEmpty || node.isEmpty) {
      return;
    }
    widget.sListFunc(name, node);
    Navigator.pop(widget.sctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Add New Slider',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: sNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Name of Slider You Want',
                      label: const Text('Slider Name'),
                      
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    controller: sNodeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Name of Firebase Node',
                      label: const Text('Node Name'),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: Get.height * 0.08,
                    width: double.infinity,
                    child:  ElevatedButton(
                      child:const Center(
                        child: Text(
                          'CREATE',
                          style: TextStyle(
                              //color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                  onPressed: () {
                    submitData();
                  },
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  child: ButtonBar(children: [
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text('Cancel'))
                  ],)
                )
              ],
            ),
          ),
        ),
    );
  }
}
