import 'package:flutter/material.dart';
import 'package:mobile/core/components/input/multi_select/multi_select_item.dart';

class MultiSelect extends StatelessWidget {
  const MultiSelect({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onClick,
  });

  final List<String> items;
  final List<String> selectedItems;
  final void Function(List<String> selected) onClick;

  List<String> handleSelecting(String item) {
    if (!selectedItems.contains(item)) {
      return [...selectedItems, item];
    }

    var list = selectedItems;
    list.remove(item);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      children: List.generate(
        items.length,
        (index) => MultiSelectItem(
          selected: selectedItems.contains(items[index]),
          label: items[index],
          onClick: () => onClick(handleSelecting(items[index])),
        ),
      ),
    );
  }
}
