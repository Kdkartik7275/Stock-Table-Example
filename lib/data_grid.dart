import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SFTable<T> extends StatelessWidget {
  const SFTable({
    super.key,
    required DataGridSource dataSource,
    DataGridController? controller,
    ScrollController? horizontalScrollController,
    ScrollController? verticalScrollController,
    required List<GridColumn> columns,
  })  : _dataSource = dataSource,
        _columns = columns,
        _controller = controller,
        _horizontalScrollController = horizontalScrollController,
        _verticalScrollController = verticalScrollController;

  final DataGridSource _dataSource;
  final List<GridColumn> _columns;
  final DataGridController? _controller;
  final ScrollController? _horizontalScrollController;
  final ScrollController? _verticalScrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 400,
        child: SfDataGrid(
          controller: _controller,
          source: _dataSource,
          columns: _columns,
          horizontalScrollController: _horizontalScrollController,
          verticalScrollController: _verticalScrollController,
        ),
      ),
    );
  }
}
