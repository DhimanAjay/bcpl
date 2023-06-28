import 'package:bcpl_fun_club_project/presentation/final_page/final_binding.dart';
import 'package:bcpl_fun_club_project/presentation/final_page/final_screen.dart';



import 'package:get/get.dart';
import '../../presentation/details_page/details_binding.dart';
import '../../presentation/details_page/details_screen.dart';
import '../../presentation/home_page/manage_subscription_binding.dart';
import '../../presentation/home_page/manage_subscription_screen.dart';


import '../../presentation/scrach_card_page/scrach_card_binding.dart';
import '../../presentation/scrach_card_page/scrach_card_screen.dart';
import '../../presentation/splash/splash_binding.dart';
import '../../presentation/splash/splash_screen.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),


    GetPage(
      name: Routes.manageSubscription,
      page: () => ManageSubscriptionScreen(),
      binding: ManageSubscriptionBinding(),
    ),
    GetPage(
      name: Routes.detailsPage,
      page: () => DetailsScreen(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: Routes.finalPage,
      page: () => FinalScreen(),
      binding: FinalBinding(),
    ),
    GetPage(
      name: Routes.scratchCard,
      page: () => const ScratchCardScreen(),
      binding: ScratchCardBinding(),
    ),
  ];
}



