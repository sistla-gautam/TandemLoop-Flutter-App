class RecomendedBooks {
  String genre;
  String name;
  String author;
  String backgroundImage;

  RecomendedBooks({
    required this.author,
    required this.name,
    required this.genre,
    required this.backgroundImage,
  });

  static List<RecomendedBooks> getRecomendedBooks() {
    List<RecomendedBooks> books = [];

    books.add(RecomendedBooks(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/151/200"));

    books.add(RecomendedBooks(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/152/200"));

    books.add(RecomendedBooks(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/153/200"));

    books.add(RecomendedBooks(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/154/200"));

    books.add(RecomendedBooks(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/155/200"));
    return books;
  }
}
