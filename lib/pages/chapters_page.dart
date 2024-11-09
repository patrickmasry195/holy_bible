import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holy_bible/helper/constants.dart';
import 'package:holy_bible/cubits/chapters_cubit/chapters_cubit.dart';
import 'package:holy_bible/widgets/custom_button.dart';

class ChaptersPage extends StatelessWidget {
  final String? bookId;

  const ChaptersPage({super.key, this.bookId});

  @override
  Widget build(BuildContext context) {
    if (bookId != null) {
      context.read<ChaptersCubit>().fetchChapters(bookId!);
    }
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            'الاصحاحات',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go('/gospels'),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: BlocBuilder<ChaptersCubit, ChaptersState>(
        builder: (context, state) {
          if (state is ChaptersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is ChaptersSuccessState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  itemCount: state.chapters.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 17,
                  ),
                  itemBuilder: (context, index) {
                    final chapter = state.chapters[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        onTap: () {
                          final chapterId = chapter.id;
                          if (chapterId.isNotEmpty) {
                            context.go('/chapter/$chapterId');
                          }
                        },
                        text: chapter.number,
                      ),
                    );
                  }),
            );
          } else if (state is ChaptersFailureState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(child: Text('No Chapters found.'));
          }
        },
      ),
    );
  }
}
