import 'package:equatable/equatable.dart';

class Trending extends Equatable {
  final int id;
  final String posterImage;
  final String title;
  const Trending({
    required this.id,
    required this.posterImage,
    required this.title,
  });

  @override
  List<Object?> get props => [id, posterImage, title];
}
