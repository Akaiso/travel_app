import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiImageCarousel extends StatefulWidget {
  const MultiImageCarousel({super.key});

  @override
  State<MultiImageCarousel> createState() => _MultiImageCarouselState();
}

class _MultiImageCarouselState extends State<MultiImageCarousel> {
  final CarouselController _controller = CarouselController();
  final List<String> _images = [
    'assets/images/image1.png',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image1.png',
  ];

  // int _currentIndex = 0;
  // bool _isScrollingRight = true;
  bool _autoPlay = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CarouselSlider(
              items: _images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 3,
                viewportFraction: MediaQuery.of(context).size.width < 800? 0.7 : 0.4, // Show 2.5 images at a time
                autoPlay: _autoPlay,
                pauseAutoPlayInFiniteScroll: false,
                autoPlayInterval:
                    const Duration(seconds: 4), // Set auto-play interval
                enlargeCenterPage: false,
                // onPageChanged: (index, reason) {
                //   setState(() {
                //      _currentIndex = index;
                //   });

                  // Change scrolling direction if at the ends
                  // if (_currentIndex == 0) {
                  //   _isScrollingRight = true;
                  //   if (_autoPlay = false) {
                  //     _isScrollingRight = false;
                  //   }
                  // } else if (_currentIndex == _images.length - 1) {
                  //   _isScrollingRight = false;
                  //   _currentIndex = 0;
                  // }

                  // Scroll to the next or previous page based on direction
                  // if (_isScrollingRight) {
                  //   Future.delayed(const Duration(seconds: 3), () async {
                  //     await _controller.nextPage();
                  //   });
                  //   // _controller.nextPage();
                  // } else {
                  //   Future.delayed(const Duration(seconds: 3), () async {
                  //     await _controller.previousPage();
                  //   });
                  // }
               // },
              ),
            ),
          ],
        ),
        Positioned(
          top: 90,
          child: Container(
            width: MediaQuery.of(context).size.width -40,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PhysicalModel(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    elevation: 5,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        setState(() {
                          _autoPlay = false;
                          // _isScrollingRight = false;
                        });_controller.previousPage();
                      },
                    ),
                  ),
                  PhysicalModel(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    elevation: 5,
                    child: IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {

                          setState(() {
                            _autoPlay = false;
                            // _isScrollingRight = false;
                          });_controller.nextPage();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class MultiImageCarousel extends StatefulWidget {
//   const MultiImageCarousel({super.key});
//
//   @override
//   State<MultiImageCarousel> createState() => _MultiImageCarouselState();
// }
//
// class _MultiImageCarouselState extends State<MultiImageCarousel> {
//   final CarouselController _controller = CarouselController();
//   final List<String> _images = [
//     'assets/image1.jpg',
//     'assets/image2.jpg',
//     'assets/image3.jpg',
//     'assets/image4.jpg',
//   ];
//
//   int _currentIndex = 0;
//   bool _isScrollingRight = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           CarouselSlider(
//             items: _images.map((imagePath) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                     child: Image.asset(
//                       imagePath,
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//             carouselController: _controller,
//             options: CarouselOptions(
//               height: MediaQuery.of(context).size.height / 3,
//               viewportFraction: 0.4, // Show 2.5 images at a time
//               autoPlay: false,
//               enlargeCenterPage: false,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//
//                 // Change scrolling direction if at the ends
//                 if (_currentIndex == 0) {
//                   _isScrollingRight = true;
//                 } else if (_currentIndex == _images.length - 1) {
//                   _isScrollingRight = false;
//                 }
//
//                 // Scroll to the next or previous page based on direction
//                 if (_isScrollingRight) {
//                   _controller.nextPage();
//                 } else {
//                   _controller.previousPage();
//                 }
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => _controller.previousPage(),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.arrow_forward),
//                 onPressed: () => _controller.nextPage(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ImageCarousel extends StatefulWidget {
//   const ImageCarousel({super.key});
//
//   @override
//  State<ImageCarousel>  createState() => _ImageCarouselState();
// }
//
// class _ImageCarouselState extends State<ImageCarousel> {
//   int _currentIndex = 0;
//   final CarouselController _controller = CarouselController();
//   final List<String> _images = [
//     'assets/image1.png',
//     'assets/image2.jpg',
//     'assets/image3.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(height: 100,
//             child: CarouselSlider(
//               items: _images.map((imagePath) {
//                 return Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 );
//               }).toList(),
//               carouselController: _controller,
//               options: CarouselOptions(
//                 viewportFraction: 1,
//                 autoPlay: true,
//                 enlargeCenterPage: false,
//                 aspectRatio: 10/2, //16/9,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () => _controller.previousPage(),
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_forward),
//                 onPressed: () => _controller.nextPage(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget imageCarousel (){
//   int _currentIndex = 0;
//   final CarouselController _controller = CarouselController();
//   final List<String> _images = [
//     'assets/image1.jpg',
//     'assets/image2.jpg',
//     'assets/image3.jpg',
//   ];
//
//   return Builder(builder: (content)=> Scaffold(
//     appBar: AppBar(
//       title: Text('Image Carousel'),
//     ),
//     body: Column(
//       children: [
//         CarouselSlider(
//           items: _images.map((imagePath) {
//             return Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             );
//           }).toList(),
//           carouselController: _controller,
//           options: CarouselOptions(
//             autoPlay: true,
//             enlargeCenterPage: true,
//             aspectRatio: 16/9,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () => _controller.previousPage(),
//             ),
//             IconButton(
//               icon: Icon(Icons.arrow_forward),
//               onPressed: () => _controller.nextPage(),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );)
// }
