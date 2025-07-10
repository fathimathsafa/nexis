import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexis/presentation/login_screen/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _textController;
  late Animation<double> _imageScaleAnimation;
  late Animation<double> _imageOpacityAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Image animation controller
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Image animations
    _imageScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.elasticOut),
    );

    _imageOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    // Text animations
    _textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutBack),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    // Start image animation
    await _imageController.forward();

    // Wait a bit, then start text animation
    await Future.delayed(const Duration(milliseconds: 300));
    await _textController.forward();

    // Wait before navigating to next screen
    await Future.delayed(const Duration(milliseconds: 1500));

    // Navigate to your main screen
    if (mounted) {
      // Replace with your navigation logic
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Image
            AnimatedBuilder(
              animation: _imageController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _imageScaleAnimation.value,
                  child: Opacity(
                    opacity: _imageOpacityAnimation.value,
                    child: Container(
                      width: 120.w,
                      height: 120.h,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          'assets/logo.png', // Your image path
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback if image doesn't exist
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Icon(null),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 40.h),

            // Animated Text
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return SlideTransition(
                  position: _textSlideAnimation,
                  child: FadeTransition(
                    opacity: _textOpacityAnimation,
                    child: Column(
                      children: [
                        // Main title with gradient
                        ShaderMask(
                          shaderCallback:
                              (bounds) => const LinearGradient(
                                colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                          child: Text(
                            'Welcome to the Future',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.w,
                            ),
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Subtitle
                        SizedBox(height: 8.h),

                        // Loading indicator (optional)
                        SizedBox(
                          width: 100.w,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFD700),
                            ),
                            minHeight: 2.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// // Alternative version with different animation style
// class SplashScreenAlternative extends StatefulWidget {
//   const SplashScreenAlternative({super.key});

//   @override
//   State<SplashScreenAlternative> createState() => _SplashScreenAlternativeState();
// }

// class _SplashScreenAlternativeState extends State<SplashScreenAlternative>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _logoAnimation;
//   late Animation<double> _textAnimation;
//   late Animation<double> _glowAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 3000),
//       vsync: this,
//     );

//     _logoAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.0, 0.5, curve: Curves.bounceOut),
//     ));

//     _textAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
//     ));

//     _glowAnimation = Tween<double>(
//       begin: 0.5,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));

//     _controller.forward();

//     // Auto navigate after animation
//     Future.delayed(const Duration(milliseconds: 3500), () {
//       if (mounted) {
//         // Navigate to your main screen
//         print("Navigate to main screen");
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Container(
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: Alignment.center,
//                 radius: _glowAnimation.value,
//                 colors: [
//                   const Color(0xFFFFD700).withOpacity(0.1),
//                   Colors.black,
//                 ],
//               ),
//             ),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Animated Logo
//                   Transform.scale(
//                     scale: _logoAnimation.value,
//                     child: Transform.rotate(
//                       angle: _logoAnimation.value * 0.2,
//                       child: Container(
//                         width: 150.w,
//                         height: 150.h,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0xFFFFD700).withOpacity(0.5),
//                               blurRadius: 30.r * _glowAnimation.value,
//                               spreadRadius: 10.r * _glowAnimation.value,
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             'assets/images-removebg-preview (1).png',
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF1E1E1E),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Icon(
//                                   Icons.diamond,
//                                   size: 80.sp,
//                                   color: const Color(0xFFFFD700),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 50.h),

//                   // Animated Text
//                   Opacity(
//                     opacity: _textAnimation.value,
//                     child: Transform.translate(
//                       offset: Offset(0, 50.h * (1 - _textAnimation.value)),
//                       child: Column(
//                         children: [
//                           Text(
//                             'NEXIS',
//                             style: TextStyle(
//                               fontSize: 36.sp,
//                               fontWeight: FontWeight.bold,
//                               color: const Color(0xFFFFD700),
//                               letterSpacing: 8.w,
//                               shadows: [
//                                 Shadow(
//                                   color: const Color(0xFFFFD700).withOpacity(0.5),
//                                   blurRadius: 10.r,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 16.h),
//                           Text(
//                             'Luxury • Exclusive • Premium',
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               color: Colors.white60,
//                               letterSpacing: 2.w,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
