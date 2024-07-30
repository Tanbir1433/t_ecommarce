import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import '../../../../common/widget/appbar/custom_appbar.dart';
import '../../../../common/widget/cart/cart_counter.dart';
import '../../../../common/widget/home_header.dart';
import 'component/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeader(
              child: Column(
                children: [
                  /// Home AppBar
                  HomeAppBar()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
