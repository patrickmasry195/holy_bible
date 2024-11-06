import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_bible/constants.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  double textSize = 16;
  final double maxTextSize = 40;
  final double minTextSize = 16;
  String chapterText =
      '''لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور

أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد

أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس

أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت

نيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا

كيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () => context.go('/gospels'),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Center(
          child: Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: const Center(
              child: Text(
                'التكوين 1',
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (textSize < maxTextSize) {
                  textSize += 1;
                }
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (textSize > minTextSize) {
                  textSize -= 1;
                }
              });
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 120),
            child: Text(
              textAlign: TextAlign.end,
              chapterText,
              style: GoogleFonts.amiri(
                fontSize: textSize,
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 24),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 24),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
