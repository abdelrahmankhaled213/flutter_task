import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_image.dart';
import 'package:flutter_task/core/utils/app_style.dart';

import '../../../../core/utils/app_color.dart';

class FilterView extends StatefulWidget {

  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {

  String _selectedType = 'الكل';
  String _selectedRooms = '5 غرف+';
  String _selectedPayment = 'كاش';
  String _selectedStatus = 'جاهز';

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 4.0),

      child: ActionChip(
        label: Text(label, style: TextStyle(
          color: isSelected ? Colors.blue.shade800 : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        )),

        side: BorderSide(
          color: isSelected ? Colors.blue.shade800 : Colors.grey.shade300,
          width: 1.5,
        ),

        backgroundColor: isSelected ? Colors.blue.shade50 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onTap,
      ),
    );
  }

  Widget _buildSectionTitle(String title
      , {IconData? icon, Widget? trailing}) {

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
       child: Text(
         title,
         style:AppStyle.instance.mediumTajwalCustomGrey12.copyWith(
           fontSize: 16.sp
         )
       ),
    );
  }

  Widget _buildFilterTextField({required String hintText}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextFormField(

          decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.instance.borderColor
            )
          ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
borderSide: BorderSide(
  color: AppColor.instance.borderColor
)
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            
            child: CustomScrollView(

              slivers: <Widget>[

                SliverToBoxAdapter(
                  child: SizedBox(height: 12.h,),
                ),

                SliverAppBar(

                  pinned: true,

                  elevation: 0,

                  surfaceTintColor: Colors.transparent,
                  leading: IconButton(
                    icon:  Icon(Icons.close
                        , color: AppColor.instance.black, size: 24.sp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    'فلترة',
                    style: AppStyle.instance
                        .mediumTajwalBlack16.copyWith(
                      fontSize: 24.sp
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 12.sp,
                        left: 16.sp
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'رجوع للافتراضي',
                          style: AppStyle.instance.boldTajwalBlue16
                        ),
                      ),
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 20.h,),
                ),

                SliverList(

                  delegate: SliverChildListDelegate(

                      [

                    Padding(
                      padding:  EdgeInsets.only(right: 16.sp
                          ,left: 16.sp),

                      child:
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                         children: <Widget>[

                          _buildSectionTitle('الفئة'
                              , trailing:  Text('تغيير'
                              , style: AppStyle.instance.mediumTajwalBlack16.copyWith(
                                color: AppColor.instance.customGrey
                              )
                          )
                          ), // Category

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [

                              Row(
                                children: [
                                  Image.asset(AppImage.instance.shopping
                                    ,height: 24.sp,width: 24.sp,),

                                   SizedBox(width: 8.w),

                                  Column(

                                    children: [

                                      Text('عقارات',
                                          style:
                                          AppStyle.instance
                                              .mediumTajwalBlack16.copyWith(

                                            fontSize: 14.sp
                                          )),

                                      Text('فلل للبيع'
                                          , style:  AppStyle.instance
                                              .mediumTajwalCustomGrey12),
                                    ],
                                  ),
                                ],
                              ),

                              Text("تغيير",style: AppStyle.instance.boldTajwalBlue16.copyWith(

                                color: Color(0xff3B4CF2),

                              ),
                              )

                            ],
                          ),

                           Divider(height: 12.h),


                          Row(
                            children: [


                              Icon(Icons.location_on_outlined
                                ,size: 24.sp
                                ,color: AppColor.instance.black,),

                              SizedBox(
                                width: 8.w,
                              ),

                              Column(

                                children: [


                                  Text('الموقع ',style:
                              AppStyle.instance
                                  .mediumTajwalBlack16.copyWith(

                                  fontSize: 14.sp
                              ),
                                                  ),

                                   Text('مصر'
                                      , style: AppStyle.instance
                                           .mediumTajwalCustomGrey12
                                  ),
                                ],
                              ),

                            ],
                          ),

                          const Divider(height: 12),

                          _buildSectionTitle('الأقساط الشهرية'),

                          Row(
                            children: [
                              _buildFilterTextField(hintText: 'من'),
                              _buildFilterTextField(hintText: 'إلى'),
                            ],
                          ),

                          _buildSectionTitle('النوع'),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildFilterChip(
                                  label: 'الكل',
                                  isSelected: _selectedType == 'الكل',
                                  onTap: () => setState(() => _selectedType = 'الكل'),
                                ),
                                _buildFilterChip(
                                  label: 'فيلا منفصلة',
                                  isSelected: _selectedType == 'فيلا منفصلة',
                                  onTap: () => setState(() => _selectedType = 'فيلا منفصلة'),
                                ),
                                _buildFilterChip(
                                  label: 'توين هاوس',
                                  isSelected: _selectedType == 'توين هاوس',
                                  onTap: () => setState(() => _selectedType = 'توين هاوس'),
                                ),
                                _buildFilterChip(
                                  label: 'تاون هاوس',
                                  isSelected: _selectedType == 'تاون هاوس',
                                  onTap: () => setState(() => _selectedType = 'تاون هاوس'),
                                ),
                              ],
                            ),
                          ),

                          _buildSectionTitle('عدد الغرف'),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildFilterChip(label: '4 غرف', isSelected: _selectedRooms == '4 غرف', onTap: () => setState(() => _selectedRooms = '4 غرف')),
                                _buildFilterChip(label: '5 غرف+', isSelected: _selectedRooms == '5 غرف+', onTap: () => setState(() => _selectedRooms = '5 غرف+')),
                                _buildFilterChip(label: 'الكل', isSelected: _selectedRooms == 'الكل', onTap: () => setState(() => _selectedRooms = 'الكل')),
                                _buildFilterChip(label: 'غرفتين', isSelected: _selectedRooms == 'غرفتين', onTap: () => setState(() => _selectedRooms = 'غرفتين')),
                                _buildFilterChip(label: '3 غرف', isSelected: _selectedRooms == '3 غرف', onTap: () => setState(() => _selectedRooms = '3 غرف')),
                              ].reversed.toList(),
                            ),
                          ),

                          _buildSectionTitle('السعر'), // Price

                          Row(
                            children: [
                              _buildFilterTextField(hintText: 'أقل سعر'), // Min Price
                              _buildFilterTextField(hintText: 'أقصى سعر'), // Max Price
                            ],
                          ),

                          _buildSectionTitle('طريقة الدفع'),
                          Row(
                            children: [
                              _buildFilterChip(label: 'أي', isSelected: _selectedPayment == 'أي', onTap: () => setState(() => _selectedPayment = 'أي')), // Any
                              _buildFilterChip(label: 'تقسيط', isSelected: _selectedPayment == 'تقسيط', onTap: () => setState(() => _selectedPayment = 'تقسيط')), // Installments
                              _buildFilterChip(label: 'كاش', isSelected: _selectedPayment == 'كاش', onTap: () => setState(() => _selectedPayment = 'كاش')), // Cash
                            ].reversed.toList(),
                          ),

                          _buildSectionTitle('حالة العقار'), // Property Status
                          Row(
                            children: [
                              _buildFilterChip(label: 'أي', isSelected: _selectedStatus == 'أي', onTap: () => setState(() => _selectedStatus = 'أي')), // Any
                              _buildFilterChip(label: 'جاهز', isSelected: _selectedStatus == 'جاهز', onTap: () => setState(() => _selectedStatus = 'جاهز')), // Ready
                              _buildFilterChip(label: 'قيد الإنشاء', isSelected: _selectedStatus == 'قيد الإنشاء', onTap: () => setState(() => _selectedStatus = 'قيد الإنشاء')), // Under Construction
                            ].reversed.toList(),
                          ),


                          const SizedBox(height: 100),

                         ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                  },
                  child: const Text(
                    'شاهد +10,000 نتائج',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

