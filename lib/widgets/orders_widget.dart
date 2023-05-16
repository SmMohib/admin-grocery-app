
import 'package:admin_groceryapp/widgets/mapLocation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:admin_groceryapp/services/utils.dart';
//import 'package:uuid/uuid.dart';

import 'text_widget.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget(
      {Key? key,
      this.model,
      required this.price,
      required this.totalPrice,
      required this.productId,
      required this.userId,
      required this.imageUrl,
      required this.userName,
      required this.email,
      // required this.shipping_address,
      required this.quantity,
      required this.orderDate})
      : super(key: key);
  final double price, totalPrice;
  final String productId, userId, imageUrl, userName, email;
  final int quantity;
  final Timestamp orderDate;
  final OrdersWidget? model;
  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  late String orderDateStr;
  String _catValue = 'Panding';
  late final TextEditingController _titleController, _priceController;
  int _groupValue = 1;
  
  get index => null;
  @override
  void initState() {
    var postDate = widget.orderDate.toDate();
    orderDateStr = '${postDate.day}/${postDate.month}/${postDate.year}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = theme == true ? Colors.white : Colors.black;
    Size size = Utils(context).getScreenSize;
//order detail
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => OrderTrackingPage()
        //     ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).cardColor.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: size.width < 650 ? 3 : 1,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        text:
                            '${widget.quantity}X For \৳${widget.price.toStringAsFixed(2)}',
                        color: color,
                        textSize: 16,
                        isTitle: true,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            TextWidget(
                              text: 'By',
                              color: Colors.blue,
                              textSize: 16,
                              isTitle: true,
                            ),
                            Text('  ${widget.userName}'),
                          ],
                        ),
                      ),
                      Text('  ${widget.email}'),
                      Text(
                        orderDateStr,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextWidget(
                      text: 'Stutus*',
                      color: color,
                      isTitle: true,
                    ),
                    const SizedBox(height: 10),
                    // Drop down menu code here
                    _categoryDropDown(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryDropDown() {
    final color = Utils(context).color;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          value: _catValue,
          onChanged: (value) {
            setState(() {
              _catValue = value!;
            });
            print(_catValue);
          },
          hint: const Text('Select stutus'),
          items: const [
            DropdownMenuItem(
              value: 'Processing',
              child: Text(
                'Processing',
              ),
            ),
            DropdownMenuItem(
              value: 'Panding',
              child: Text(
                'Panding',
              ),
            ),
            DropdownMenuItem(
              value: 'Complete',
              child: Text(
                'Complete',
              ),
            ),
          ],
        )),
      ),
    );
  }
}
