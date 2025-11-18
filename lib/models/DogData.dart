// To parse this JSON data, do
//
//     final dogData = dogDataFromJson(jsonString);

import 'dart:convert';

DogData dogDataFromJson(String str) => DogData.fromJson(json.decode(str));

String dogDataToJson(DogData data) => json.encode(data.toJson());

class DogData {
    List<Datum> data;
    Meta meta;
    Links links;

    DogData({
        required this.data,
        required this.meta,
        required this.links,
    });

    factory DogData.fromJson(Map<String, dynamic> json) => DogData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
        links: Links.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
        "links": links.toJson(),
    };
}

class Datum {
    String id;
    DatumType type;
    Attributes attributes;
    Relationships relationships;

    Datum({
        required this.id,
        required this.type,
        required this.attributes,
        required this.relationships,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: datumTypeValues.map[json["type"]]!,
        attributes: Attributes.fromJson(json["attributes"]),
        relationships: Relationships.fromJson(json["relationships"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": datumTypeValues.reverse[type],
        "attributes": attributes.toJson(),
        "relationships": relationships.toJson(),
    };
}

class Attributes {
    String name;
    String description;
    FemaleWeight life;
    FemaleWeight maleWeight;
    FemaleWeight femaleWeight;
    bool hypoallergenic;

    Attributes({
        required this.name,
        required this.description,
        required this.life,
        required this.maleWeight,
        required this.femaleWeight,
        required this.hypoallergenic,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        description: json["description"],
        life: FemaleWeight.fromJson(json["life"]),
        maleWeight: FemaleWeight.fromJson(json["male_weight"]),
        femaleWeight: FemaleWeight.fromJson(json["female_weight"]),
        hypoallergenic: json["hypoallergenic"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "life": life.toJson(),
        "male_weight": maleWeight.toJson(),
        "female_weight": femaleWeight.toJson(),
        "hypoallergenic": hypoallergenic,
    };
}

class FemaleWeight {
    int max;
    int min;

    FemaleWeight({
        required this.max,
        required this.min,
    });

    factory FemaleWeight.fromJson(Map<String, dynamic> json) => FemaleWeight(
        max: json["max"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
    };
}

class Relationships {
    Group group;

    Relationships({
        required this.group,
    });

    factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        group: Group.fromJson(json["group"]),
    );

    Map<String, dynamic> toJson() => {
        "group": group.toJson(),
    };
}

class Group {
    Data data;

    Group({
        required this.data,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    String id;
    DataType type;

    Data({
        required this.id,
        required this.type,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: dataTypeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": dataTypeValues.reverse[type],
    };
}

enum DataType {
    GROUP
}

final dataTypeValues = EnumValues({
    "group": DataType.GROUP
});

enum DatumType {
    BREED
}

final datumTypeValues = EnumValues({
    "breed": DatumType.BREED
});

class Links {
    String self;
    String current;

    Links({
        required this.self,
        required this.current,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        current: json["current"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "current": current,
    };
}

class Meta {
    Pagination pagination;

    Meta({
        required this.pagination,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    int current;
    int records;

    Pagination({
        required this.current,
        required this.records,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        current: json["current"],
        records: json["records"],
    );

    Map<String, dynamic> toJson() => {
        "current": current,
        "records": records,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
