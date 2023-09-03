class quotesmodals {
  final int id;
  final String quote;
  final String author;
  quotesmodals(this.quote, this.id, this.author);

  factory quotesmodals.fromMap({required Map data}) {
    return quotesmodals(data['quote'], data['id'], data['author']);
  }
}
