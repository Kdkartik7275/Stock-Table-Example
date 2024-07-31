import 'package:data_table/cell.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:data_table/stock_model.dart';

// Data Source for the Left Table
class LeftStockDataSource extends DataGridSource {
  LeftStockDataSource(List<StockDataModel> stocks) {
    dataGridRows = stocks.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'volume', value: dataGridRow.volume),
        DataGridCell<String>(
            columnName: 'olChange', value: dataGridRow.olChange),
        DataGridCell<String>(columnName: 'ol', value: dataGridRow.ol),
      ]);
    }).toList();
  }

  late List<DataGridRow> dataGridRows;

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      buildCell(row.getCells()[0].value), // Volume
      buildCell(row.getCells()[1].value), // OL Change
      buildCell(row.getCells()[2].value), // OL
    ]);
  }
}

// Data Source for the Right Table
class RightStockDataSource extends DataGridSource {
  RightStockDataSource(List<StockDataModel> stocks) {
    dataGridRows = stocks.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'ol', value: dataGridRow.ol),
        DataGridCell<String>(
            columnName: 'olChange', value: dataGridRow.olChange),
        DataGridCell<String>(columnName: 'volume', value: dataGridRow.volume),
      ]);
    }).toList();
  }

  late List<DataGridRow> dataGridRows;

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      buildCell(row.getCells()[0].value), // OL
      buildCell(row.getCells()[1].value), // OL Change
      buildCell(row.getCells()[2].value), // Volume
    ]);
  }
}
