import 'package:flutter/material.dart';

class LoadingNews extends StatelessWidget {
  const LoadingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
