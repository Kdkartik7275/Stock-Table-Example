import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Calls',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        Text('Puts',
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
