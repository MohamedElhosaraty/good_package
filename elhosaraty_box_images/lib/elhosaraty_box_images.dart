library elhosaraty_box_images;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ElhosaratyImages extends StatefulWidget {
  const ElhosaratyImages({super.key});

  @override
  State<ElhosaratyImages> createState() => _ElhosaratyImagesState();
}

class _ElhosaratyImagesState extends State<ElhosaratyImages> {

  CarouselController controller =CarouselController();
  int activeIndex =0;

  List<String> imagesUrl =
      [
        "https://th.bing.com/th?id=OIP.roeJGz3eeyhxK3XRQ0LxpQHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        "https://th.bing.com/th?id=OIP.hqgXmy-r13g-63xcvlz6AwHaE7&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        "https://th.bing.com/th?id=OIP.YAXlTjvtEKchdMVc5laZhwHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        "https://th.bing.com/th?id=OIP.gwvaCTBDdkKS-TU9IQcjngHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        "https://th.bing.com/th?id=OIP.QVBY30VqTi-tlYt_BaoGqAHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        "https://th.bing.com/th?id=OIP.CvMAeJSHI_WeUIJD8x32QAHaEZ&w=324&h=192&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        "https://th.bing.com/th?id=OIP.E4IJcali_762Oo_vNhhbFgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const  Text(
          'Mohamed Elhosaraty',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: imagesUrl.length,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayCurve: Curves.bounceInOut,
                height: 250,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                }),
            itemBuilder:
                (BuildContext context, int index, int realIndex) {
              return Image.network(imagesUrl[index],
                fit: BoxFit.cover,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imagesUrl.length,
            onDotClicked: (index) {
              controller.animateToPage(index);
            },
            effect: const ExpandingDotsEffect(
              dotWidth: 20,
              dotHeight: 20,
              activeDotColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
