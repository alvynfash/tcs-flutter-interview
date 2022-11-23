import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class StationDetailsView extends StatelessWidget {
  const StationDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lorem Ipsum'),
      ),
      body: const Center(
        child: Text('Station details here'),
      ),
    );
  }
}
