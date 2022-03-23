import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/models/slidermodal.dart';
import 'package:fyp/widgets/bottomsheet.dart';
import 'package:fyp/widgets/slider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(
        textTheme: const TextTheme(caption: TextStyle(color: Colors.orange)),
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.orangeAccent,
          primarySwatch: Colors.orange,
        )),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

final databaseReference = FirebaseDatabase.instance.ref();

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SliderModal> sliderList = [];

  void addSlider(String sn, String nn) {
    sliderList.add(SliderModal(sliderName: sn, nodeName: nn));
    setState(() {});
  }

  void removeSlider(String name) {
    sliderList.removeWhere((element) => element.sliderName == name);
    setState(() {});
  }

  void addNewSlider(BuildContext context) {
    /* showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheetX(sListFunc: addSlider, sctx: context);
        });*/
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                BottomSheetX(sListFunc: addSlider, sctx: context)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewSlider(context);
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, size: 30),
      ),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        //backwardsCompatibility: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.orange,
        title: const Text('IOT APP'),
      ),
      body: Container(
        color: Colors.black12,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  removeSlider(sliderList[index].sliderName);
                },
                child: CustomSlider(
                    servoString: sliderList[index].sliderName,
                    nodeString: sliderList[index].nodeName));
          },
          itemCount: sliderList.length,
        ),
      ),
    );
  }
}
