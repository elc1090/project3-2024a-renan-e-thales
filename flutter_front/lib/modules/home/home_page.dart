import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_front/modules/home/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  HomeController controller = HomeController();
  TextEditingController _nomeTextController = TextEditingController();
  TextEditingController _descTextController = TextEditingController();
  TextEditingController _qtdTextController = TextEditingController(text: "0");
  late TabController _tabsController;

  bool _isSearchOpen = false;

  @override
  void initState() {
    _tabsController = TabController(length: 2, vsync: this);
    controller.itemList = globals.items;
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
        title: const Text("Itens"),
        bottom: TabBar(controller: _tabsController, tabs: const [Text("Itens"), Text("Novo Item")]),
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
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () => setState(() => _isSearchOpen = !_isSearchOpen),
                      icon: const Icon(Icons.search),
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: TabBarView(
        controller: _tabsController,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item"),
                        Text("Qtd"),
                      ],
                    ),
                  ),
                  controller.itemList == null
                      ? const Center(
                          child: Text("Vazio"),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            clipBehavior: Clip.hardEdge,
                            itemCount: controller.itemList!.length,
                            itemBuilder: (context, index) => ListTile(
                              minTileHeight: 70,
                              tileColor: Theme.of(context).colorScheme.tertiary,
                              onTap: () {},
                              title: Text(
                                controller.itemList![index].nome,
                                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onTertiary),
                              ),
                              trailing: Text(
                                "${controller.itemList![index].qtd ?? 0}",
                                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onTertiary),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Adicionar Novo Item"),
                TextFormField(
                  controller: _nomeTextController,
                  decoration: InputDecoration(
                    labelText: "nome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descTextController,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "descrição",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => setState(
                              () {
                                if (int.parse(_qtdTextController.text) - 10 > 0) {
                                  _qtdTextController.text = "${int.parse(_qtdTextController.text) - 10}";
                                } else {
                                  _qtdTextController.text = "0";
                                }
                              },
                            ),
                        child: const Text("-10")),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        controller: _qtdTextController,
                        decoration: InputDecoration(
                          labelText: "quantidade inicial",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => setState(
                              () => _qtdTextController.text = "${int.parse(_qtdTextController.text) + 10}",
                            ),
                        child: const Text("+10")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
