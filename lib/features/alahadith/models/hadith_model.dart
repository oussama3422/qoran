class HadithModel {
  int? id;
  String? hadithNumber;
  String? englishNarrator;
  String? hadithEnglish;
  String? hadithUrdu;
  String? urduNarrator;
  String? hadithArabic;
  String? headingArabic;
  String? headingUrdu;
  String? headingEnglish;
  String? chapterId;
  String? bookSlug;
  String? volume;
  String? status;
  Book? book;
  Chapter? chapter;

  HadithModel(
      {this.id,
      this.hadithNumber,
      this.englishNarrator,
      this.hadithEnglish,
      this.hadithUrdu,
      this.urduNarrator,
      this.hadithArabic,
      this.headingArabic,
      this.headingUrdu,
      this.headingEnglish,
      this.chapterId,
      this.bookSlug,
      this.volume,
      this.status,
      this.book,
      this.chapter});


  static List<HadithModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HadithModel.fromJson(json)).toList();
  }

  HadithModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hadithNumber = json['hadithNumber'];
    englishNarrator = json['englishNarrator'];
    hadithEnglish = json['hadithEnglish'];
    hadithUrdu = json['hadithUrdu'];
    urduNarrator = json['urduNarrator'];
    hadithArabic = json['hadithArabic'];
    headingArabic = json['headingArabic'];
    headingUrdu = json['headingUrdu'];
    headingEnglish = json['headingEnglish'];
    chapterId = json['chapterId'];
    bookSlug = json['bookSlug'];
    volume = json['volume'];
    status = json['status'];
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
    chapter =
        json['chapter'] != null ? new Chapter.fromJson(json['chapter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hadithNumber'] = this.hadithNumber;
    data['englishNarrator'] = this.englishNarrator;
    data['hadithEnglish'] = this.hadithEnglish;
    data['hadithUrdu'] = this.hadithUrdu;
    data['urduNarrator'] = this.urduNarrator;
    data['hadithArabic'] = this.hadithArabic;
    data['headingArabic'] = this.headingArabic;
    data['headingUrdu'] = this.headingUrdu;
    data['headingEnglish'] = this.headingEnglish;
    data['chapterId'] = this.chapterId;
    data['bookSlug'] = this.bookSlug;
    data['volume'] = this.volume;
    data['status'] = this.status;
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    if (this.chapter != null) {
      data['chapter'] = this.chapter!.toJson();
    }
    return data;
  }
}

class Book {
  int? id;
  String? bookName;
  String? writerName;
  Null? aboutWriter;
  String? writerDeath;
  String? bookSlug;

  Book(
      {this.id,
      this.bookName,
      this.writerName,
      this.aboutWriter,
      this.writerDeath,
      this.bookSlug});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookName = json['bookName'];
    writerName = json['writerName'];
    aboutWriter = json['aboutWriter'];
    writerDeath = json['writerDeath'];
    bookSlug = json['bookSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookName'] = this.bookName;
    data['writerName'] = this.writerName;
    data['aboutWriter'] = this.aboutWriter;
    data['writerDeath'] = this.writerDeath;
    data['bookSlug'] = this.bookSlug;
    return data;
  }
}

class Chapter {
  int? id;
  String? chapterNumber;
  String? chapterEnglish;
  String? chapterUrdu;
  String? chapterArabic;
  String? bookSlug;

  Chapter(
      {this.id,
      this.chapterNumber,
      this.chapterEnglish,
      this.chapterUrdu,
      this.chapterArabic,
      this.bookSlug});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterNumber = json['chapterNumber'];
    chapterEnglish = json['chapterEnglish'];
    chapterUrdu = json['chapterUrdu'];
    chapterArabic = json['chapterArabic'];
    bookSlug = json['bookSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapterNumber'] = this.chapterNumber;
    data['chapterEnglish'] = this.chapterEnglish;
    data['chapterUrdu'] = this.chapterUrdu;
    data['chapterArabic'] = this.chapterArabic;
    data['bookSlug'] = this.bookSlug;
    return data;
  }
}

