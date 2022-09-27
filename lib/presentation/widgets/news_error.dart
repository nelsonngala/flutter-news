import 'package:flutter/cupertino.dart';

class NewsError extends StatelessWidget {
  final String error;
  const NewsError({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
