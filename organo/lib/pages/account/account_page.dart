import 'package:flutter/material.dart';
import 'package:organo/controllers/auth_controller.dart';
import 'package:organo/routes/route_helper.dart';
import 'package:organo/utlis/colors.dart';
import 'package:organo/utlis/dimensions.dart';
import 'package:organo/widgets/app_icon.dart';
import 'package:organo/widgets/big_text.dart';
import 'package:get/get.dart';
import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Center(
            child: BigText(
              text: ("Profile"),
              size: 24,
              color: Colors.white,
            ),
          )),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(height: Dimensions.height30),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Aasu"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "123456"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "aasu@gmail.com"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Fill your address"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Messages"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //logout
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.offNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "LogOut"),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
