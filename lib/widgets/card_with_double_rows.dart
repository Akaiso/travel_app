import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWithDoubleRows extends StatefulWidget {
  final Widget headerRow;
  final Widget row1;
   final Widget? row2;

   const CardWithDoubleRows({super.key, required this.row1, required this.row2, required this.headerRow,  });

  @override
  State<CardWithDoubleRows> createState() => _CardWithDoubleRowsState();
}

ScrollController scrollController1 = ScrollController();
ScrollController scrollController2 = ScrollController();

class _CardWithDoubleRowsState extends State<CardWithDoubleRows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 20, color: Colors.transparent),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.headerRow,
              //Row for two control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PhysicalModel(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    elevation: 5,
                    child: IconButton(
                      onPressed: () {
                        scrollController1.animateTo(
                            scrollController1.offset - MediaQuery.of(context).size.width,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                        scrollController2.animateTo(
                            scrollController2.offset - 1000,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.chevron_left),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  PhysicalModel(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    elevation: 5,
                    child: IconButton(
                      onPressed: () {
                        scrollController2.animateTo(
                            scrollController2.offset + MediaQuery.of(context).size.width,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                        scrollController1.animateTo(
                            scrollController1.offset + 1000,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),

            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            controller: scrollController1,
            scrollDirection: Axis.horizontal,
            child: widget.row1,
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            controller: scrollController2,
            scrollDirection: Axis.horizontal,
            child: widget.row2,
          )
        ],
      ),
    );
  }
}
