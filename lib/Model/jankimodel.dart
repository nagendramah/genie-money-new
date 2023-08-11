class Jankimodel {
  Jankimodel({
      this.id, 
      this.name, 
      this.slug, 
      this.parent, 
      this.description, 
      this.display, 
      this.image, 
      this.menuOrder, 
      this.count, 
      this.links,});

  Jankimodel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
    display = json['display'];
    image = json['image'];
    menuOrder = json['menu_order'];
    count = json['count'];
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  dynamic image;
  int? menuOrder;
  int? count;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['parent'] = parent;
    map['description'] = description;
    map['display'] = display;
    map['image'] = image;
    map['menu_order'] = menuOrder;
    map['count'] = count;
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }

}

class Links {
  Links({
      this.self, 
      this.collection, 
      this.up,});

  Links.fromJson(dynamic json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self?.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection?.add(Collection.fromJson(v));
      });
    }
    if (json['up'] != null) {
      up = [];
      json['up'].forEach((v) {
        up?.add(Up.fromJson(v));
      });
    }
  }
  List<Self>? self;
  List<Collection>? collection;
  List<Up>? up;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      map['collection'] = collection?.map((v) => v.toJson()).toList();
    }
    if (up != null) {
      map['up'] = up?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Up {
  Up({
      this.href,});

  Up.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Collection {
  Collection({
      this.href,});

  Collection.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Self {
  Self({
      this.href,});

  Self.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}