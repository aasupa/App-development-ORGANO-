import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organo/controllers/order_controller.dart';

import '../../models/order_model.dart';
import '../../utlis/colors.dart';
import '../../utlis/dimensions.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;

  const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<OrderController>(
      builder: (orderController) {
        if (!orderController.isLoading) {
          final currentOrderList = orderController.currentOrderList;
          final historyOrderList = orderController.historyOrderList;
          final orderList = isCurrent ? currentOrderList : historyOrderList;

          return orderList.isNotEmpty
              ? _buildOrderList(orderList)
              : _buildNoOrdersWidget();
        } else {
          return _buildLoadingWidget();
        }
      },
    ));
  }

  Widget _buildOrderList(List<OrderModel> orderList) {
    return SizedBox(
      width: Dimensions.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 / 2),
        child: ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => null,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "#order id      " + orderList[index].id.toString()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 / 4),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(Dimensions.height10 / 2),
                                child: Text(
                                  '${orderList[index].orderStatus}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10 / 2,
                            ),
                            // InkWell(
                            //   onTap: ()=> null,
                            //   child: Text("track_order"),
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNoOrdersWidget() {
    return Center(
      child: Text("No orders available."),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
