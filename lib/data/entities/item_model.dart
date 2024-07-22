class MovieResponse {
  final String title;
  final String releaseYear;
  final String locations;
  final String productionCompany;
  final String distributor;
  final String director;
  final String writer;
  final String actor1;
  final String actor2;final String actor3;
  final String? computedRegion6qbpSg9q;
  final String? computedRegionAjp5B2md;
  final String? computedRegion26crCadq;

  MovieResponse({
    required this.title,
    required this.releaseYear,
    required this.locations,
    required this.productionCompany,
    required this.distributor,
    required this.director,
    required this.writer,
    required this.actor1,
    required this.actor2,
    required this.actor3,
    this.computedRegion6qbpSg9q,
    this.computedRegionAjp5B2md,
    this.computedRegion26crCadq,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      title: json['title']  ?? '',
      releaseYear: json['release_year'] ?? '',
      locations: json['locations'] ?? '',
      productionCompany: json['production_company'] ?? '',
      distributor: json['distributor'] ?? '',
      director: json['director'] ?? '',
      writer: json['writer'] ?? '',
      actor1: json['actor_1'] ?? '',
      actor2: json['actor_2'] ?? '',
      actor3: json['actor_3'] ?? '',
      computedRegion6qbpSg9q: json[':@computed_region_6qbp_sg9q'],
      computedRegionAjp5B2md: json[':@computed_region_ajp5_b2md'],
      computedRegion26crCadq: json[':@computed_region_26cr_cadq'],
    );
  }
}