import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final double showOffset;

  const ScrollToTopButton({super.key,
    required this.scrollController,
    this.showOffset = 200, // Default offset to show the button
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ValueNotifier<bool>(
        scrollController.hasClients && scrollController.offset > showOffset,
      ),
      builder: (context, isVisible, child) {
        return isVisible
            ? Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

// class ScrollToTop extends StatefulWidget {
//   const ScrollToTop({super.key});
//
//   @override
//   State<ScrollToTop> createState() => _ScrollToTopState();
// }
//
// class _ScrollToTopState extends State<ScrollToTop> {
//   final ScrollController _scrollController = ScrollController();
//   bool _isButtonVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _scrollListener() {
//     if (_scrollController.offset >= 50 && !_isButtonVisible) {
//       setState(() {
//         _isButtonVisible = true;
//       });
//     } else if (_scrollController.offset < 50 && _isButtonVisible) {
//       setState(() {
//         _isButtonVisible = false;
//       });
//     }
//   }
//
//   void _scrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: const Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scroll To Top Example')),
//       body: Stack(
//         children: [
//           ListView.builder(
//             controller: _scrollController,
//             itemCount: 50,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('Item $index'),
//               );
//             },
//           ),
//           if (_isButtonVisible)
//             Positioned(
//               bottom: 16,
//               right: 16,
//               child: FloatingActionButton(
//                 onPressed: _scrollToTop,
//                 child: const Icon(Icons.arrow_upward),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
