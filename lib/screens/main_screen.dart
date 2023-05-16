import 'package:flutter/material.dart';
import 'package:admin_groceryapp/controllers/MenuController.dart';
import 'package:admin_groceryapp/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../providers/dark_theme_provider.dart';
import '../responsive.dart';
import '../services/utils.dart';
import '../widgets/text_widget.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            theme ? Color.fromARGB(62, 190, 143, 116) : Colors.blue,
        title: TextWidget(
          text: 'Admin App',
          color: theme ? Colors.white : Colors.white,
          textSize: 20,
        ),
      ),
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: DashboardScreen()
                // child: DashboardScreen(),
                ),
          ],
        ),
      ),
    );
  }
}
