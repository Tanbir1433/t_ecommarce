
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/feature/personalization/controllers/user/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../image/circular_image.dart';

class UserProfile extends StatelessWidget {
  final VoidCallback onTap;
  const UserProfile({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const CircularImage(image: TImages.user,width: 50,height: 50,padding: 0,borderRadius: 50,),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: (){},icon: const Icon(Iconsax.edit,color: TColors.white,),),
      onTap: onTap,
    );
  }
}
