class CountryListModel {
    Flags? flags;
    Name? name;
    String? region;

    CountryListModel({
        this.flags,
        this.name,
        this.region,
    });

    factory CountryListModel.fromJson(Map<String, dynamic> json) => CountryListModel(
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        region: json["region"],
    );

    Map<String, dynamic> toJson() => {
        "flags": flags?.toJson(),
        "name": name?.toJson(),
        "region": region,
    };
}

class Flags {
    String? png;
    String? svg;
    String? alt;

    Flags({
        this.png,
        this.svg,
        this.alt,
    });

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
    };
}

class Name {
    String? common;
    String? official;
    NativeName? nativeName;

    Name({
        this.common,
        this.official,
        this.nativeName,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null ? null : NativeName.fromJson(json["nativeName"]),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
    };
}

class NativeName {
    Fra? fra;

    NativeName({
        this.fra,
    });

    factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        fra: json["fra"] == null ? null : Fra.fromJson(json["fra"]),
    );

    Map<String, dynamic> toJson() => {
        "fra": fra?.toJson(),
    };
}

class Fra {
    String? official;
    String? common;

    Fra({
        this.official,
        this.common,
    });

    factory Fra.fromJson(Map<String, dynamic> json) => Fra(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}
