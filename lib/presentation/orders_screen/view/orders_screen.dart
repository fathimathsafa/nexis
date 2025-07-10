import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/core/constatnts/colors.dart';
import 'package:nexis/core/custom/app_bar.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomNexisAppBar(title: "Nexis", showBackButton: true),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF111111),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.white12),
              ),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: ColorTheme.maincolor,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Order History',
                        style: GoogleFonts.merriweather(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'View your past purchases and transaction details',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Colors.white10),
                  SizedBox(height: 20.h),

                  // Star Icon Circle

                  // Message
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Failed to load orders. Please try again later.",
                          style: GoogleFonts.merriweather(
                            color: Colors.white,

                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
