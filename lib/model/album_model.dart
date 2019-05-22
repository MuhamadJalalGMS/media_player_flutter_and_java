class AlbumData {

  int id;
  String title;
  String imageUrl;
  String year;

  AlbumData(this.id, this.title, this.imageUrl, this.year);

  factory AlbumData.fromJson(Map<String, dynamic> json) {
//    print('Tracks List Data fromJson : $json');
    return AlbumData(json['id'], json['title'], json['img'], json['year']);
  }
}

class TrackLinks {
  String first;
  String last;
  String prev;
  String next;

  TrackLinks(this.first, this.last, this.prev, this.next);
}

class TrackMeta {
  int current_page;
  int from;
  int last_page;
  String path;
  int per_page;
  int to;
  int total;

  TrackMeta(this.current_page, this.from, this.last_page, this.path,
      this.per_page, this.to, this.total);
}
