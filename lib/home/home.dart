import 'package:animated_switch_grid_list/home/widgets/grid_widget.dart';
import 'package:animated_switch_grid_list/home/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Switcher Between list and grid"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  isGrid = false;
                  setState(() {});
                },
                icon: Icon(
                  Icons.list,
                  color: !isGrid ? Colors.purple : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  isGrid = true;
                  setState(() {});
                },
                icon: Icon(
                  Icons.grid_4x4,
                  color: isGrid ? Colors.purple : Colors.grey.shade400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Expanded(
            child: MyGridWidget(isGrid),
          )
        ],
      ),
    );
  }
}
