import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/core/constatnts/colors.dart';
import 'package:nexis/core/custom/app_bar.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomNexisAppBar(title: "Nexis", showBackButton: true),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  children: [
                    // Fixed width for left column to prevent overflow
                    SizedBox(
                      width: 140.w, // Fixed width
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 60.r,
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  37,
                                  36,
                                  36,
                                ),
                                child: Text(
                                  'U',
                                  style: TextStyle(
                                    color: ColorTheme.maincolor,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5.r,
                                right: 5.r,
                                child: Container(
                                  height: 24.r,
                                  width: 24.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorTheme.maincolor,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 16.r,
                                    color: ColorTheme.maincolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                color: ColorTheme.maincolor,
                                width: 1.0,
                              ),
                            ),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: ColorTheme.maincolor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    // Expanded for right column to take remaining space
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User',
                            style: GoogleFonts.merriweather(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                Icons.shield_outlined,
                                size: 10.sp,
                                color: ColorTheme.maincolor,
                              ),
                              SizedBox(width: 4.w),
                              Flexible(
                                child: Text(
                                  "Silver Member",
                                  style: GoogleFonts.merriweather(
                                    color: Colors.yellow,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.yellow,
                indicatorWeight: 3.h,
                tabs: [
                  Tab(
                    child: Text(
                      'Personal Info',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Membership',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              IndexedStack(
                index: _selectedIndex,
                children: [_buildPersonalInfoTab(), _buildMembershipTab()],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.yellow, fontSize: 14.sp)),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 37, 36, 36),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextField(
            controller: TextEditingController(text: value),
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoTab() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: ColorTheme.maincolor,
                      size: 24.r,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Personal Details',
                      style: GoogleFonts.merriweather(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Manage your personal information and contact details',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                SizedBox(height: 20.h),
                // Full Name
                _buildTextField('Full Name', 'User'),
                SizedBox(height: 12.h),
                // Email Address
                _buildTextField('Email Address', 'user@example.com'),
                SizedBox(height: 12.h),
                // Email Address
                _buildTextField('Phone Number', '+1 (555) 123-4567'),
                SizedBox(height: 12.h),
                // Email Address
                _buildTextField('Country', 'United States'),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      color: ColorTheme.maincolor,
                      size: 10.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Wallet Information",
                      style: GoogleFonts.merriweather(
                        color: ColorTheme.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Current Balance",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      SizedBox(height: 12.h),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "View Transaction",
                          style: TextStyle(
                            color: ColorTheme.maincolor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipTab() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: ColorTheme.maincolor,
                      size: 24.r,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'Current Membership',
                        style: GoogleFonts.merriweather(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: ColorTheme.maincolor,
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "Silver",
                          style: TextStyle(
                            color: ColorTheme.maincolor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: ColorTheme.maincolor,
                      size: 14.r,
                    ),
                    SizedBox(width: 4.w),
                    Flexible(
                      child: Text(
                        'Member since January 2025 · Expires on January 2026',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: ColorTheme.maincolor,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Reward Points",
                      style: GoogleFonts.merriweather(
                        fontSize: 14.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Available Points",
                              style: TextStyle(
                                color: ColorTheme.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "1250 Points",
                              style: TextStyle(
                                color: ColorTheme.maincolor,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              color: ColorTheme.maincolor,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            "Redeem",
                            style: TextStyle(
                              color: ColorTheme.maincolor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Your Benefits",
                  style: GoogleFonts.merriweather(
                    color: Colors.grey.shade400,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        size: 10.sp,
                        color: ColorTheme.maincolor,
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Text(
                          "10% discount on all purchase",
                          style: GoogleFonts.merriweather(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        size: 10.sp,
                        color: ColorTheme.maincolor,
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Text(
                          "Priority customer support",
                          style: GoogleFonts.merriweather(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        size: 10.sp,
                        color: ColorTheme.maincolor,
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Text(
                          "Early access to new products",
                          style: GoogleFonts.merriweather(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upgrade Your Membership",
                  style: GoogleFonts.merriweather(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Unlock premium features and exclusive benefits by upgrading to a higher tier.",
                  style: GoogleFonts.merriweather(
                    color: Colors.grey.shade400,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {},
                  color: ColorTheme.maincolor,
                  child: Text(
                    "Explore Upgrade Options",
                    style: GoogleFonts.merriweather(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
