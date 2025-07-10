import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexis/core/constatnts/colors.dart';
import 'package:nexis/presentation/bottom_navigation_screen/view/navigation.dart';
import 'package:nexis/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  // Define heights for each tab
  final List<double> _tabHeights = [
    280.h, // Credentials tab height
    180.h, // MetaMask tab height
    380.h, // NFT tab height
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentTabIndex = _tabController.index;
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
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/logo.png',
                  height: 180.h,
                ),
               
                SizedBox(height: 32.h),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Credentials'),
                    Tab(text: 'MetaMask'),
                    Tab(text: 'NFT'),
                  ],
                  labelColor: ColorTheme.maincolor,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 14.sp),
                  unselectedLabelStyle: TextStyle(fontSize: 14.sp),
                  indicator: BoxDecoration(
                    color: ColorTheme.black,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: ColorTheme.maincolor, width: 2.w),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                ),
                SizedBox(height: 24.h),

                // AnimatedContainer that changes height based on selected tab
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _tabHeights[_currentTabIndex],
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Credentials Tab Content
                      _buildCredentialsTab(controller),

                      // MetaMask Tab Content
                      _buildMetaMaskTab(),

                      // NFT Tab Content
                      _buildNFTTab(),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ⓘ Report an issue",
                      style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                    ),
                    Text(
                      "🌐 Switch to Arabic",
                      style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7C640),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 14.h,
                    ),
                  ),
                  child: Text(
                    'BECOME A MEMBER',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Credentials Tab Content
 // Credentials Tab Content
Widget _buildCredentialsTab(LoginController controller) {
  return Column(
    children: [
      Flexible(
        child: TextField(
          controller: controller.emailController,
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: 'E-mail / Member ID',
            hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      Flexible(
        child: TextField(
          controller: controller.passwordController,
          obscureText: controller.obscurePassword,
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.white54,
                size: 20.sp,
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
          ),
        ),
      ),
      SizedBox(height: 8.h),
      Flexible(
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password',
              style: TextStyle(color: Colors.white70, fontSize: 12.sp),
            ),
          ),
        ),
      ),
      SizedBox(height: 8.h),
      Flexible(
        child: ElevatedButton(
          onPressed: controller.isLoading
              ? null
              : () async {
                  // Call Firebase sign-in function
                  bool loginSuccess = await controller.signIn(context);
                  
                  // Navigate only if login is successful
                  if (loginSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationScreen(),
                      ),
                    );
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF7C640),
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            minimumSize: Size(double.infinity, 50.h),
          ),
          child: controller.isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                )
              : Text(
                  'SIGN IN',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
        ),
      ),
    ],
  );
}
  // MetaMask Tab Content
  Widget _buildMetaMaskTab() {
    return Column(
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Text(
                    'Connect with your MetaMask wallet to access exclusive Web3 features',
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        ElevatedButton(
          onPressed: () {
            // Add MetaMask connection logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 37, 36, 36),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            minimumSize: Size(double.infinity, 50.h),
          ),
          child: Text(
            'CONNECT METAMASK',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorTheme.maincolor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  // NFT Tab Content
  Widget _buildNFTTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.nfc_outlined,
                  size: 60.sp,
                  color: ColorTheme.maincolor,
                ),
                SizedBox(height: 16.h),
                Text(
                  'NFT Authentication',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Access premium content by verifying your NFT ownership',
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                TextField(
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: 'NFT Contract Address',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 14.sp,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                        color: ColorTheme.maincolor,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                        color: ColorTheme.maincolor.withOpacity(0.5),
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                        color: ColorTheme.maincolor,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: 'Token ID',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 14.sp,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                        color: ColorTheme.maincolor,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                        color: ColorTheme.maincolor.withOpacity(0.5),
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      borderSide: BorderSide(
                        color: ColorTheme.maincolor,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    // Add NFT authentication logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.maincolor,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    minimumSize: Size(double.infinity, 50.h),
                  ),
                  child: Text(
                    'LOGIN WITH NFT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Your NFT license will remain valid even if you transfer the token.',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 11.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
