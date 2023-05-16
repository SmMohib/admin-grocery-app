import 'package:admin_groceryapp/consts/constants.dart';
import 'package:admin_groceryapp/providers/dark_theme_provider.dart';
import 'package:admin_groceryapp/services/utils.dart';
import 'package:admin_groceryapp/widgets/orders_widget.dart';
import 'package:admin_groceryapp/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail(
      {super.key,
      this.model,
      this.price,
      this.totalPrice,
      this.productId,
      this.userId,
      this.imageUrl,
      this.userName,
      this.email,
      // required this.shipping_address,
     this.quantity,
     this.orderDate});
  final double? price, totalPrice;
  final String? productId, userId, imageUrl, userName, email;
  final int? quantity;
  final Timestamp? orderDate;
  final OrdersWidget? model;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Utils(context).color;
    return Scaffold(
        appBar: AppBar(
            backgroundColor:
                theme ? Color.fromARGB(240, 46, 44, 44) : Colors.blue,
            title: TextWidget(
              text: 'User Order Detail',
              color: theme ? Colors.black : Colors.white,
              textSize: 20,
            )),
        body: ListView(
          children: [
            const SizedBox(
              width: 19,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text:'userName!' ,
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text:' email!.toString()',
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: 'User Phone :',
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: 'User Address :',
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: 'Order Item :',
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: 'Total Amount :',
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: 'Product Item :',
                color: theme ? Colors.white : Colors.black,
                textSize: 20,
              ),
            ),
          ],
        ));
  }
}
