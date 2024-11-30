import 'package:book_app/core/utils/styels.dart';
import 'package:book_app/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:book_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          CustomSearchTextField(
            controller: controller,
            onSubmitted: (data)  {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchResult(bookName: data);
              controller.clear();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Search Result', style: Styels.textStyle18)),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
              child: CustomScrollView(
            slivers: [
              SearchResultListView(),
            ],
          ))
        ],
      ),
    );
  }
}
