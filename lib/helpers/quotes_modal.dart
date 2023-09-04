class Quotesmodals {
  final int id;
  final String quote;
  final String author;

  Quotesmodals({
    required this.quote,
    required this.id,
    required this.author,
  });

  factory Quotesmodals.fromMap({required Map data}) {
    return Quotesmodals(
      quote: data['quote'],
      id: data['id'],
      author: data['author'],
    );
  }
}
