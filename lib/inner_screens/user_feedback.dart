import 'package:admin_groceryapp/providers/dark_theme_provider.dart';
import 'package:admin_groceryapp/responsive.dart';
import 'package:admin_groceryapp/screens/main_screen.dart';
import 'package:admin_groceryapp/services/utils.dart';
import 'package:admin_groceryapp/widgets/grid_products.dart';
import 'package:admin_groceryapp/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import, implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({super.key});

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            theme ? const Color.fromARGB(62, 190, 143, 116) : Colors.blue,
        title: TextWidget(
          text: 'User Feedback',
          color: theme ? Colors.black : Colors.white,
          textSize: 20,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      // key: context.read().getgridscaffoldKey,

      body: Container(
        child: Card(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('feedback').snapshots(),
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(

                      //length
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(49, 34, 34, 34)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name: ${snapshot.data!.docs[index]['name']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // Text(

                                      //   snapshot.data!.docs[index]['timestamp'].toString(),
                                      //   style: const TextStyle(
                                      //     fontSize: 20,
                                      //     fontWeight: FontWeight.w500,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Gmail: ${snapshot.data!.docs[index]['email']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 0,
                                  color: Colors.black26,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Comment: ${snapshot.data!.docs[index]['comments']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
                } else {
                  return Container();
                }
              })),
        ),
      ),
    );
  }
}
