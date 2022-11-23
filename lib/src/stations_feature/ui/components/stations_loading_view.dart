import 'package:flutter/material.dart';

class StationLoadingView extends StatelessWidget {
  const StationLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Finding stations...'),
          ),
        ],
      ),
    );
  }
}
