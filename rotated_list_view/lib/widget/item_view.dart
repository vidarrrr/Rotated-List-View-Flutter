import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  const ItemView(
      {super.key,
      required this.child,
      required this.currentIndex,
      required this.index,
      this.currentItemFraction = 0,
      this.previousItemFraction = -10,
      this.nextItemFraction = 10});

  final Widget child;
  final int currentIndex;
  final int index;
  final int currentItemFraction;
  final int previousItemFraction;
  final int nextItemFraction;
  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _calculateTurn(widget.index, widget.currentIndex),
      child: Opacity(
          opacity: widget.currentIndex == widget.index ? 1 : 0.25,
          child: widget.child),
    );
  }

  Animation<double> _calculateTurn(int index, int currentIndex) {
    if (currentIndex == index) {
      return AlwaysStoppedAnimation(widget.currentItemFraction / 360);
    } else if (index < currentIndex) {
      return AlwaysStoppedAnimation(widget.previousItemFraction / 360);
    } else {
      return AlwaysStoppedAnimation(widget.nextItemFraction / 360);
    }
  }
}
