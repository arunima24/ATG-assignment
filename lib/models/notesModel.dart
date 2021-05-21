class Notes {
  String id;
  String title;
  String content;

  Notes({this.id, this.title, this.content});

  Notes.fromMap(Map snapshot, String id)
      : id = id ?? '',
        title = snapshot['title'] ?? '',
        content = snapshot['content'] ?? '';

  toJson() {
    return {
      "title": title,
      "content": content,
    };
  }
}
