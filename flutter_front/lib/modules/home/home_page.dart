import 'package:flutter/material.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:flutter_front/modules/item_list_page/item_list_page.dart';
import 'package:flutter_front/modules/new_item/new_item_page.dart';
import '../../core/globals.dart' as globals;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  DateFormat format = DateFormat("dd-MM-yyyy");
  HomeController controller = globals.homeController;

  bool _isSearchOpen = false;

  @override
  void initState() {
    controller.tabsController = TabController(length: 2, vsync: this);
    controller.itemList = globals.items;
    controller.categorias = globals.categorias;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            padding: const EdgeInsets.only(right: 32.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isSearchOpen ? 200 : 32,
              child: _isSearchOpen
                  ? TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: IconButton(
                          onPressed: () => setState(() => _isSearchOpen = !_isSearchOpen),
                          icon: const Icon(CarbonIcons.search),
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () => setState(() => _isSearchOpen = !_isSearchOpen),
                      icon: const Icon(CarbonIcons.search),
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
