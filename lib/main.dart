import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexis/firebase_options.dart';
import 'package:nexis/presentation/bottom_navigation_screen/view/navigation.dart';
import 'package:nexis/presentation/cart_screen/view/cart_screen.dart';
import 'package:nexis/presentation/hub_screen/view/hub_screen.dart';
import 'package:nexis/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:nexis/presentation/login_screen/view/login_screen.dart';
import 'package:nexis/presentation/market_screen/controller/market_screen_provider.dart';
import 'package:nexis/presentation/market_screen/view/market_screen.dart';
import 'package:nexis/presentation/member_screen/view/member_screen.dart';
import 'package:nexis/presentation/orders_screen/view/orders_screen.dart';
import 'package:nexis/presentation/profile_screen/view/profile_screen.dart';
import 'package:nexis/presentation/splash_screen/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_)=>MarketplaceProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Use your design's base size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
