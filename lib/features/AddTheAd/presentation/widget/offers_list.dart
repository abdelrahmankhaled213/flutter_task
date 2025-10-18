import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'offers_item.dart';

class OffersList extends StatefulWidget {
  const OffersList({super.key});

  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {

  final List<String> items = [

    'الكل',

    'ملابس',

    'اكسسوارات',

    'الكترونيات',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {

            return GestureDetector(

              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },

              child: OfferContainerItem(

                  isSelected: currentIndex == index,
                  text: items[index]
              ),
            );
          }, separatorBuilder: (context, index)
      => SizedBox(width: 12.h), itemCount: items.length),
    );
  }
}
