import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:computer_store/Model/carouselImg.dart';
import 'package:computer_store/core/const/color.dart';
import 'package:flutter/material.dart';

class Sildershow extends StatefulWidget {
  const Sildershow({super.key});

  @override
  State<Sildershow> createState() => _SildershowState();
}

class _SildershowState extends State<Sildershow> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemCount: silderImg.length,
          itemBuilder: (context, index, viewIndex) {
            final item = silderImg[index];
            return ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(25),
              child: CachedNetworkImage(
                imageUrl: item.img,
                placeholder: (_, _) => Container(color: Colors.grey),
                errorWidget: (_, _, _) =>
                    Container(color: Colors.grey.shade800),
                fit: BoxFit.fitHeight,
                width: double.maxFinite,
              ),
            );
          },
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(silderImg.length, (index) {
            bool isActive = currentIndex == index;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color.fromARGB(255, 122, 146, 205)
                    : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
    );
  }
}
