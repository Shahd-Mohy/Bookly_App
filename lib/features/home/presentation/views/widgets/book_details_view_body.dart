import 'package:book_app/core/utils/styels.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_del_app_bar.dart';
import 'package:book_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:book_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomBookDetailsAppBar(),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                    child: CustomBookImage(
                      imageUrl:
                         book.volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    book.volumeInfo.title!,
                    style: Styels.textStyle30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      book.volumeInfo.authors![0],
                      style: Styels.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BookRating(
                    rating: book.volumeInfo.averageRating ?? 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    count: book.volumeInfo.ratingsCount ?? 250,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BookAction(bookModel: book,),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('You can also like',
                        style: Styels.textStyle16
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimilarBooksListView(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
