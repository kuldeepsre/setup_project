import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/CheckboxProvider.dart';

class CheckboxListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox List'),
      ),
      body: Consumer<CheckboxProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              final item = provider.items[index];
              return CheckboxListTile(
                title: Text(item.label),
                value: item.isChecked,
                onChanged: (_) => provider.toggleCheckbox(index),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.select_all),
              onPressed: () {
                final provider = Provider.of<CheckboxProvider>(context, listen: false);
                provider.toggleAll(true); // or false to uncheck all
              },
            ),
            FloatingActionButton(
              child: const Icon(Icons.select_all),
              onPressed: () {
                final provider = Provider.of<CheckboxProvider>(context, listen: false);
                provider.toggleUnselectAll(false); // or false to uncheck all
              },
            ),
          ],
        ),
      ),
    );
  }
}
