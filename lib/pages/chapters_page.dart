import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holy_bible/constants.dart';
import 'package:holy_bible/widgets/custom_button.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          itemCount: 30,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 17,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onTap: () => context.go('/chapter'),
                text: '1',
              ),
            );
          }),
    );
  }
}
