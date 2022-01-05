import 'package:mangadex_library/mangadexServerException.dart';
import 'package:mangadex_library/models/common/relationships.dart';

class UserFollowedUsers {
  late final List<Data> data;
  late final int limit;
  late final int offset;
  late final int total;
  UserFollowedUsers(this.data, this.limit, this.offset, this.total);
  UserFollowedUsers.fromJson(Map<String, dynamic> json) {
    try {
      data = <Data>[];

      json['data']!.forEach((v) {
        data.add(Data.fromJson(v));
      });

      limit = json['limit'] ?? 0;
      offset = json['offset'] ?? 0;
      total = json['total'] ?? 0;
    } on Exception catch (e) {
      throw MangadexServerException(json);
    }
  }
}

class Data {
  late final String id;
  late final String type;
  late final Attributes attributes;
  late final List<Relationship> relationships;
  Data(this.id, this.type, this.attributes);
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    type = json['type'] ?? '';
    attributes = Attributes.fromJson(json['attributes']);
    relationships = <Relationship>[];
    json['relationships']!.forEach((v) {
      relationships.add(Relationship.fromJson(v));
    });
  }
}

class Attributes {
  late final String username;
  late final Role roles;
  late final int version;
  Attributes(this.username, this.roles, this.version);
  Attributes.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    roles = Role.fromJson(json['roles']);
    version = json['version'] ?? 0;
  }
}

class Role {
  late final List<String> roles;
  Role(this.roles);
  Role.fromJson(Map<String, dynamic> json) {
    roles = <String>[];
    if (json['roles'] != null) {
      json['roles'].forEach((v) {
        roles.add(v);
      });
    }
  }
}
