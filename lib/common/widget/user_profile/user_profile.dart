
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../image/circular_image.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(image: TImages.user,width: 50,height: 50,padding: 0,),
      title: Text("Tanbir",style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text("Tanbir@gmail.com",style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: (){},icon: const Icon(Iconsax.edit,color: TColors.white,),),
    );
  }
}
