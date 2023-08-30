// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FilterSelectionPage extends StatefulWidget {
  @override
  _FilterSelectionPageState createState() => _FilterSelectionPageState();
}

class _FilterSelectionPageState extends State<FilterSelectionPage> {
  String selectedFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Filter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildFilterOption('Farmer'),
            _buildFilterOption('Supplier'),
            _buildFilterOption('Sources'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedFilter.isNotEmpty) {
                  // Perform action based on the selected filter
                  // For example, you can navigate to a new page or update state.
                  // Apa we'll print the selected filter.
                  print('Selected Filter: $selectedFilter');
                } else {
                  // Show a message if no filter is selected.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a filter.')),
                  );
                }
              },
              child: Text('Apply Filter'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String filterName) {
    return RadioListTile(
      title: Text(filterName),
      value: filterName,
      groupValue: selectedFilter,
      onChanged: (value) {
        setState(() {
          selectedFilter = value.toString();
        });
      },
    );
  }
}
