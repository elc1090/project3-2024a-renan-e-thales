import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/widgets/custom_icon_button.dart';
import 'package:flutter_front/core/widgets/custom_item_modal/custom_item_modal.dart';
import 'package:flutter_front/core/widgets/custom_text.dart';
import 'package:flutter_front/models/item.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile(this.item, {this.tileColor, super.key});

  Item item;
  Color? tileColor;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool _tileOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          height: _tileOpen ? 125 : 50,
          padding: EdgeInsets.symmetric(
            vertical: _tileOpen ? 16 : 8,
            horizontal: MediaQuery.of(context).size.width > 400 ? 24 : 8,
          ),
          decoration: BoxDecoration(color: widget.tileColor ?? Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    widget.item.nome,
                    size: 16,
                    color: Colors.black,
                  ),
                  CustomText(
                    widget.item.qtd != null ? widget.item.qtd.toString() : "0",
                    color: Colors.black,
                  ),
                ],
              ),
              if (_tileOpen)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          widget.item.description ?? '',
                          size: 16,
                          color: Colors.grey[900],
                        ),
                        Row(
                          children: [
                            CustomText(
                              'Perecível: ',
                              size: 16,
                              color: Colors.grey[900],
                            ),
                            CustomText(
                              widget.item.perecivel ? 'sim' : 'não',
                              size: 16,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomIconButton(
                      const Icon(CarbonIcons.open_panel_bottom),
                      color: Colors.black.withOpacity(0.5),
                      filled: true,
                      onPressed: () => _openItemModal(context, widget.item),
                    )
                  ],
                ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _tileOpen = !_tileOpen;
          });
        },
        onDoubleTap: () => _openItemModal(context, widget.item),
      ),
    );
  }

  _openItemModal(BuildContext context, Item item) {
    showDialog(context: context, builder: (context) => CustomItemModal(item)).then((v) => setState(() {}));
  }
}
