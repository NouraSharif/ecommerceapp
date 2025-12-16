import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/data/model/onboardingmodel.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

List<OnBoardingModel> onboardingList = [
  OnBoardingModel(
    title: "1".tr,
    image: AppImageAsset.onBoardingImageOne,
    body: "3".tr,
  ),
  OnBoardingModel(
    title: "4".tr,
    image: AppImageAsset.onBoardingImageTwo,
    body:
        "Easy Checkout & Safe Payment\n method. Trusted by our Customers \n from all over the world.",
  ),
  OnBoardingModel(
    title: "Track Your Order",
    image: AppImageAsset.onBoardingImageThree,
    body:
        "Best Tracker has been Used For\n Track your order.You`ll know where\n your product is at the moment.",
  ),
  OnBoardingModel(
    title: "Fast Delivery",
    image: AppImageAsset.onBoardingImageFour,
    body:
        "Reliable And Fast Delivery. We\n Devliver your product the fastest\n way possible.",
  ),
];
