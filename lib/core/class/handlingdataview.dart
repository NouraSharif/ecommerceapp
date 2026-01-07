import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
          child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250),
        )
        : statusRequest == StatusRequest.offlinefailure
        ? Center(
          child: Lottie.asset(
            AppImageAsset.noInternet,
            width: 250,
            height: 250,
          ),
        )
        : statusRequest == StatusRequest.serverfailure
        ? Center(
          child: Lottie.asset(AppImageAsset.error404, width: 250, height: 250),
        )
        : statusRequest == StatusRequest.failure
        ? Center(
          child: Lottie.asset(AppImageAsset.emptyBox, width: 250, height: 250),
        )
        : widget;
  }
}

//في حالات الناتج عبارة عن نجاح او فشل من الباك اند
//ما بكون داتا
//بصفحات الauthكلها بحالة الريكويست مش رح نعرض داتا

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
          child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250),
        )
        : statusRequest == StatusRequest.offlinefailure
        ? Center(
          child: Lottie.asset(
            AppImageAsset.noInternet,
            width: 250,
            height: 250,
          ),
        )
        : statusRequest == StatusRequest.serverfailure
        ? Center(
          child: Lottie.asset(AppImageAsset.error404, width: 250, height: 250),
        )
        : widget;
  }
}
