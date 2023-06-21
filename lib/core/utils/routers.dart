import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/core/city_model/CityModel.dart';
import 'package:pickytour/core/city_model/Hotels.dart';
import 'package:pickytour/core/utils/api_service.dart';
import 'package:pickytour/core/utils/service_locator.dart';
import 'package:pickytour/features/auth/presntation/view/auth_screen.dart';
import 'package:pickytour/features/booking/presentation/payment/view/payment_screen.dart';
import 'package:pickytour/features/categories/presentation/cities/data/cities_repo_impl.dart';
import 'package:pickytour/features/categories/presentation/cities/view/manager/cities_list_cubit.dart';
import 'package:pickytour/features/splash/presentation/views/splash_screen.dart';
import '../../features/booking/presentation/booking/view/booking_screen.dart';
import '../../features/booking/presentation/booking/view/manager/booking_data_cubit.dart';
import '../../features/categories/presentation/cities/view/cities_screen.dart';
import '../../features/categories/presentation/hotels/view/hotels_screen.dart';
abstract class AppRouter{
  static const authScreenRouter='/auth';
  static const citiesScreen='/citiesScreen';
  static const hotelsScreen='/hotelsScreen';
  static const bookingScreen='/bookingScreen';
  static const paymentScreen='/paymentScreen';


  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: authScreenRouter,
        builder: (BuildContext context, GoRouterState state) =>
           const AuthScreen(),
      ),
      GoRoute(
        path: citiesScreen,
        builder: (BuildContext context, GoRouterState state)=>
          BlocProvider(create: (context)=> CitiesListCubit(getIt.get<CitiesRepoImpl>()),
            child: const CitiesScreen(),
        ),
      ),
      GoRoute(
        path: hotelsScreen,
        builder: (BuildContext context, GoRouterState state) =>
           HotelsScreen(cityModel: state.extra as CityModel,),
      ),
      GoRoute(
        path: bookingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(create: (context)=> BookingDataCubit(getIt.get<ApiService>()),
            child: BookingScreen(hotel: state.extra as Hotel,)
          );
        },
      ),
      GoRoute(
        path: paymentScreen,
        builder: (BuildContext context, GoRouterState state) =>
            BlocProvider(create: (context)=> BookingDataCubit(getIt.get<ApiService>()),
              child: PaymentScreen(bookingDataMap: state.extra as Map<String,dynamic>,),
            )
      ),
    ],
  );
}