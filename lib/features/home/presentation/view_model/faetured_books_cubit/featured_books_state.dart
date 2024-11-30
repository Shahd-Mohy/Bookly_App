part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailere extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksFailere(this.errMessage);
}

final class FeaturedBooksSucces extends FeaturedBooksState {
  final List<BookModel> books;

  FeaturedBooksSucces(this.books);

}
