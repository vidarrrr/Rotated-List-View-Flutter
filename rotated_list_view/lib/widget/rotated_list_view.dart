import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RotatedListView<T> extends StatefulWidget {
  const RotatedListView(
      {super.key,
      required this.dataList,
      required this.getCurrentClickedItemIndex,
      required this.onChildCreate,
      this.visibleFraction = 0.6});

  final List<T> dataList;
  final Function(dynamic, int, int) onChildCreate;
  final Function(int) getCurrentClickedItemIndex;
  final double visibleFraction;
  @override
  State<RotatedListView> createState() => _RotatedListViewState();
}

class _RotatedListViewState extends State<RotatedListView> {
  int _listViewCurrentIndex = 0;

  void changeListViewCurrentIndex(int index) {
    setState(() {
      _listViewCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dataList.length,
        itemBuilder: (context, index1) {
          return VisibilityDetector(
            key: Key(index1.toString()),
            onVisibilityChanged: ((info) {
              if (info.visibleFraction >= widget.visibleFraction) {
                changeListViewCurrentIndex(index1);
              }
            }),
            child: InkWell(
                onTap: () {
                  widget.getCurrentClickedItemIndex(index1);
                },
                child: widget.onChildCreate(
                    widget.dataList[index1], index1, _listViewCurrentIndex)),
          );
        });
  }
}
