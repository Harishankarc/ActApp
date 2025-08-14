import 'package:flutter/material.dart';

class SlidingSegmentedControl extends StatefulWidget {
  final Function(int) onClicked;
  const SlidingSegmentedControl({Key? key, required this.onClicked}) : super(key: key);

  @override
  _SlidingSegmentedControlState createState() =>
      _SlidingSegmentedControlState();
}

class _SlidingSegmentedControlState extends State<SlidingSegmentedControl> {
  int selectedIndex = 0;
  final List<String> labels = ["Accepted", "Rejected", "Pending"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: [
              Alignment.centerLeft,
              Alignment.center,
              Alignment.centerRight,
            ][selectedIndex],
            child: Container(
              width: MediaQuery.of(context).size.width / 3 - 8,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          // Buttons
          Row(
            children: List.generate(labels.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onClicked(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color:  Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
