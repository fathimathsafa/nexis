import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexis/core/constatnts/colors.dart';

class NexisBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NexisBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<IconData> icons = const [
    Icons.home_outlined,
    Icons.shopping_basket_outlined,
    Icons.trending_up_outlined,
    Icons.card_membership,
    Icons.shopping_cart_outlined,
    Icons.person_outline,
  ];

  final List<String> labels = const [
    "Home",
    "Market",
    "Hub",
    "Member",
    "Orders",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      color: const Color(0xFF111111),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected
                    ? buildActiveIcon(icons[index])
                    : Icon(icons[index], color: Colors.white, size: 24.sp),
                SizedBox(height: 4.h),
                if (isSelected)
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: ColorTheme.maincolor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buildActiveIcon(IconData icon) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF5D76E),
        boxShadow: [
          BoxShadow(
            color:ColorTheme.maincolor,
            blurRadius: 10.r,
            spreadRadius: 2.r,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white, size: 20.sp),
      ),
    );
  }
}
