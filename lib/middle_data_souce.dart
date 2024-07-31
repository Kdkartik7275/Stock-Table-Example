import 'package:data_table/cell.dart';
import 'package:data_table/stock_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MiddleDataSouce extends DataGridSource {
  MiddleDataSouce(List<MiddleDataModel> stocks) {
    dataGridRows = stocks.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'strike', value: dataGridRow.strike),
        DataGridCell<String>(columnName: 'iv', value: dataGridRow.iv),
      ]);
    }).toList();
  }

  late List<DataGridRow> dataGridRows;

  @override
  List<DataGridRow> get rows => dataGridRows;
  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      buildCell(row.getCells()[0].value),
      buildCell(row.getCells()[1].value),
    ]);
  }
}
