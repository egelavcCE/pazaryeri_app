class CommentModel {
  final int commentID;
  final int customerID;
  final String comment;
  final String commentDate;
  final int starPoint;

  CommentModel(
      {required this.commentID,
      required this.customerID,
      required this.comment,
      required this.starPoint,
      required this.commentDate,});
}
