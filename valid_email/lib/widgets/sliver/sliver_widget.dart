import 'package:flutter/material.dart';

class SliverWidget extends StatefulWidget {
  final List<Item> items;

  const SliverWidget({super.key, required this.items});

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (var group in _groupItemsByHeader(widget.items))
          ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 50.0,
                maxHeight: 50.0,
                child: Container(
                  color: Colors.grey[300],
                  child: Center(child: Text(group.header)),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = group.items[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: item.checked
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      setState(() {
                        item.checked = !item.checked;
                      });
                    },
                  );
                },
                childCount: group.items.length,
              ),
            ),
          ],
      ],
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class Item {
  Item({required this.header, required this.name, this.checked = false});

  final String header;
  final String name;
  bool checked;
}

class Group {
  Group({required this.header, required this.items});

  final String header;
  final List<Item> items;
}