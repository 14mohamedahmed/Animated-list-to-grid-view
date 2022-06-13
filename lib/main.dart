import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int view = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView - ListView Switcher'),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  MyApp.view = 2;
                  Navigator.of(context)
                      .pushReplacement(_createRoute(const MyHomePage()));
                },
                icon: const Icon(
                  Icons.list,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 25),
              IconButton(
                onPressed: () {
                  MyApp.view = 1;
                  Navigator.of(context)
                      .pushReplacement(_createRoute(const MyHomePage()));
                },
                icon: const Icon(
                  Icons.grid_view_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: (MyApp.view == 2)
                ? ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) => Hero(
                      tag: index,
                      child: Card(
                        child: Container(
                          height: 290,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/img-1.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const Text(
                                    'Title',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    'Subtitle',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : GridView.builder(
                    itemCount: 12,
                    physics: const PageScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    padding: const EdgeInsets.all(8.0),
                    itemBuilder: (context, index) => Hero(
                      tag: index,
                      child: Card(
                        child: Container(
                          height: 290,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/img.jpg',
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.3)
                                      ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        'Title',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Subtitle',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        destination,
    transitionDuration: const Duration(milliseconds: 1200),
    reverseTransitionDuration: const Duration(milliseconds: 1200),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCirc,
            reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}
