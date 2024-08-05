import 'package:flutter/material.dart';
import 'package:valid_email/widgets/sliver/sliver_widget.dart';

class SliverLayout extends StatelessWidget {
  final List<Item> items = [
    Item(header: 'Music', name: 'Imagine Dragons'),
    Item(header: 'Music', name: 'Avicii'),
    Item(header: 'Music', name: 'Maya'),
    Item(header: 'Places', name: 'Agra'),
    Item(header: 'Places', name: 'Jamshedpur'),
    Item(header: 'Places', name: 'Delhi'),
    Item(header: 'Places', name: 'Bangalore'),
    Item(header: 'Things', name: 'Car'),
  ];

  SliverLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final groupedItems = _groupItemsByHeader(items);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky Headers'),
      ),
      body: SliverWidget(items: groupedItems),
    );
  }

  List<Group> _groupItemsByHeader(List<Item> items) {
    Map<String, List<Item>> groupedItems = {};
    for (var item in items) {
      groupedItems.putIfAbsent(item.header, () => []).add(item);
    }
    return groupedItems.entries
        .map((entry) => Group(header: entry.key, items: entry.value))
        .toList();
  }
}
