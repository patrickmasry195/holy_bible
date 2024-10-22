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
  String dropDownValue = 'التكوين 1'; // Move outside build method

  var items = [
    'التكوين 1',
    'التكوين 2',
    'التكوين 3',
    'التكوين 4',
    'التكوين 5',
  ];

  double textSize = 16;
  final double maxTextSize = 24;
  final double minTextSize = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () => context.go('/gospels'),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                iconSize: 40,
                icon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.black,
                ),
                value: dropDownValue,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Center(
                      child: Text(
                        items,
                        style: GoogleFonts.balooBhaijaan2(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Text(
                        textAlign: TextAlign.end,
                        '''لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور

أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد

أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات . ديواس

أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار أيو فيجايت

نيولا باراياتيور. أيكسسيبتيور ساينت أوككايكات كيوبايداتات نون بروايدينت ,سيونت ان كيولبا

كيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم.''',
                        style: GoogleFonts.amiri(
                          fontSize: textSize,
                        ));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
