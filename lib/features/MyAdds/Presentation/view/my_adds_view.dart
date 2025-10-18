import 'package:flutter/material.dart';

class MyAddsView extends StatelessWidget {

  const MyAddsView({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(

      slivers: [
        SliverToBoxAdapter(
          child: Center(

          ),
        )
      ],
    ) ;



  }
}
