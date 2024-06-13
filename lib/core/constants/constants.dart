import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';

const kTextFieldDecoration = InputDecoration(
  errorStyle: TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
  ),
  hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff919191), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);

const kHomeProductHeaderTitle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  color: AppColors.black,
);

const kHomeSeeMoreTitle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
  color: AppColors.darkGrayBorder,
);

const kProductTitle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
  color: AppColors.black,
);

const kProductPrice = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);

const kProductDiscountedPrice = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  color: AppColors.red,
  decoration: TextDecoration.lineThrough,
  decorationColor: AppColors.red,
);

const kProductTitleHeader = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);

const kProductTitleValue = TextStyle(
  fontSize: 12.0,
  color: AppColors.darkGrayBorder,
);

const kProductDetailsSelectedTab = TextStyle(
  fontSize: 14.0,
  color: AppColors.black,
  fontWeight: FontWeight.bold,
);

const kProductDetailsUnSelectedTab = TextStyle(
  fontSize: 14.0,
  color: AppColors.darkGrayBorder,
);

const kProfileUserNameStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);

const kProfileUserEmailStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  color: AppColors.black,
);

const kProfileOptionTitleStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);

const kProfileOptionDescriptionStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  color: AppColors.darkGrayBorder,
);

const kSplashDuration = 3;
const kCarouselSliderDuration = 3;
const kCarouselSliderMilliseconds = 800;
const kCarouselSliderEdgeInsets =
    EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0);
const kProductViewWidgetEdgeInsets =
    EdgeInsets.only(right: 8.0, left: 1.0, bottom: 1.0, top: 1.0);
const kProductTitleHeaderEdgeInsets =
    EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0);
const kProductDescriptionHeaderEdgeInsets =
    EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 2.0);

const kProductListItemWidgetEdgeInsets =
    EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0);
const kSearchBarWidgetEdgeInsets =
    EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0);

final kImageEditorContainerBoxDecoration = BoxDecoration(
  border: Border.all(width: 1),
  borderRadius: const BorderRadius.all(
    Radius.circular(BorderRadiusConstants.MEDIUM_BORDER_RADIUS),
  ),
);

final List<String> imgList = [
  'https://i.dummyjson.com/data/products/1/1.jpg',
  'https://i.dummyjson.com/data/products/1/3.jpg',
  'https://i.dummyjson.com/data/products/1/4.jpg',
];
