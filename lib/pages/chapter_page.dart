import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_bible/helper/constants.dart';
import 'package:holy_bible/cubits/chapter_cubit/chapter_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ChapterPage extends StatefulWidget {
  final String chapterId;

  const ChapterPage({super.key, required this.chapterId});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  double textSize = 16;
  final double maxTextSize = 40;
  final double minTextSize = 16;

  @override
  void initState() {
    super.initState();
    if (widget.chapterId.isNotEmpty) {
      context.read<ChapterCubit>().fetchChapter(widget.chapterId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterCubit, ChapterState>(
      builder: (context, state) {
        final chapter = (state is ChapterSuccessState) ? state.chapter : null;

        return Scaffold(
          appBar: AppBar(
            shadowColor: kBackgroundColor,
            backgroundColor: kBackgroundColor,
            leading: IconButton(
              onPressed: () => context.go('/gospels'),
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            ),
            title: Center(
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Center(
                  child: state is ChapterLoadingState
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                        )
                      : Text(
                          chapter?.reference ?? 'Chapter',
                          style: const TextStyle(color: Colors.black),
                        ),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (textSize < maxTextSize) textSize += 1;
                  });
                },
                icon: const Icon(Icons.add, color: Colors.black, size: 30),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (textSize > minTextSize) textSize -= 1;
                  });
                },
                icon: const Icon(Icons.remove, color: Colors.black, size: 30),
              ),
            ],
          ),
          body: Stack(
            children: [
              // Display content if available, or a shimmer placeholder if loading
              if (state is ChapterLoadingState)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(8, (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            color: Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                )
              else
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 120),
                  child: Text(
                    chapter?.content ?? 'No content available',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.amiri(fontSize: textSize),
                  ),
                ),

              // Bottom navigation for navigating between chapters
              Positioned(
                left: 12,
                bottom: 24,
                child: IconButton(
                  onPressed: () {
                    if (chapter?.previousChapter?.id != null) {
                      context
                          .read<ChapterCubit>()
                          .fetchChapter(chapter!.previousChapter!.id);
                    }
                  },
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black, size: 50),
                ),
              ),
              Positioned(
                right: 12,
                bottom: 24,
                child: IconButton(
                  onPressed: () {
                    if (chapter?.nextChapter?.id != null) {
                      context
                          .read<ChapterCubit>()
                          .fetchChapter(chapter!.nextChapter!.id);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward,
                      color: Colors.black, size: 50),
                ),
              ),

              // Error message if failed to load chapter
              if (state is ChapterFailureState)
                Center(
                  child: Text(
                    state.errorMessage.isNotEmpty
                        ? state.errorMessage
                        : 'Failed to load chapter',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
