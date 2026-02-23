import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.goToItems(
                controller.categories,
                i,
                controller.categories[i]['categories_id'].toString(),
              );
            },
            child: Categories(
              categoriesmodel: CategoriesModel.fromJson(
                controller.categories[i],
              ),
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

class Categories extends StatelessWidget {
  final CategoriesModel categoriesmodel;
  const Categories({super.key, required this.categoriesmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(right: 3),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.images}/${categoriesmodel.categoriesImage}",
              height: 70,
              width: 125,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(Icons.error),
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              // يحفظ الصور مؤقتاً في memory cache
              // لا يعيد تحميل الصور عند التمرير
            ),
          ),
          Text(
            "${translateDatabase(categoriesmodel.categoriesNameAr!, categoriesmodel.categoriesName!)}",
            style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
