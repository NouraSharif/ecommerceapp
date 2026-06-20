import 'package:ecommerceapp/controller/orders/pending_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersPendingController controller = Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: GetBuilder<OrdersPendingController>(
          builder:
              (context) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.ordersPendingList.length,
                  itemBuilder: (context, i) {
                    return CardOrdersList(
                      listdata: controller.ordersPendingList[i],
                    );
                  },
                ),
              ),
        ),
      ),
    );
  }
}

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        height: 240,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Number :#${listdata.ordersId} ",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 130, 129, 129),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Order Type : ${controller.printOrderType(listdata.ordersType!)} ",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Order Price : ${listdata.ordersPrice} \$",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Delivery Price : ${listdata.ordersPricedelivery} \$",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} ",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} ",
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listdata.ordersTotalprice} \$",
                  style: TextStyle(
                    color: AppColor.primarycolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                MaterialButton(
                  color: AppColor.primarycolor,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
