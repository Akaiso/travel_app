import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoverFillAnimation extends StatefulWidget {
  final Widget child;
 final Color startColor;
 final Color endColor;


  const HoverFillAnimation(
      {super.key,
      required this.child,
     required this.startColor,
        required this.endColor
  });

  @override
  State<HoverFillAnimation> createState() => _HoverFillAnimationState();
}

class _HoverFillAnimationState extends State<HoverFillAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 100),vsync: this);

    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_controller);
  }

  void _onEnter(PointerEvent event){
    _controller.forward();
  }
  void _onExit(PointerEvent event){
    _controller.reverse();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
           color: _colorAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
