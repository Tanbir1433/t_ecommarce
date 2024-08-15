import 'package:get/get.dart';
import 'package:t_store/feature/authentication/screens/login/login_screen.dart';
import 'package:t_store/feature/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:t_store/feature/authentication/screens/password_configuration/forget_password_screen.dart';
import 'package:t_store/feature/authentication/screens/singup/singup_screen.dart';
import 'package:t_store/feature/authentication/screens/singup/verify_screen/verify_email_screen.dart';
import 'package:t_store/feature/personalization/screens/address/address_screen.dart';
import 'package:t_store/feature/personalization/screens/profile/profile_screen.dart';
import 'package:t_store/feature/personalization/screens/settings/settings_screen.dart';
import 'package:t_store/feature/shop/screens/cart/cart_screen.dart';
import 'package:t_store/feature/shop/screens/checkout/checkout_screen.dart';
import 'package:t_store/feature/shop/screens/home/home_screen.dart';
import 'package:t_store/feature/shop/screens/order/order_screen.dart';
import 'package:t_store/feature/shop/screens/product_review/product_review_screen.dart';
import 'package:t_store/feature/shop/screens/wishlist/wishlist_screen.dart';
import 'package:t_store/routes/routes.dart';

import '../feature/shop/screens/store/store_screen.dart';

class AppRoute{
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.favourites, page: () => const WishlistScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
    GetPage(name: Routes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkOut, page: () => const CheckoutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: Routes.userAddress, page: () => const AddressScreen()),
    GetPage(name: Routes.singUp, page: () => const SingUpScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: Routes.onBoarding, page: () => const OnboardingScreen()),
  ];
}