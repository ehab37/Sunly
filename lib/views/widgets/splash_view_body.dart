import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sunly/constants.dart';
import 'package:sunly/core/services/cache_helper.dart';
import 'package:sunly/core/utils/app_router.dart';
import 'package:sunly/core/utils/assets.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState()  {
    super.initState();
    initFadingAnimation();
     checkLastCity();
    navigateHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: animation,
            child: Image.asset(AssetsData.kLogo),
          ),
        ),
      ),
    );
  }

  checkLastCity() {
    String? cityNameCached = CacheHelper.getData(key: kCityNameCached);
    if (cityNameCached != null) {
       context.read<GetWeatherCubit>().getCurrentWeather(
        cityName: cityNameCached,
      );
    }
  }

  void initFadingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  void navigateHome() {
    Future.delayed(const Duration(seconds: 4), () {
      mounted
          ? GoRouter.of(context).pushReplacement(AppRouter.kHomeView)
          : null;
    });
  }
}
