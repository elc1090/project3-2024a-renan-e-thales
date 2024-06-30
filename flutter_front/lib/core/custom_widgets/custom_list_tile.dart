import 'package:flutter/material.dart';
import 'package:flutter_front/core/custom_widgets/custom_item_modal/custom_item_modal.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_front/models/item.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import '../globals.dart' as globals;

class CustomListTile extends StatefulWidget {
  CustomListTile(this.item, {this.tileColor, super.key});

  Item item;
  Color? tileColor;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  HomeController controller = globals.homeController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        widget.item.nome,
        size: 16,
        color: Colors.black,
      ),
      dense: true,
      trailing: CustomText(
        widget.item.qtd != null ? widget.item.qtd.toString() : "0",
        color: Colors.black,
      ),
      tileColor: widget.tileColor ?? Colors.white,
      onTap: () => _openItemModal(context, widget.item),
    );
  }

  _openItemModal(BuildContext context, Item item) {
    showDialog(context: context, builder: (context) => CustomItemModal(item));
  }
}
