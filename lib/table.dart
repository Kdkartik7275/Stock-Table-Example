import 'package:data_table/data.dart';
import 'package:data_table/data_grid.dart';
import 'package:data_table/header.dart';
import 'package:data_table/middle_data_souce.dart';
import 'package:data_table/stock_data_source.dart';
import 'package:data_table/stock_model.dart';
import 'package:data_table/table_column.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late List<StockDataModel> leftStocks;
  late List<MiddleDataModel> middleStocks;
  late List<StockDataModel> rightStocks;

  late LeftStockDataSource _leftDataSource;
  late MiddleDataSouce _middleDataSource;
  late RightStockDataSource _rightDataSource;

  late DataGridController _leftGridController;
  late DataGridController _rightGridController;

  late ScrollController _leftHorizontalScrollController;
  late ScrollController _rightHorizontalScrollController;
  late ScrollController _leftVerticalScrollController;
  late ScrollController _rightVerticalScrollController;

  bool _isLeftHorizontalScrolling = false;
  bool _isRightHorizontalScrolling = false;
  bool _isVerticalScrolling = false;

  @override
  void initState() {
    super.initState();

    leftStocks = leftStockDataSource();
    middleStocks = middleStockDataSource();
    rightStocks = rightStockDataSource();

    _leftDataSource = LeftStockDataSource(leftStocks);
    _middleDataSource = MiddleDataSouce(middleStocks);
    _rightDataSource = RightStockDataSource(rightStocks);

    _leftGridController = DataGridController();
    _rightGridController = DataGridController();

    _leftHorizontalScrollController = ScrollController();
    _rightHorizontalScrollController = ScrollController();
    _leftVerticalScrollController = ScrollController();
    _rightVerticalScrollController = ScrollController();

    // Intial Scroll Position of Left & Right Table
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _leftGridController.scrollToColumn(0, canAnimate: false);

      _rightGridController.scrollToColumn(
          _rightDataSource.rows.first.getCells().length - 1,
          canAnimate: false);
    });

    // Add Scroll Listeners
    _leftHorizontalScrollController.addListener(_leftHorizontalScrollListener);
    _rightHorizontalScrollController
        .addListener(_rightHorizontalScrollListener);
    _leftVerticalScrollController.addListener(_verticalScrollListener);
    _rightVerticalScrollController.addListener(_verticalScrollListener);
  }

  @override
  void dispose() {
    _leftHorizontalScrollController
        .removeListener(_leftHorizontalScrollListener);
    _rightHorizontalScrollController
        .removeListener(_rightHorizontalScrollListener);
    _leftVerticalScrollController.removeListener(_verticalScrollListener);
    _rightVerticalScrollController.removeListener(_verticalScrollListener);
    _leftHorizontalScrollController.dispose();
    _rightHorizontalScrollController.dispose();
    _leftVerticalScrollController.dispose();
    _rightVerticalScrollController.dispose();
    super.dispose();
  }

  void _leftHorizontalScrollListener() {
    if (_isRightHorizontalScrolling) return;
    _isLeftHorizontalScrolling = true;
    final leftScrollOffset = _leftHorizontalScrollController.offset;
    final rightScrollOffset =
        _rightHorizontalScrollController.position.maxScrollExtent -
            leftScrollOffset;
    _rightHorizontalScrollController.jumpTo(rightScrollOffset);
    _isLeftHorizontalScrolling = false;
  }

  void _rightHorizontalScrollListener() {
    if (_isLeftHorizontalScrolling) return;
    _isRightHorizontalScrolling = true;
    final rightScrollOffset = _rightHorizontalScrollController.offset;
    final leftScrollOffset =
        _rightHorizontalScrollController.position.maxScrollExtent -
            rightScrollOffset;
    _leftHorizontalScrollController.jumpTo(leftScrollOffset);
    _isRightHorizontalScrolling = false;
  }

  void _verticalScrollListener() {
    if (_isVerticalScrolling) return;
    _isVerticalScrolling = true;
    final offset = (_leftVerticalScrollController.hasClients)
        ? _leftVerticalScrollController.offset
        : _rightVerticalScrollController.offset;
    if (_leftVerticalScrollController.hasClients) {
      _rightVerticalScrollController.jumpTo(offset);
    } else {
      _leftVerticalScrollController.jumpTo(offset);
    }
    _isVerticalScrolling = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Table Example'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TABLE HEADER
              const TableHeader(),
              SizedBox(
                height: 400,
                child: Row(
                  children: [
                    // LEFT TABLE
                    SFTable<StockDataModel>(
                      controller: _leftGridController,
                      horizontalScrollController:
                          _leftHorizontalScrollController,
                      verticalScrollController: _leftVerticalScrollController,
                      dataSource: _leftDataSource,
                      columns: [
                        tableColumn('volume', 'Volume', width: 70),
                        tableColumn('olChange', 'OL Change', width: 70),
                        tableColumn('ol', 'OL', width: 70),
                      ],
                    ),

                    // MIDDLE TABLE
                    Expanded(
                      child: SizedBox(
                        height: 400,
                        child: SfDataGrid(
                          frozenColumnsCount: 2,
                          source: _middleDataSource,
                          columns: [
                            tableColumn('strike', 'Strike',
                                width: 60, color: Colors.grey.shade200),
                            tableColumn('iv', 'IV',
                                width: 70, color: Colors.grey.shade200),
                          ],
                        ),
                      ),
                    ),

                    // RIGHT TABLE
                    SFTable<StockDataModel>(
                      controller: _rightGridController,
                      horizontalScrollController:
                          _rightHorizontalScrollController,
                      verticalScrollController: _rightVerticalScrollController,
                      dataSource: _rightDataSource,
                      columns: [
                        tableColumn('ol', 'OL', width: 70),
                        tableColumn('olChange', 'OL Change', width: 70),
                        tableColumn('volume', 'Volume', width: 70),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
