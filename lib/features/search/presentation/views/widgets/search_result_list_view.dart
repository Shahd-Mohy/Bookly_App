import 'package:book_app/core/utils/styels.dart';
import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:book_app/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccess) {
        return SliverList.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItem(
                bookModel: state.books![index],
              ),
            );
          },
        );
      } else if (state is SearchFailure) {
        return SliverToBoxAdapter(
          child: CustomErrorWidget(errMessage: state.errMessage),
        );
      } else if (state is SearchLoading) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return SliverToBoxAdapter(
          child: Container(),
        );
      }
    });
  }
}
