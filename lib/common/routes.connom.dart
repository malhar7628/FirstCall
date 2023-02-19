import 'package:first_call_app/screen/dashboard_aftershowcase_screen.dart';
import 'package:first_call_app/screen/onboard_dope_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screen/account_screen.dart';
import '../screen/dashboard.screen.dart';
import '../screen/player.screen.dart';
import '../screen/sign_in.screen.dart';
import '../screen/sign_up.screen.dart';
import '../screen/video.screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: SignUpScreen.name,
    page: () => const SignUpScreen(),
    // binding: SignUpBinding(),
  ),
  GetPage(
    name: SignInScreen.name,
    page: () => const SignInScreen(),
    // binding: SignInBinding(),
  ),
  GetPage(
    name: OnBoardDopeScreen.name,
    page: () => const OnBoardDopeScreen(),
  ),
  GetPage(
    name: DashboardScreenPostShowCase.name,
    page: () => const DashboardScreenPostShowCase(),
  ),
  GetPage(
    name: DashboardScreen.name,
    page: () => const DashboardScreen(),
  ),
  GetPage(
    name: VideoScreen.name,
    page: () => const VideoScreen(),
  ),
  GetPage(
    name: MyHomePage.name,
    page: () => MyHomePage(video: Get.arguments["video"]),
  ),
/*
  */ /*GetPage(
    name: SlotDateScreen.name,
    page: () => SlotDateScreen(
      point: Get.arguments["point"],
    ),
  ),*/ /*
  GetPage(
    name: TransactionsScreen.name,
    page: () =>  TransactionsScreen(),
  ),
  GetPage(
    name: ContactScreen.name,
    page: () =>  const ContactScreen(),
  ),
  GetPage(
    name: MyBookingScreen.name,
    page: () =>  const MyBookingScreen(),
  ),
  GetPage(
    name: MyBookingScreen.name,
    page: () =>  const MyBookingScreen(),
  ),
  GetPage(
    name: MyDefaultBookingScreen.name,
    page: () =>  const MyDefaultBookingScreen(),
  ),
  GetPage(
    name: ManageVehiclesScreen.name,
    page: () => const ManageVehiclesScreen(),
  ),
  GetPage(
    name: AddVehicleScreen.name,
    page: () => AddVehicleScreen(showSkip: Get.arguments?["showSkip"]),
  ),
  GetPage<CarModel?>(
    name: SelectCarModelScreen.name,
    page: () => const SelectCarModelScreen(),
    transition: Transition.downToUp,
  ),
  GetPage<TransactionStatus?>(
    name: TransactionViewScreen.name,
    page: () => TransactionViewScreen(
      url: Get.arguments["url"],
      ccAvenueDetailsModel: Get.arguments["ccAvenueDetailsModel"],
    ),
    transition: Transition.downToUp,
  ),
// S-Cube code starts
GetPage(name: AccountTab.name, page: () => AccountTab()),
  GetPage(name: ResetPassword.name, page: () => const ResetPassword()),
  GetPage(
      name: ManageVehicleScreen.name, page: () => const ManageVehicleScreen()),
  GetPage(
      name: Complaints.name,
      page: () =>  Complaints()
  ),
  GetPage(
      name: Showdates.name,
      page: () =>  const Showdates()
  ),
  GetPage(
      name: NewComplaints.name,
      page: () =>  NewComplaints(
        */ /*gc:
        Get.arguments["gc"],
      )*/ /*
      )),
  GetPage(
      name: SlotBooking.name,
      page: () => SlotBooking(point: Get.arguments["point"],*/ /*connectors: '', ammount: '',*/ /*nw: Get.arguments["nw"],*/
// S-Cube code ends
];
