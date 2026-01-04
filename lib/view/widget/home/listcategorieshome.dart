import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
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
            onTap: () {},
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
            child: Image.network(
              "${AppLink.images}/${categoriesmodel.categoriesImage}",
              height: 70,
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "${categoriesmodel.categoriesName}",
            style: TextStyle(color: AppColor.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
