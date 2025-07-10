import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexis/core/custom/app_bar.dart';
import 'package:nexis/presentation/market_screen/controller/market_screen_provider.dart';
import 'package:nexis/presentation/market_screen/widget/product_card.dart';
import 'package:provider/provider.dart';
import 'package:nexis/core/constatnts/colors.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MarketplaceProvider>(context);
    return Scaffold(
      backgroundColor: ColorTheme.black,
      appBar: const CustomNexisAppBar(title: "Nexis", showBackButton: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: ColorTheme.black,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.merriweather(
                        color: ColorTheme.maincolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Column(
                      children: [
                        categoryTile(context, "Digital Art"),
                        categoryTile(context, "Game Items"),
                        categoryTile(context, "Collectibles"),
                        categoryTile(context, "Virtual Lands"),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Price Range
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: ColorTheme.black,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price Range",
                      style: GoogleFonts.merriweather(
                        color: ColorTheme.maincolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: ColorTheme.maincolor,
                        inactiveTrackColor: Colors.grey.shade800,
                        thumbColor: ColorTheme.maincolor,
                        overlayColor: const Color(0x33FFD700),
                        valueIndicatorColor: ColorTheme.maincolor,
                      ),
                      child: RangeSlider(
                        values: RangeValues(
                          provider.minPrice,
                          provider.maxPrice,
                        ),
                        min: 0,
                        max: 10,
                        divisions: 20,
                        labels: RangeLabels(
                          "${provider.minPrice.toStringAsFixed(1)} ETH",
                          "${provider.maxPrice.toStringAsFixed(1)} ETH",
                        ),
                        onChanged: (RangeValues values) {
                          provider.updatePriceRange(values.start, values.end);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Min',
                          style: GoogleFonts.merriweather(
                            color: ColorTheme.maincolor,
                          ),
                        ),
                        Text(
                          'Max',
                          style: GoogleFonts.merriweather(
                            color: ColorTheme.maincolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: priceBox(provider.minPrice.toStringAsFixed(1)),
                        ),
                        Flexible(
                          child: priceBox(provider.maxPrice.toStringAsFixed(1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Sort
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Marketplace",
                    style: GoogleFonts.merriweather(
                      color: ColorTheme.maincolor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Inside your build method — replace the Container that says "Newest"
                  Consumer<MarketplaceProvider>(
                    builder: (context, provider, child) {
                      return Flexible(
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: DropdownButton<String>(
                              dropdownColor: Colors.grey.shade900,
                              value: provider.selectedSort,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "low_to_high",
                                  child: Text("Sort by: Low to High"),
                                ),
                                DropdownMenuItem(
                                  value: "high_to_low",
                                  child: Text("Sort by: High to Low"),
                                ),
                              ],
                              onChanged: (value) {
                                if (value != null) {
                                  provider.setSort(value);
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 20.h),
NFTCard(
  imageUrl: 'assets/resturaent.jpg',
  title: 'Digital Horizon',
  creator: '@future_landscapes',
  price: '0.0017',
  currency: 'ETH',
  dollarValue: '\$3.50',
  category: 'Digital Art',
  onAddToCart: () {
    // Your add to cart logic
  },
),
 SizedBox(height: 20.h),
NFTCard(
  imageUrl: 'assets/robort.jpg',
  title: 'Digital Horizon',
  creator: '@future_landscapes',
  price: '0.0017',
  currency: 'ETH',
  dollarValue: '\$3.50',
  category: 'Digital Art',
  onAddToCart: () {
    // Your add to cart logic
  },
)
              // No products found
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.symmetric(vertical: 40.h),
              //   decoration: BoxDecoration(
              //     color: ColorTheme.black,
              //     border: Border.all(color: Colors.grey.shade400),
              //     borderRadius: BorderRadius.circular(12.r),
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         "No products found",
              //         style: GoogleFonts.merriweather(
              //           color: ColorTheme.maincolor,
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       SizedBox(height: 8.h),
              //       Text(
              //         "Try adjusting your filters",
              //         style: GoogleFonts.merriweather(color: Colors.white),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryTile(BuildContext context, String label) {
    final provider = Provider.of<MarketplaceProvider>(context);
    bool selected = provider.selectedCategory == label;
    return InkWell(
      onTap: () => provider.selectCategory(label),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: const Color(0xFFFFD700),
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }

  Widget priceBox(String value) {
    return Container(
      width: 80.w,
      height: 40.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        value,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }
}
