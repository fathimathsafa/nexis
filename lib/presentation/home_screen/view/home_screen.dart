import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/core/constatnts/colors.dart';
import 'package:nexis/core/custom/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  final List<String> voucherImages = [
    'assets/voucher/beach_resort.jpg',
    'assets/voucher/plane.jpg',
    'assets/voucher/bike.jpg',
    'assets/voucher/island.jpg',
    'assets/voucher/ship.jpg',
    'assets/voucher/cooking.jpg',
    'assets/voucher/concert.jpg',
    'assets/resturaent.jpg',
  ];

  final List<String> offerTexts = [
    'Luxury Beach Resort',
    'World Tour',
    'Exotic Bike Collection',
    'Exclusive Island Getaway',
    'Luxury Yacht Party',
    'Private Chef Experience',
    'VIP Concert Experience',
    'Gourmet Cuisine',
  ];
  final List<IconData> icons = [
    Icons.restaurant_menu,
    Icons.bed_outlined,
    Icons.calendar_today_outlined,
    Icons.rectangle_outlined,
    Icons.more_horiz,
  ];
  final List<String> offerImages = [
    "assets/villa.jpg",
    "assets/dining.jpg",
    "assets/car.jpg",
    "assets/gift.jpg",
    "assets/pool.jpg",
    "assets/robort.jpg",
  ];

  final List<Map<String, String>> slides = [
    {
      'image': 'assets/resturaent.jpg',
      'title': 'RESTAURANT DISCOUNTS',
      'subtitle': 'تجارب ترفيهية',
      'categoryText': 'DINING',
    },
    {
      'image': 'assets/netflix.jpg',
      'title': 'Entertainment Passes',
      'subtitle': 'مشاهدة غير محدودة',
      'categoryText': 'LEISURE',
    },
    {
      'image': 'assets/pool.jpg',
      'title': 'HOTEL DEALS',
      'subtitle': 'استرخاء وتجديد',
      'categoryText': 'TRAVEL',
    },
  ];
  final List<String> offerLabels = [
    'Limited Time',
    '20% OFF',
    'Buy 1 Get 1',
    'Flash Deal',
    'Weekend Offer',
    'Exclusive',
  ];
  final List<String> offerCategory = [
    'Five Palm Beach Villa',
    'GELATO DIVINO',
    'WOW Cars',
    'Luxury Gift Box (Black & Gold)',
    'Luxury Weekend Package',
    'Limited Edition Digital Asset',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % slides.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNexisAppBar(title: "Nexis", showBackButton: true),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              // Featured Experience Card
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: ColorTheme.black,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FEATURED EXPERIENCE',
                      style: GoogleFonts.merriweather(
                        color: ColorTheme.maincolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 240.h,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: slides.length,
                        itemBuilder: (context, index) {
                          final slide = slides[index];
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.asset(
                                  slide['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade800,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                left: 12.w,
                                top: 30.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorTheme.maincolor,
                                        borderRadius: BorderRadius.circular(
                                          4.r,
                                        ),
                                      ),
                                      child: Text(
                                        slide['categoryText']!,
                                        style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50.h),
                                    Text(
                                      slide['title']!,
                                      style: GoogleFonts.merriweather(
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                        foreground:
                                            Paint()
                                              ..shader = const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                    255,
                                                    238,
                                                    204,
                                                    10,
                                                  ),
                                                  Color.fromARGB(
                                                    255,
                                                    205,
                                                    175,
                                                    2,
                                                  ),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ).createShader(
                                                Rect.fromLTWH(
                                                  0,
                                                  0,
                                                  200.w,
                                                  70.h,
                                                ),
                                              ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      slide['subtitle']!,
                                      style: TextStyle(
                                        color: ColorTheme.white,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 12.w,
                                right: 12.w,
                                bottom: 12.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorTheme.maincolor,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                            vertical: 10.h,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Learn More",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 1.w,
                                          ),
                                          backgroundColor: Colors.black,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                            vertical: 10.h,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Book Now",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 20.h),

              // // Featured Categories
              // Container(
              //   padding: EdgeInsets.all(16.r),
              //   decoration: BoxDecoration(
              //     color: ColorTheme.black,
              //     border: Border.all(color: Colors.grey.shade400),
              //     borderRadius: BorderRadius.circular(12.r),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'FEATURED CATEGORIES',
              //         style: GoogleFonts.merriweather(
              //           color: ColorTheme.maincolor,
              //           fontSize: 18.sp,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       SizedBox(height: 16.h),
              //       SizedBox(
              //         height: 100.h,
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: icons.length,
              //           itemBuilder: (context, index) {
              //             return Container(
              //               width: 90.w,
              //               margin: EdgeInsets.only(right: 12.w),
              //               padding: EdgeInsets.all(12.r),
              //               decoration: BoxDecoration(
              //                 color: Colors.grey[850],
              //                 borderRadius: BorderRadius.circular(12.r),
              //               ),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Container(
              //                     width: 40.w,
              //                     height: 40.h,
              //                     decoration: BoxDecoration(
              //                       color: ColorTheme.black,
              //                       borderRadius: BorderRadius.circular(8.r),
              //                       boxShadow: [
              //                         BoxShadow(
              //                           color: ColorTheme.maincolor,
              //                           spreadRadius: 1.r,
              //                           blurRadius: 5.r,
              //                           offset: Offset(0, 2.h),
              //                         ),
              //                       ],
              //                     ),
              //                     child: Icon(
              //                       icons[index],
              //                       color: ColorTheme.maincolor,
              //                       size: 20.sp,
              //                     ),
              //                   ),
              //                   SizedBox(height: 8.h),
              //                   Text(
              //                     'Label',
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 12.sp,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: ColorTheme.black,
                  border: Border.all(color: Colors.grey.shade400, width: 1.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FEATURED OFFERS',
                      style: GoogleFonts.merriweather(
                        color: ColorTheme.maincolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Container(
                              height: 300.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 6.r,
                                    offset: Offset(0, 3.h),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(12.r),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                offerImages[index],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: Container(
                                            height: 40.h,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                            ),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: ColorTheme.maincolor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20.r),
                                              ),
                                            ),
                                            child: Text(
                                              offerLabels[index],
                                              style: GoogleFonts.merriweather(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          offerCategory[index],
                                          style: GoogleFonts.merriweather(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: ColorTheme.maincolor,
                                          ),
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          color: ColorTheme.maincolor,
                                          size: 20.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: ColorTheme.black,
                  border: Border.all(color: Colors.grey.shade400, width: 1.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Text(
                        'FEATURED VOUCHERS',
                        style: GoogleFonts.merriweather(
                          color: ColorTheme.maincolor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // List of containers
                    ...List.generate(8, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Container(
                          height: 250.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6.r,
                                offset: Offset(0, 3.h),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  voucherImages[index],
                                  height: 250.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 1.h,
                                left: 12.w,
                                child: Text(
                                  offerTexts[index],
                                  style: GoogleFonts.merriweather(
                                    color: ColorTheme.maincolor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 12.h,
                                right: 12.w,
                                child: Container(
                                  height: 36.h,
                                  width: 36.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorTheme.maincolor,
                                      width: 1.w,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 20.sp,
                                    color: ColorTheme.maincolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
