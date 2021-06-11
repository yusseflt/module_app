class PokedexModel {
  PokedexModel({
    this.descriptions,
    this.id,
    this.isMainSeries,
    this.name,
    this.names,
    this.pokemonEntries,
    this.region,
    this.versionGroups,
  });

  List<Description>? descriptions;
  int? id;
  bool? isMainSeries;
  String? name;
  List<Name>? names;
  List<PokemonEntry>? pokemonEntries;
  dynamic region;
  List<dynamic>? versionGroups;

  factory PokedexModel.fromJson(Map<String, dynamic> json) => PokedexModel(
        descriptions: List<Description>.from(
            json["descriptions"].map((x) => Description.fromJson(x))),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemonEntries: List<PokemonEntry>.from(
            json["pokemon_entries"].map((x) => PokemonEntry.fromJson(x))),
        region: json["region"],
        versionGroups: List<dynamic>.from(json["version_groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "descriptions":
            List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names!.map((x) => x.toJson())),
        "pokemon_entries":
            List<dynamic>.from(pokemonEntries!.map((x) => x.toJson())),
        "region": region,
        "version_groups": List<dynamic>.from(versionGroups!.map((x) => x)),
      };
}

class Description {
  Description({
    this.description,
    this.language,
  });

  String? description;
  Language? language;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: Language.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "language": language!.toJson(),
      };
}

class Language {
  Language({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Name {
  Name({
    this.language,
    this.name,
  });

  Language? language;
  String? name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Language.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language!.toJson(),
        "name": name,
      };
}

class PokemonEntry {
  PokemonEntry({
    this.entryNumber,
    this.pokemonSpecies,
  });

  int? entryNumber;
  Language? pokemonSpecies;

  factory PokemonEntry.fromJson(Map<String, dynamic> json) => PokemonEntry(
        entryNumber: json["entry_number"],
        pokemonSpecies: Language.fromJson(json["pokemon_species"]),
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
        "pokemon_species": pokemonSpecies!.toJson(),
      };
}
