class Sponsored {
  String genre;
  String name;
  String author;
  String backgroundImage;

  Sponsored({
    required this.author,
    required this.name,
    required this.genre,
    required this.backgroundImage,
  });

  static List<Sponsored> getSponsored() {
    List<Sponsored> sponsored = [];

    sponsored.add(Sponsored(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/501/100"));

    sponsored.add(Sponsored(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/502/100"));

    sponsored.add(Sponsored(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/501/101"));

    sponsored.add(Sponsored(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/500/101"));

    sponsored.add(Sponsored(
        author: "author",
        name: "name",
        genre: "genre",
        backgroundImage: "https://picsum.photos/500/102"));
    return sponsored;
  }
}
