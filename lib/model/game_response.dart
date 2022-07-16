class GameResponse {
  String? title;
  String? platform;
  double? score;
  String? genre;
  String? editorsChoice;

  GameResponse(
      {this.title, this.platform, this.score, this.genre, this.editorsChoice});

  GameResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    platform = json['platform'];
    score = json['score'];
    genre = json['genre'];
    editorsChoice = json['editors_choice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['platform'] = this.platform;
    data['score'] = this.score;
    data['genre'] = this.genre;
    data['editors_choice'] = this.editorsChoice;
    return data;
  }
}
