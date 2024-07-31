// ignore_for_file: public_member_api_docs, sort_constructors_first
class StockDataModel {
  final String volume;
  final String olChange;
  final String ol;
  StockDataModel(
    this.volume,
    this.olChange,
    this.ol,
  );
}

class MiddleDataModel {
  final String strike;
  final String iv;

  MiddleDataModel(this.iv, this.strike);
}
