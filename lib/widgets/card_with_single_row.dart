import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWithSingleRow extends StatefulWidget {
  final Widget headerRow;
  final Widget row1;

  const CardWithSingleRow({
    super.key,
    required this.row1,
    required this.headerRow,
  });

  @override
  State<CardWithSingleRow> createState() => _CardWithSingleRowState();
}

ScrollController scrollController1 = ScrollController();

class _CardWithSingleRowState extends State<CardWithSingleRow> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.headerRow,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PhysicalModel(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      elevation: 5,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            scrollController1.animateTo(
                                scrollController1.offset -
                                    MediaQuery.of(context).size.width,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          icon: const Icon(Icons.chevron_left),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    PhysicalModel(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      elevation: 5,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            scrollController1.animateTo(
                                scrollController1.offset + 1000,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        ],
      ),
    );
  }
}
