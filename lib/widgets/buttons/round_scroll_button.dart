import 'package:flutter/material.dart';

Widget rightRoundScrollButton(onTap) {
  return PhysicalModel(
    shape: BoxShape.circle,
    color: Colors.white,
    elevation: 5,
    child: IconButton(
      onPressed: onTap,
      icon: const Icon(Icons.chevron_right),
    ),
  );
}

Widget leftRoundScrollButton(onTap) {
  return PhysicalModel(
    shape: BoxShape.circle,
    color: Colors.white,
    elevation: 5,
    child: IconButton(
      onPressed: onTap,
      icon: const Icon(Icons.chevron_left),
    ),
  );
}
