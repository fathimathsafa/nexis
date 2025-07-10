import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/core/constatnts/colors.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size of the mockup
      minTextAdapt: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "Your Cart",
              style: GoogleFonts.merriweather(color: ColorTheme.maincolor),
            ),
          ),
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 37, 36, 36),
                      radius: 50.r,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey,
                        size: 40.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Browse the marketplace to add some exclusive items",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ),
                Spacer(),
                // Cart Summary
                Divider(color: Colors.grey.shade400),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      Text(
                        "0.0000 ETH",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gas Fee (est.)",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      Text(
                        "0.002 ETH",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade400),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "0.0020 ETH",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // Checkout Button
                MaterialButton(
                  color: ColorTheme.maincolor,
                  minWidth: double.infinity,
                  onPressed: () {
                    // Add your checkout logic here
                  },
                  child: Text(
                    "Checkout with MetaMask",
                    style: TextStyle(color: Colors.black, fontSize: 13.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Secure payments processed via Ethereum blockchain",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
