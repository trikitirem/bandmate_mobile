import 'package:flutter/material.dart';

import 'interests_row_item.dart';

class InterestsRow extends StatelessWidget {
  const InterestsRow({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        for (var item in items)
          InterestsRowItem(
            item: item,
          )
      ],
    );
  }
}
