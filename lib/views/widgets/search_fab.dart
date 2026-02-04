import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'search_dialog.dart';

/// Floating action button for search functionality
class SearchFab extends StatelessWidget {
  final bool isLoading;
  final Function(String) onSearch;

  const SearchFab({
    super.key,
    required this.isLoading,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox.shrink();
    }

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
      ),
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SearchDialog(onSearch: onSearch),
          );
        },
        backgroundColor: const Color(0xff7d49ca).withOpacity(0.4),
        child: Icon(
          MdiIcons.mapSearch,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
