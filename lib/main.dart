import 'package:animated_switch_grid_list/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  late Animation<double>? animationAfterIndex1YAxis;
  late Animation<double>? animationAfterindex1XAxis;
  late Animation<double>? animationIndexEventYAxis;
  late Animation<double>? animationTextPostitionLeftSideXAxis;
  late Animation<double>? animationTextPostitionRightSideYAxis;
  late Animation<Color?> animateTextColor;
  late AnimationController? animationController;
  final int multiplyIn = 2;
  var screenSize ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationAfterIndex1YAxis = Tween<double>(begin: 0, end: 210).animate(
        CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    animationAfterindex1XAxis = Tween<double>(begin: 0, end: -207).animate(
        CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });

    animationIndexEventYAxis = Tween<double>(begin: 0, end: 210).animate(
        CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    animationTextPostitionLeftSideXAxis = Tween<double>(begin: 0, end: 210)
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });

    animationTextPostitionRightSideYAxis = Tween<double>(begin: 0, end: 210)
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic))
      ..addListener(() {
        setState(() {});
      });
    animateTextColor = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeInOutCubic));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Align(
            child: RaisedButton(
              onPressed: () {
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
          Expanded(
            child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: animationController!.isCompleted ? 1 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 200,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => Transform.translate(
                offset: animationController!.isCompleted
                    ? const Offset(0, 0)
                    : index != 0
                        ? index.isOdd
                            ? index > 1
                                ? Offset(animationAfterindex1XAxis!.value,
                                    animationAfterIndex1YAxis!.value * 2)
                                : Offset(animationAfterindex1XAxis!.value,
                                    animationAfterIndex1YAxis!.value)
                            : Offset(0, animationIndexEventYAxis!.value)
                        : const Offset(0, 0),
                child: animationController!.isCompleted
                    ? Row(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: buildCard(index),
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Transform.translate(
        offset: Offset(animationTextPostitionLeftSideXAxis!.value, 0),
        child: Text(
          "Yalla Bena Now $index",
          style: TextStyle(
            color: animateTextColor.value,
          ),
        ),
      ),
    );
  }
}
