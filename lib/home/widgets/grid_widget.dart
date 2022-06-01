import 'package:flutter/material.dart';

class MyGridWidget extends StatelessWidget {
  final bool isGrid;
  const MyGridWidget(this.isGrid, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
          duration: Duration(seconds: 2),
      transitionBuilder: (child , animation) => FadeTransition(opacity: animation , child: child,),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isGrid ? 2 : 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 4,
        padding: const EdgeInsets.all(7),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              fit: BoxFit.contain,
            ),
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Title"),
              Text("description"),
              Text("price"),
            ],
          ),
        ),
      ),
    );
  }
}
