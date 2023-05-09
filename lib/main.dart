import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeleex_application/bloc/main_page/main_page_collection_bloc.dart';
import 'package:zeleex_application/bloc/news_feed/news_feed_bloc.dart';
import 'package:zeleex_application/Screens/Main%20Sixx%20Pages/bottomMenu_main_page.dart';
import 'package:zeleex_application/bloc/products/products_bloc.dart';
import 'package:zeleex_application/bloc/profile/profile_bloc.dart';
import 'package:zeleex_application/second.dart';
import 'Others/Plate.dart';
import 'bloc/animals/animals_bloc.dart';
import 'bloc/bottom_menu_switch/bottom_menu_switch_bloc.dart';
import 'bloc/store_all/store_all_bloc.dart';

// Navigator.push(
//       event.context,
//       PageTransition(
//         duration: const Duration(milliseconds: 250),
//         type: PageTransitionType.fade,
//         child: NewsFeedPage_Detail(),
//       ),
//     );
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(First_Page()));
}

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimalsBloc()),
        BlocProvider(create: (context) => StoreAllBloc()),
        BlocProvider(create: (context) => ProductsBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => NewsFeedBloc()),
        BlocProvider(create: (context) => MainPageCollectionBloc()),
        BlocProvider(create: (context) => BottomMenuSwitchBloc()),
      ],
      child: MaterialApp(
        builder: ((context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(900, name: MOBILE),
                const ResponsiveBreakpoint.resize(1000, name: MOBILE),
                const ResponsiveBreakpoint.resize(1200, name: TABLET),
              ],
            )),
        theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: ZeleexColor.zeleexGreen,
          appBarTheme: AppBarTheme(color: ZeleexColor.zeleexGreen),
        ),
        home: MainAndIcon(),
      ),
    );
  }
}

class MainAndIcon extends StatefulWidget {
  MainAndIcon({Key? key}) : super(key: key);
  @override
  State<MainAndIcon> createState() => _MainAndIconState();
}

class _MainAndIconState extends State<MainAndIcon> {
  @override
  initState() {
    context.read<MainPageCollectionBloc>().add(Load_SliderPics());
    context.read<MainPageCollectionBloc>().add(Load_ColectionBoard());
    context.read<MainPageCollectionBloc>().add(Load_Catalog());
    _Load_AndGo();
    systemOverlayStyle:
    SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black);
    super.initState();
  }

  Future _Load_AndGo() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();

    var checkToken = prefs2.get('keyToken');

    if (checkToken.toString() != 'null') {
      print("stored token: " + checkToken.toString());
      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomMenu_Page(),
          ),
        );
      });
    } else {
      print("*** no token");
      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(),
          ),
        );
      });
    }
    // await Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SecondPage(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Frame.png',
            ),
          ],
        ),
      ),
    );
  }
}
