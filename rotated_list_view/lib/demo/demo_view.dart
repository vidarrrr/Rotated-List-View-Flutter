import 'package:flutter/material.dart';
import 'package:rotated_list_view/widget/rotated_list_view.dart';

import '../widget/item_view.dart';

class DemoView extends StatefulWidget {
  const DemoView({super.key});

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  final List<String> list = ["a", "b", "c", "d"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: RotatedListView(
              dataList: list,
              onChildCreate: (value, index, currentIndex) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height,
                  child: ItemView(
                    index: index,
                    currentIndex: currentIndex,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Container(
                          color: Colors.red, child: Center(child: Text(value))),
                    ),
                  ),
                );
              },
              getCurrentClickedItemIndex: (index) {
                print(index);
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return DetailView(
                //         movieModel: widget.movieModelList[index1]);
                //   },
                // ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
