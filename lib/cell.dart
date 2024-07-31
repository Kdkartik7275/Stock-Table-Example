import 'package:flutter/material.dart';

Widget buildCell(String value) {
  return Container(
    width: 70,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: const Border(
            left: BorderSide(color: Colors.grey),
            bottom: BorderSide(color: Colors.grey))),
    child: Text(
      value,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  );
}
