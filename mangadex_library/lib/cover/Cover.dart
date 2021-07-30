class Cover {
  late List<Result> results;
  late int limit;
  late int offset;
  late int total;
  Cover(this.results, this.limit, this.offset, this.total);
  Cover.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results.add(Result.fromJson(v));
      });
    }
    limit = json['limit'] ?? 0;
    offset = json['offset'] ?? 0;
    total = json['total'] ?? 0;
  }
}

class Result {
  late String result;
  late Data data;
  late List<Relationships> relationships;
  Result(this.result, this.data);
  Result.fromJson(Map<String, dynamic> json) {
    result = json['result'] ?? '';
    if (json['data'] != null) {
      data = Data.fromJson(json['data']);
    }
    if (json['relationships'] != null) {
      relationships = <Relationships>[];
      json['relationships'].forEach((v) {
        relationships.add(Relationships.fromJson(v));
      });
    }
  }
}

class Data {
  late String id;
  late String type;
  late Attributes attributes;
  Data(this.id, this.type, this.attributes);
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    type = json['type'] ?? '';
  }
}

class Attributes {
  late String volume;
  late String filename;
  late String description;
  late int version;
  late String createdAt;
  late String updatedAt;
  Attributes(this.volume, this.filename, this.description, this.version,
      this.createdAt, this.updatedAt);
  Attributes.fromJson(Map<String, dynamic> json) {
    volume = json['volume'] ?? '';
    filename = json['filename'] ?? '';
    description = json['description'] ?? '';
    version = json['version'] ?? '';
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
  }
}

class Relationships {
  late String id;
  late String type;
  Relationships.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    type = json['type'] ?? '';
  }
}
