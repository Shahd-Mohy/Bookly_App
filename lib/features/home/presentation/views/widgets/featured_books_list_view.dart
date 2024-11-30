import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/features/home/presentation/view_model/faetured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucces) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      child: CustomBookImage(
                          imageUrl: state
                              .books[index].volumeInfo.imageLinks.thumbnail),
                      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView ,extra:state.books[index] );
      },
                     ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailere) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
