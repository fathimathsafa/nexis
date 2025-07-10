import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NFTCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String creator;
  final String price;
  final String currency;
  final String dollarValue;
  final String category;
  final VoidCallback? onAddToCart;

  const NFTCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.creator,
    required this.price,
    required this.currency,
    required this.dollarValue,
    required this.category,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade800, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with category tag
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey.shade600,
                          size: 40.sp,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Category tag
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: const Color(0xFFFFD700),
                      width: 1.w,
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: const Color(0xFFFFD700),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content section
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: GoogleFonts.merriweather(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                // Creator
                Text(
                  'Created by $creator',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 12.sp,
                  ),
                ),

                SizedBox(height: 16.h),

                // Price and Add to Cart button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.currency_bitcoin,
                              color: const Color(0xFFFFD700),
                              size: 16.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '$price $currency',
                              style: TextStyle(
                                color: const Color(0xFFFFD700),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          dollarValue,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),

                    // Add to Cart button
                    ElevatedButton.icon(
                      onPressed: onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        elevation: 0,
                      ),
                      icon: Icon(Icons.shopping_cart_outlined, size: 16.sp),
                      label: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
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
    );
  }
}

// Example usage widget
class NFTGallery extends StatelessWidget {
  const NFTGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Digital Art Collection',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section like in your image
            Row(
              children: [
                Text(
                  'All Categories',
                  style: GoogleFonts.merriweather(
                    color: const Color(0xFFFFD700),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    '2 Items',
                    style: TextStyle(
                      color: const Color(0xFFFFD700),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Spacer(),
                Icon(Icons.filter_list, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  'Filters',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                SizedBox(width: 16.w),
                Text(
                  'Newest',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // NFT Cards
            SizedBox(
              height: 320.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  NFTCard(
                    imageUrl: 'assets/nft1.jpg', // Replace with your image
                    title: 'Digital Horizon',
                    creator: '@future_landscapes',
                    price: '0.0017',
                    currency: 'ETH',
                    dollarValue: '\$3.50',
                    category: 'Digital Art',
                    onAddToCart: () {
                      // Add to cart functionality
                      print('Added Digital Horizon to cart');
                    },
                  ),
                  NFTCard(
                    imageUrl: 'assets/nft2.jpg', // Replace with your image
                    title: 'Cyber Dreams',
                    creator: '@digital_artist',
                    price: '0.0025',
                    currency: 'ETH',
                    dollarValue: '\$5.25',
                    category: 'Digital Art',
                    onAddToCart: () {
                      print('Added Cyber Dreams to cart');
                    },
                  ),
                  NFTCard(
                    imageUrl: 'assets/nft3.jpg', // Replace with your image
                    title: 'Virtual Reality',
                    creator: '@vr_creator',
                    price: '0.0032',
                    currency: 'ETH',
                    dollarValue: '\$6.80',
                    category: 'VR Art',
                    onAddToCart: () {
                      print('Added Virtual Reality to cart');
                    },
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
