import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/core/constatnts/colors.dart';
import 'package:nexis/core/custom/app_bar.dart';

class AppCardScreen extends StatelessWidget {
  const AppCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNexisAppBar(title: "Nexis", showBackButton: true),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App bar icons

              // Search box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFFD700)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Filter apps...',
                    hintStyle: TextStyle(color: Color(0xFFFFD700)),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Card
              appCard(
                imageUrl:
                    'assets/hub/onefreezone.jpg', // Replace with real image URL
                title: 'One Free Zone',
                onPressed: () {
                  // handle navigation
                },
              ),
              SizedBox(height: 20.h),
              appCard(
                imageUrl: 'assets/hub/zoco.png', // Replace with real image URL
                title: 'Zoco',
                onPressed: () {
                  // handle navigation
                },
              ),
              SizedBox(height: 20.h),
              appCard(
                imageUrl:
                    'assets/hub/clanofpet.jpg', // Replace with real image URL
                title: 'Clan of Pet',
                onPressed: () {
                  // handle navigation
                },
              ),
              SizedBox(height: 20.h),
              appCard(
                imageUrl:
                    'assets/hub/nexsta.jpg', // Replace with real image URL
                title: 'Nexsta',
                onPressed: () {
                  // handle navigation
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget badgeIcon(IconData icon, String count) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Icon(icon, color: Color(0xFFFFD700), size: 28.sp),
        CircleAvatar(
          radius: 8.r,
          backgroundColor: Colors.black,
          child: Text(
            count,
            style: TextStyle(
              fontSize: 10.sp,
              color: Color(0xFFFFD700),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget logoutButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFD700)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        'Logout',
        style: TextStyle(color: Color(0xFFFFD700), fontSize: 12.sp),
      ),
    );
  }

  Widget appCard({
    required String imageUrl,
    required String title,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        color: ColorTheme.black,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              imageUrl,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: GoogleFonts.merriweather(
              color: ColorTheme.maincolor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTheme.maincolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              minimumSize: Size(double.infinity, 40.h),
            ),
            onPressed: onPressed,
            child: Text(
              'Visit Application',
              style: TextStyle(color: ColorTheme.white),
            ),
          ),
        ],
      ),
    );
  }
}
