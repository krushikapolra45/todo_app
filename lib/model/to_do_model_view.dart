class ToDoModelAddList {
  String? title;
  String? content;
  String? time;

  ToDoModelAddList({
    this.title,
    this.content,
    this.time,
  });

  ToDoModelAddList.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    content = json["content"];
    time = json["time"];
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address?.toJson(),
    "phone": phone,
    "website": website,
    "company": company?.toJson(),
  };
}
