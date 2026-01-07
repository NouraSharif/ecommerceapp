import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // تقليل الارتفاع
      margin: const EdgeInsets.only(bottom: 8), // مسافة صغيرة فقط تحت القائمة
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 35); // استخدام SizedBox بدل Padding
        },
        padding: const EdgeInsets.symmetric(horizontal: 8), // padding جانبي
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.changeCat(
                i,
                controller.categories[i]['categories_id'].toString(),
              );
            },
            child: Categories(
              categoriesmodel: CategoriesModel.fromJson(
                controller.categories[i],
              ),
              numcat: i,
            ),
          );
        },
      ),
    );
  }
}
/*
تنظيم العمل
"${AppLink.images}/${controller.categories[i]['categories_image']}",
"${controller.categories[i]['categories_name']}"
بدل الصورة هاي

2-//fromJson
والداتا بنجيبها من الكونترولر وبنحولها ل
object dart
1-
صار الاسم بنجيبه مباشرة من كلاس المودل

*/

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesmodel;
  final int numcat;

  const Categories({
    super.key,
    required this.categoriesmodel,
    required this.numcat,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return IntrinsicWidth(
          child: Align(
            alignment:
                Alignment.bottomCenter, // يحصر العنصر فقط عند النص والبوردر
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min, // يحصر فقط المحتوى
                children: [
                  Text(
                    translateDatabase(
                          categoriesmodel.categoriesNameAr!,
                          categoriesmodel.categoriesName!,
                        ) ??
                        "",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color:
                          controller.selectedCat == numcat
                              ? AppColor.primarycolor
                              : AppColor.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 4,
                    width: 60,
                    decoration:
                        controller.selectedCat == numcat
                            ? BoxDecoration(
                              color: AppColor.primarycolor,
                              borderRadius: BorderRadius.circular(10),
                            )
                            : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
