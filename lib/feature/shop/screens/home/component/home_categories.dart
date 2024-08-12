import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/feature/shop/screens/sub_categories/sub_categories_screen.dart';
import '../../../../../common/widget/text/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return VerticalImageText(
            image: TImages.shoeIcon,
            title: 'Shoes',
            onTap: () {
              Get.to(() => const SubCategoriesScreen());
            },
          );
        },
      ),
    );
  }
}
