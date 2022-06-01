import 'package:animated_switch_grid_list/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Option1(context: context),
    );
  }
}

class Option1 extends StatefulWidget {
  final BuildContext context;

  const Option1({super.key, required this.context});
  @override
  _Option1State createState() => _Option1State();
}

class _Option1State extends State<Option1> with TickerProviderStateMixin {
  Animation<double>? animationAfterIndex1YAxis;
  Animation<double>? animationAfterindex1XAxis;
  Animation<double>? animationIndexEventYAxis;
  Animation<double>? animationTextPostitionLeftSideXAxis;
  Animation<double>? animationTextPostitionRightSideYAxis;
  Animation<Color?>? animateTextColor;
  AnimationController? animationController;
  final int multiplyIn = 2;
  Size? screenSize;
  bool isList = false;
  bool isScreenLoaded = false;
  _myFunction(context) {
    screenSize = MediaQuery.of(context).size;
    isScreenLoaded = false;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationAfterIndex1YAxis = Tween<double>(begin: 0, end: 80).animate(
        // y=210
        CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    animationAfterindex1XAxis =
        Tween<double>(begin: 0, end: -screenSize!.width / 2 + 6).animate(
            // x = -207
            CurvedAnimation(
                parent: animationController!, curve: Curves.easeInOutCubic))
          ..addListener(() {
            setState(() {});
          });

    animationIndexEventYAxis = Tween<double>(begin: 0, end: 80).animate(
        // y = 210
        CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    animationTextPostitionLeftSideXAxis = Tween<double>(
            begin: 0, end: screenSize!.width / 21) // left to right by 210
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });

    animationTextPostitionRightSideYAxis = Tween<double>(
            begin: 0, end: screenSize!.height * 80) //top to bottom by 210
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    animateTextColor = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic));
    setState(() {
      isScreenLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _myFunction(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Align(
            child: RaisedButton(
              onPressed: () {
                isList = !isList;
                setState(() {});
                if (!animationController!.isCompleted)
                  animationController!.forward();
                else
                  animationController!.reverse();
              },
              child: Text('Go'),
              color: Colors.red,
              textColor: Colors.yellowAccent,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          isScreenLoaded == false
              ? Container()
              : Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: animationController!.isCompleted ? 1 : 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10.0,
                      mainAxisExtent: 70,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) => Transform.translate(
                      offset: animationController!.isCompleted
                          ? const Offset(0, 0)
                          : index != 0
                              ? index.isOdd
                                  ? index > 1
                                      ? Offset(
                                          animationAfterindex1XAxis!.value,
                                          animationAfterIndex1YAxis!.value *
                                              (index - 1) ) // every
                                      : Offset(animationAfterindex1XAxis!.value,
                                          animationAfterIndex1YAxis!.value)
                                  : index > 2
                                      ? Offset(
                                          0,
                                          animationIndexEventYAxis!.value *
                                              (index / 2))
                                      : Offset(
                                          0, animationIndexEventYAxis!.value)
                              : const Offset(0, 0),
                      child: animationController!.isCompleted
                          ? Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: buildCard(index))),
                                Expanded(
                                  child: Visibility(
                                    visible: false,
                                    child: Container(),
                                  ),
                                ),
                              ],
                            )
                          : buildCard(index),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  Widget buildCard(index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Transform.translate(
          offset: Offset(animationTextPostitionLeftSideXAxis!.value, 0),
          child: Text(
            "Yalla Bena Now $index",
            style: TextStyle(
              fontSize: 25,
              color: animateTextColor!.value,
            ),
          ),
        ),
      ),
    );
  }
}
