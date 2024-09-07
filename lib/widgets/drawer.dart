import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'drawer_components.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({super.key});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "More Options",
      shape: const Border(), //this makes the default curved corners to be sharp
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  kGreenFooter(),
                  const Color(0xff274049),
                  const Color(0xff304e59),
                  const Color(0xff395d6a),
                ])),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    // _scaffoldKey.currentState
                    //     ?.closeDrawer(); //this can work as well to close the drawer
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        semanticLabel: "close Drawer",
                        size: 20,
                      ),
                    ),
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: drawerContent.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: drawerFunctions[index],
                          title: drawerContent[index]),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
