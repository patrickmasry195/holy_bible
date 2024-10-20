import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_bible/constants.dart';
import 'package:holy_bible/widgets/custom_button.dart';

class GospelsPage extends StatelessWidget {
  const GospelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            'الاناجيل',
            style: GoogleFonts.balooBhaijaan2(
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go('/testaments'),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 35,
            ),
          )
        ],
      ),
      body: GridView.builder(
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
        itemCount: 20,
        itemBuilder: (context, index) {
          return const CustomButton(
            text: 'التكوين',
            height: 70,
            width: 100,
            fontSize: 20,
          );
        },
      ),
    );
  }
}
