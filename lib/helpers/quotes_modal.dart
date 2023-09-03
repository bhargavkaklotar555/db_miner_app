class Quotesmodals {
  final int id;
  final String quote;
  final String author;

  Quotesmodals(this.quote, this.id, this.author);

  factory Quotesmodals.fromMap({required Map data}) {
    return Quotesmodals(data['quote'], data['id'], data['author']);
  }
}
