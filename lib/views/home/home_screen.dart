import 'package:e_learning_application/views/home/widgets/category_section.dart';
import 'package:e_learning_application/views/home/widgets/home_app_bar.dart';
import 'package:e_learning_application/views/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SearchBarWidget(),
              SizedBox(height: 32),
              CategorySection(),
            ]),
          ),
        ),
      ],
    );
  }
}
