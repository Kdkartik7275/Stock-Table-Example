import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

GridColumn tableColumn(String columnName, String value,
    {Color? color,
    bool showBorder = true,
    Color borderColor = Colors.grey,
    double width = double.nan}) {
  return GridColumn(
      columnName: columnName,
      label: Container(
          decoration: BoxDecoration(
              color: color,
              border: showBorder
                  ? Border(right: BorderSide(color: borderColor))
                  : null),
          alignment: Alignment.center,
          child: Text(value)),
      width: width);
}
