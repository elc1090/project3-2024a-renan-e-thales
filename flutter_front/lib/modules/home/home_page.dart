import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/widgets/custom_text.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:flutter_front/modules/item_list_page/item_list_page.dart';
import 'package:flutter_front/modules/new_item/new_item_page.dart';
import '../../core/globals.dart' as globals;
import '../login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  HomeController controller = globals.homeController;

  @override
  void initState() {
    controller.tabsController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CarbonIcons.box,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            CustomText('Estoque', color: Colors.white),
          ],
        ),
        titleSpacing: 0,
        backgroundColor: const Color.fromARGB(255, 39, 155, 209),
        bottom: TabBar(controller: controller.tabsController, indicatorColor: Colors.white, tabs: [
          CustomText(
            "Listagem",
            color: Theme.of(context).colorScheme.onPrimary,
            size: 16,
          ),
          CustomText(
            "Novo Item",
            color: Theme.of(context).colorScheme.onPrimary,
            size: 16,
          )
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                MenuAnchor(
                    builder: (BuildContext context, MenuController controller, Widget? child) {
                      return TextButton(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          child: CustomText(
                            globals.user?.nome ?? 'null',
                            size: 16,
                            color: Colors.white,
                          ));
                    },
                    menuChildren: [
                      MenuItemButton(
                        style: MenuItemButton.styleFrom(backgroundColor: Colors.red[700]),
                        child: CustomText(
                          "Sair",
                          size: 12,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          controller.logout();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller.tabsController,
        children: const [
          ItemListPage(),
          NewItemPage(),
        ],
      ),
    );
  }
}
