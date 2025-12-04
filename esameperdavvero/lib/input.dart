class Rewiew {
  Rewiew({ 
    required this.title,
    required this.ratingfields,
    this.comment // qua non metto il required pk il commento non è obbligatorio
  });
  String title;
  String? comment;
  int ratingfields;
}
