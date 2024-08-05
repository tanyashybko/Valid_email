import 'package:flutter/material.dart';

class SliverWidget extends StatefulWidget {
  final List<Group> items;

  const SliverWidget({super.key, required this.items});

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (var group in widget.items)
          SliverMainAxisGroup(slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderDelegate(group.header),
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
          ]),
      ],
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  const HeaderDelegate(this.title);
  final String title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50,
      color: Colors.grey[300],
      child: Center(child: Text(title)),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
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
