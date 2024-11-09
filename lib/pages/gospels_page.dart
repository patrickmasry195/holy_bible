import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holy_bible/helper/constants.dart';
import 'package:holy_bible/cubits/gospels_cubit/gospels_cubit.dart';
import 'package:holy_bible/widgets/custom_button.dart';

class GospelsPage extends StatelessWidget {
  final String? testamentType;

  const GospelsPage({super.key, this.testamentType});

  @override
  Widget build(BuildContext context) {
    if (testamentType != null) {
      context.read<GospelsCubit>().fetchGospels(testamentType!);
    }
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            'الاناجيل',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: BlocBuilder<GospelsCubit, GospelsState>(
        builder: (context, state) {
          if (state is GospelsLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else if (state is GospelsSuccessState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 2,
                ),
                itemCount: state.gospels.length,
                itemBuilder: (context, index) {
                  return CustomButton(
                    onTap: () => context
                        .go('/chapters?bookId=${state.gospels[index].id}'),
                    text: state.gospels[index].name,
                    height: 70,
                    width: 100,
                  );
                },
              ),
            );
          } else if (state is GospelsFailureState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('No Gospels found.'));
          }
        },
      ),
    );
  }
}
