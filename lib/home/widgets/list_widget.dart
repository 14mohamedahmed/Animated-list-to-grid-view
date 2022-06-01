import 'package:flutter/material.dart';

class MyListWidget extends StatelessWidget {
  const MyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      padding: const EdgeInsets.all(7),
      itemBuilder: (context, index) => Container(
        height: 300,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage("https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            fit: BoxFit.cover,
          ),
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children:  const [
            Text("Title"),
            Text("description"),
            Text("price"),
          ],
        ),
      ),
    );
  }
}
