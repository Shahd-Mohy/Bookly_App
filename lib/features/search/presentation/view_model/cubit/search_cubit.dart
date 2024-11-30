import 'package:bloc/bloc.dart';
import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:book_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchResult({required String bookName}) async {
    var result = await searchRepo.fetchSearchResult(name: bookName);
    result.fold((Failure) {
      emit(SearchFailure(Failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
