import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/core/drawer_menu.dart';
import 'package:flutter_poc/core/services/firebase_service.dart';
import 'package:flutter_poc/features/presentation/pages/home/data/repositories/home_repo.dart';
import 'package:flutter_poc/features/presentation/pages/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_poc/features/presentation/widgets/carousel_slider_widget.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_poc/features/presentation/widgets/product_list_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void simulateCrash() {
    throw Exception('This is a simulated crash for testing purposes.');
  }

  void getRemoteConfigValues(BuildContext context) {
    String appBuildNo =
        FirebaseService().getRemoteConfigStringValue('appBuildNo');
    String appVersionCode =
        FirebaseService().getRemoteConfigStringValue('appVersionCode');
    bool isAppForceUpdate =
        FirebaseService().getRemoteConfigBoolValue('isAppForceUpdate');
    print("versionCode ::: $appBuildNo");
    print("appVersionCode ::: $appVersionCode");
    print("isAppForceUpdate ::: $isAppForceUpdate");
    if (isAppForceUpdate) {
      showUpdatePopup(context, 'App Update Required',
          'Please update to the latest version.');
    }
  }

  void showUpdatePopup(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(Strings.updateNowText),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      this.getRemoteConfigValues(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(HomeRepo())..add(PopularProductHomeScreenEvent()),
      child: Scaffold(
          drawer: DrawerMenuWidget(),
          appBar: CustomAppBar(
            isShowProfile: true,
            headerTitle: Strings.homeTitle.capitalize(),
            onPersonIconPressed: () {
              Navigator.pushNamed(
                context,
                '/my_profile_screen',
              );
            },
          ),
          backgroundColor: AppColors.white,
          body: ListView(
            children: <Widget>[
              CarouselSliderWidget(
                  arrProductBannersList: imgList,
                  bannerHeight: HeightConstants.HOME_BANNER_HEIGHT),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is PopularProductSuccessState) {
                    return ProductListItemWidget(
                        arrProductsList: state.arrPopularItems,
                        headerTitle: Strings.popularProducts);
                  } else if (state is PopularProductFailureState) {
                    return const Center(
                      child: Text(Strings.someThingWentWrong),
                    );
                  } else if (state is PopularProductLoadingState) {
                    return const SizedBox(
                      height: HeightConstants.PRODUCT_CONTAINER_HEIGHT,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is PopularProductSuccessState) {
                    return ProductListItemWidget(
                        arrProductsList: state.arrDealsForYouItems,
                        headerTitle: Strings.dealsForYou);
                  } else if (state is PopularProductFailureState) {
                    return const Center(
                      child: Text(Strings.someThingWentWrong),
                    );
                  } else if (state is PopularProductLoadingState) {
                    return const SizedBox(
                      height: HeightConstants.PRODUCT_CONTAINER_HEIGHT,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          )),
    );
  }
}
