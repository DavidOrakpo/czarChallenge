// ignore_for_file: constant_identifier_names

enum Interests {
  // Anxiety, Depression, Insomnia,
  Studies(title: "Studies"),
  Reading(title: "Reading"),
  Technologies(title: "Technologies"),
  Travel(title: "Travel"),
  Psychology(title: "Psychology"),
  Gaming(title: "Gaming"),
  TVMovies(title: "TV/Movies"),
  Sports(title: "Sports"),
  Languages(title: "Languages"),
  Fashion(title: "Fashion"),
  Fitness(title: "Fitness"),
  Pets(title: "Pets"),
  Food(title: "Food"),
  ClimageChange(title: "Climate Change"),
  SelfCare(title: "Self-Care"),
  WorkLife(title: "Work life"),
  Culture(title: "Culture"),
  Design(title: "Design"),
  Sociology(title: "Sociology"),
  Music(title: "Music"),
  Outdoor(title: "Outdoor"),
  Networking(title: "Networking"),
  Romance(title: "Romance"),
  Shopping(title: "Shopping"),
  SightSeeing(title: "Sight-Seeing");

  const Interests({required this.title});
  final String title;
}
