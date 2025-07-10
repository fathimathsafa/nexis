import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/presentation/login_screen/view/login_screen.dart';

class CustomNexisAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onLogoutPressed;
  final VoidCallback? onNotificationPressed;

  const CustomNexisAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onLogoutPressed,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: Image.asset('assets/logo.png'),

      actions: [
        // Notification Icon in a golden-bordered container with enhanced glow
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              // border: Border.all(color: Color(0xFFFFD700), width: 1.5.w),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD700).withOpacity(0.6),
                  blurRadius: 15.r,
                  spreadRadius: 2.r,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: InkWell(
              onTap: onNotificationPressed,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: const Color(0xFFFFD700),
                size: 20.sp,
              ),
            ),
          ),
        ),

        // Logout Button with golden border and enhanced glow
        Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.black,
                // border: Border.all(color: Color(0xFFFFD700), width: 1.5.w),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withOpacity(0.6),
                    blurRadius: 15.r,
                    spreadRadius: 2.r,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: const Color(0xFFFFD700),
                    size: 18.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Logout",
                    style: GoogleFonts.urbanist(
                      color: const Color(0xFFFFD700),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
