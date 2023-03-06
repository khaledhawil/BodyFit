import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../widgets/food_widget.dart';
import 'details.dart';

class nutrition_page extends StatefulWidget {
  static const String id = 'nutrition_screen';
  const nutrition_page({super.key});

  @override
  State<nutrition_page> createState() => _nutrition_pageState();
}

class _nutrition_pageState extends State<nutrition_page> {
  final foods = [
    [
      'Koshari',
      'images/koshari.png',
      4.8,
      'Cook 1 cup of rice and 1 cup of elbow macaroni separately, and set aside. In a large pan, sauté 1 diced onion and 2 minced garlic cloves in 2 tbsp of vegetable oil until soft. Add 1 can of chickpeas, 1 can of lentils, 1 can of diced tomatoes, and 1 tbsp of tomato paste, and stir to combine. Season with 1 tsp of cumin, 1 tsp of paprika, and salt and pepper to taste. To serve, layer the rice, macaroni, and chickpea mixture in a bowl, and top with crispy fried onions and a drizzle of tangy tomato sauce.',
      '422 kcal',
      '14 g',
      '119 mg'
    ],
    [
      'Molokhia',
      'images/molokhia.png',
      4.6,
      'Boil chicken broth, add molokhia leaves and cook until it turns into a green, slimy soup. Serve with rice or bread.',
      '80 kcal',
      '5 g',
      '65 mg'
    ],
    [
      'Ful Medames',
      'images/fool.png',
      4.7,
      'Cook fava beans, then mix with lemon juice, garlic, cumin, and olive oil. Serve with bread.',
      '289 kcal',
      '17 g',
      '19 mg',
    ],
    [
      'Shawerma',
      'images/shawirma.png',
      4.4,
      'Marinate sliced chicken or beef in a mixture of spices and yogurt, then grill. Serve in pita bread with vegetables and tahini sauce.',
      '450 kcal',
      '27 g',
      '669 mg'
    ],
    [
      'Baba Ganoush',
      'images/baba.png',
      4.2,
      'Roast eggplants, then blend with tahini, lemon juice, garlic, and olive oil. Serve with bread or vegetables.',
      '100 kcal',
      '2 g',
      '25 mg',
    ],
    [
      'Fiteer',
      'images/fiteer.png',
      4.3,
      'Mix flour, yeast, and water to make a dough, then roll it out and layer it with butter or oil. Bake until crispy and golden. Serve with honey or cheese.',
      '523 kcal',
      '15 g',
      '250 mg',
    ],
    [
      'Mahshi',
      'images/mahshi.png',
      4.7,
      'Hollow out vegetables such as zucchini or eggplant, then stuff with rice, meat, and herbs. Bake until cooked through.',
      '296 kcal',
      '13 g',
      '113 mg',
    ],
    [
      'Hawawshi',
      'images/hawawshi.png',
      4.1,
      'Stuff pita bread with spiced ground meat and onions. Bake until crispy.',
      '330 kcal',
      '19 g',
      '480 mg',
    ],
    [
      'Taameya (Egyptian Falafel)',
      'images/t3100.png',
      4.7,
      'Blend fava beans, parsley, coriander, and spices. Shape into patties and fry until golden brown.',
      '150 kcal',
      '6 g',
      '270 mg',
    ],
    [
      'Shakshuka',
      'images/shakshuka.png',
      4.5,
      'Eggs poached in a tomato sauce with onions, peppers, and spices, often served with bread.',
      '250 kcal',
      '12 g',
      '450 mg'
    ],
    [
      'Basbousa',
      'images/basbosa.png',
      4.8,
      'Sweet cake made with semolina, coconut, and syrup, often served with cream or yogurt.',
      '300 kcal',
      '4 g',
      '120 mg'
    ],
    [
      'Feseekh',
      'images/fsekh.png',
      3.9,
      'Salted and fermented mullet fish, often served with bread and sometimes with vegetables.',
      '50 kcal',
      '5 g',
      '820 mg'
    ],
    [
      'Kofta',
      'images/kofta.png',
      4.4,
      'Minced meat (beef or lamb) mixed with spices and onions, shaped into balls or cylinders and grilled.',
      '280 kcal',
      '20 g',
      '480 mg'
    ],
    [
      'Roz bel Laban',
      'images/poz.png',
      4.2,
      'Cook rice in milk and sugar, then top with nuts and cinnamon.',
      '400 kcal',
      '8 g',
      '80 mg'
    ],
    [
      'Bamia',
      'images/bamia.png',
      4.3,
      'A stew made with okra, tomatoes, and lamb or beef.',
      '250 kcal',
      '18 g',
      '280 mg'
    ],
    [
      'Kebda Iskandrani',
      'images/kebda.png',
      4.5,
      'Pan-fried calf liver with garlic, chili, and lemon juice. Served with bread.',
      '190 kcal',
      '21 g',
      '70 mg'
    ],
    [
      'Moussaka',
      'images/musakka.png',
      4.2,
      'Layer eggplant, ground beef, tomato sauce, and cheese and bake until bubbly.',
      '450 kcal',
      '25 g protein',
      '630 mg sodium'
    ],
[
    'Konafa',
    'images/konafa.png',
    4.9,
    'A dessert made of shredded phyllo dough, filled with sweet cheese, and soaked in simple syrup',
    '450 kcal',
    '10 g',
    '200 mg'
  ],

  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Nutrition Page ',
          style: TextStyle(color: Colors.grey[400]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Text(
                'We think you might enjoy these specially selected dishes',
                style: GoogleFonts.poppins(
                  fontSize: size * 0.050,
                  color: AppTheme.purpleText,
                ),
              ),
            ),
            SizedBox(
              height: size * 0.050,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    print(foods[index][1].toString());
                    return GestureDetector(
                      onTap: () {
                        // Push the desired page onto the navigator's stack
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              food: foods[index],
                              text: foods[index][3].toString(),
                              img: foods[index][1].toString(),
                              cal: foods[index][4].toString(),
                              pro: foods[index][5].toString(),
                              cals: foods[index][6].toString(),
                            ),
                          ),
                        );
                      },
                      child: FoodWidget(
                        size: size,
                        foodName: foods[index][0].toString(),
                        image: foods[index][1].toString(),
                        star: double.parse(foods[index][2].toString()),
                        //  decriptin: foods[index][3].toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
