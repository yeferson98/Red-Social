class People {
  String name;
  String urlImage;
  List<Follower> followers;
  People({required this.name, required this.urlImage,required this.followers});
}

class Follower {
  String urlImage;
  Follower({required this.urlImage});
}

List<People> peoples = [
  People(
    name: "Jane\nFoster",
    urlImage: "assets/image1.jpg",
    followers: [
      Follower(urlImage: "assets/f1.jpg"),
      Follower(urlImage: "assets/f2.jpg"),
      Follower(urlImage: "assets/f3.jpg"),
      Follower(urlImage: "assets/f4.jpg"),
      Follower(urlImage: "assets/f5.jpg")
    ],
  ),
  People(
    name: "Lilian\nMartinez",
    urlImage: "assets/l1.jpg",
    followers: [
      Follower(urlImage: "assets/f1.jpg"),
      Follower(urlImage: "assets/f2.jpg"),
      Follower(urlImage: "assets/f3.jpg"),
      Follower(urlImage: "assets/f4.jpg"),
      Follower(urlImage: "assets/f5.jpg")
    ],
  ),
  People(
    name: "Lucia\nRojas",
    urlImage: "assets/l2.jpg",
    followers: [
      Follower(urlImage: "assets/f1.jpg"),
      Follower(urlImage: "assets/f2.jpg"),
      Follower(urlImage: "assets/f3.jpg"),
      Follower(urlImage: "assets/f4.jpg"),
      Follower(urlImage: "assets/f5.jpg")
    ],
  ),
  People(
    name: "Dana\nFoster",
    urlImage: "assets/l3.jpg",
    followers: [
      Follower(urlImage: "assets/f1.jpg"),
      Follower(urlImage: "assets/f2.jpg"),
      Follower(urlImage: "assets/f3.jpg"),
      Follower(urlImage: "assets/f4.jpg"),
      Follower(urlImage: "assets/f5.jpg")
    ],
  ),
];
