import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> arrProductBannersList;
  final double bannerHeight;
  CarouselSliderWidget(
      {required this.arrProductBannersList, required this.bannerHeight});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.bannerHeight,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval:
                  const Duration(seconds: kCarouselSliderDuration),
              autoPlayAnimationDuration:
                  const Duration(milliseconds: kCarouselSliderMilliseconds),
              autoPlayCurve: Curves.decelerate,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              viewportFraction: 1.0), //this property show full width
          items: widget.arrProductBannersList.map((imageURI) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: kCarouselSliderEdgeInsets,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                          BorderRadiusConstants.MEDIUM_BORDER_RADIUS)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        BorderRadiusConstants.MEDIUM_BORDER_RADIUS),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/plp_screen');
                      },
                      child: CachedNetworkImage(
                        imageUrl: imageURI,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: GapConstants.MEDIUM_GAP,
        ),
        buildIndicatorRow(widget.arrProductBannersList.length),
      ],
    );
  }

  Widget buildIndicatorRow(int itemCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          width: HeightConstants.CAROUSEL_SLIDER_HEIGHT_WIDTH,
          height: HeightConstants.CAROUSEL_SLIDER_HEIGHT_WIDTH,
          margin: EdgeInsets.symmetric(
              horizontal: HeightConstants.CAROUSEL_SLIDER_HEIGHT_WIDTH / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
