import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/home/customcurdhome.dart';
import 'package:ecommerceapp/view/widget/home/customtitlehome.dart';
import 'package:ecommerceapp/view/widget/home/listcategorieshome.dart';
import 'package:ecommerceapp/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder:
            (controller) => Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListView(
                children: [
                  CustomAppBar(
                    titleappBar: "Find Product",
                    myController: controller.search,
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onPressedfavorite: () {
                      Get.toNamed(AppRoute.myfavorite);
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  SizedBox(height: 15),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:
                        !controller.isSearch
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCurdHome(
                                  title: "A Summer Surprise",
                                  body: "Cashback 20%",
                                ),
                                SizedBox(height: 5),
                                CustomTitleHome(title: "Categories"),
                                ListCategoriesHome(),
                                CustomTitleHome(title: "Product For You"),
                                //ListItemsHome(),
                                SizedBox(
                                  height: 200,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                      3,
                                      (index) => Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.asset(
                                            "assets/images/p${index + 1}.jpg",
                                            width: 300,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //----------
                                CustomTitleHome(title: "offer"),
                                ListItemsHome(),
                              ],
                            )
                            : ListSearchItems(
                              listSearchItems:
                                  controller.searchItems
                                      .map((e) => ItemsModel.fromJson(e))
                                      .toList(),
                            ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class ListSearchItems extends GetView<HomeControllerImp> {
  final List<ItemsModel> listSearchItems;
  const ListSearchItems({super.key, required this.listSearchItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listSearchItems.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listSearchItems[i]);
          },
          child: SizedBox(
            height: 100,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox.expand(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            '${AppLink.images}/${listSearchItems[i].itemsImage}',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        '${listSearchItems[i].itemsName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text("${listSearchItems[i].categoriesName}"),
                    ),
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
