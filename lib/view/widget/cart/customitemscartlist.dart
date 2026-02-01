import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String itemsname;
  final double itemsprice;
  final int itemscount;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomItemsCartList({
    super.key,
    required this.itemsname,
    required this.itemsprice,
    required this.itemscount,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 85,
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12),
                    right: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.images}/$imagename",
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(itemsname, style: TextStyle(fontSize: 18)),
                  subtitle: Text(
                    "$itemsprice\$",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25,
                      child: IconButton(
                        onPressed: onAdd,
                        icon: Icon(Icons.add, size: 15),
                      ),
                    ),
                    Text(
                      itemscount.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                      child: IconButton(
                        onPressed: onRemove,
                        icon: Icon(Icons.remove, size: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
