class HadithBookModel {
  int? id;
  String? bookName;
  String? writerName;
  String? aboutWriter;
  String? writerDeath;
  String? bookSlug;
  String? hadithsCount;
  String? chaptersCount;

  HadithBookModel({
    this.id,
    this.bookName,
    this.writerName,
    this.aboutWriter,
    this.writerDeath,
    this.bookSlug,
    this.hadithsCount,
    this.chaptersCount,
  });
  
  HadithBookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookName = json['bookName'];
    writerName = json['writerName'];
    aboutWriter = json['aboutWriter'];
    writerDeath = json['writerDeath'];
    bookSlug = json['bookSlug'];
    hadithsCount = json['hadiths_count'];
    chaptersCount = json['chapters_count'];
  }
   static List<HadithBookModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HadithBookModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookName'] = this.bookName;
    data['writerName'] = this.writerName;
    data['aboutWriter'] = this.aboutWriter;
    data['writerDeath'] = this.writerDeath;
    data['bookSlug'] = this.bookSlug;
    data['hadiths_count'] = this.hadithsCount;
    data['chapters_count'] = this.chaptersCount;
    return data;
  }
}
