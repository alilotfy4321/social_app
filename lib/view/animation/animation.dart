import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared_in_app/custom_widgets/vhSpace.dart';

class TestAnimation extends StatefulWidget {
  const TestAnimation({super.key});

  @override
  State<TestAnimation> createState() => _TestAnimationState();
}

bool isClicked = false;
int count = 1;
List<String> images = [
  'assets/images/1.webp',
  'assets/images/2.webp',
  'assets/images/3.webp',
  'assets/images/4.webp'
];
List<String> itemsTitles = ['Meat', 'Fruits', 'Vegetabl', 'Chease'];
List<String> sliderItems = [
  'assets/images/1.webp',
  'assets/images/2.webp',
  'assets/images/3.webp',
  'assets/images/4.webp'
];
int currentIndex = 0;

class _TestAnimationState extends State<TestAnimation> {
  @override
  Widget build(BuildContext context) {
    CarouselSliderController buttonCarouselController =
        CarouselSliderController();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Column(
        children: [
          CarouselSlider(
              carouselController: buttonCarouselController,
              items: sliderItems
                  .map(
                    (item) => Container(
                        //height: 500,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(item),
                            fit: BoxFit.cover,
                          ),
                        )),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              )),
          VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              sliderItems.length,
              (index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: (index==currentIndex)?Colors.blue:Colors.grey,
                ),
                margin: EdgeInsets.all(5),
                width: 30,
                height: 10,
              ),
            ),
          ),
          VSpace(),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    //color: Colors.grey,
                    child: Stack(children: [
                      Positioned(
                        top: 33,
                        child: Container(
                          height: 100,
                          width: 120,
                          color: Colors.white,
                          //child: Text('data',textAlign: TextAlign.end,),
                        ),
                      ),
                      CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30,
                              //backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(images[index]),
                            ),
                          )),
                      Positioned(
                        top: 60,
                        right: 2,
                        left: 2,
                        child: Center(child: Text(itemsTitles[index])),
                      ),
                    ]),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
