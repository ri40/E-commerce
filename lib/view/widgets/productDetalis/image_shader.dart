import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/logic/controllers/cart_contrller.dart';
import 'package:myproject/routes/routes.dart';
import 'package:myproject/utils/theme.dart';
import 'package:myproject/view/widgets/productDetalis/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageShaders extends StatefulWidget {
  final String imageUrl;

  const ImageShaders({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<ImageShaders> createState() => _ImageShadersState();
}

class _ImageShadersState extends State<ImageShaders> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  final List<Color> colorSelected = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
  ];
  int currentPage = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: Colors.black,
              activeDotColor: Get.isDarkMode ? pinkColor : mainColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (
                context,
                index,
              ) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    color: colorSelected[index],
                    outerBorder: currentColor == index,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 3),
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? pinkColor.withOpacity(0.8)
                        : mainColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: -10, end: -5),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? pinkColor.withOpacity(0.8)
                            : mainColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
