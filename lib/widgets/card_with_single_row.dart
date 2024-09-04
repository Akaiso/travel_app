import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/widgets/buttons/round_scroll_button.dart';

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
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: MediaQuery.of(context).size.width<800?10:20, color: Colors.transparent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 2,child: widget.headerRow),const SizedBox(width: 20,),
              Expanded(flex: 1,
                child: SizedBox(width: 100,
                  child: FittedBox(fit: BoxFit.scaleDown,alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        leftRoundScrollButton(() {
                          scrollController1.animateTo(
                              scrollController1.offset -
                                  MediaQuery.of(context).size.width,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        }),
                        const SizedBox(
                          width: 20,
                        ),
                        rightRoundScrollButton(() {
                          scrollController1.animateTo(
                              scrollController1.offset + 1000,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        },),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
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
