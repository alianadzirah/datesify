class InfoDate {
  final int dateID;
  final String name;
  final String funfact;
  final String origins;
  final String benefits;
  final String colors;
  final String texture;
  final String taste;
  final String expiration;
  final String dateimage;

  InfoDate({
    required this.dateID,
    required this.name,
    required this.funfact,
    required this.origins,
    required this.benefits,
    required this.colors,
    required this.texture,
    required this.taste,
    required this.expiration,
    required this.dateimage
  });
}

List<InfoDate> infoDates = [
  InfoDate(
    dateID: 1,
    name: 'Ajwa',
    funfact: 'First tree of Ajwa Dates is near the Quba Mosque in Madinah',
    origins: 'Medina, Saudi Arabia',
    benefits: '\u2022 Help in regulating blood pressure\n\u2022 Best for your cardiovascular health\n\u2022 Fight fatigue and gives energy\n\u2022 Decreases the risk of Atherosclerosis\n\u2022 Aids in treating infertility\n\u2022 Helps in weight loss',
    colors:'Skin : Glossy dark brown-black',
    texture: 'Meaty and chewy',
    taste: 'A sweet flavor with hints of caramel, honey, and cinnamon.',
    expiration: '\u2022 2 to 3 months if kept at room temp\n\u2022 Up to 2 years if kept in chiller\n\u2022 Up to 5 years if kept in a freezer',
    dateimage: 'assets/datesicon/ajwa2.png',
  ),

  InfoDate(
    dateID: 2,
    name: 'Medjool',
    funfact: "Medjool dates are considered the world's oldest fruit.",
    origins: 'Morocco, Palestine, Jordan and Saudi Arabia',
    benefits: '\u2022  Fiber and antioxidants protects heart\n\u2022  Supports healthy digestion\n\u2022  High in antioxidants\n\u2022  Natural fuel for body\n\u2022  Supports bone health\n\u2022  Protects brain health',
    colors:'Skin : Amber to reddish-brown\nFlesh : Shiny and juicy',
    texture: 'Soft and chewy',
    taste: 'Caramel like, sweet, delicate flavor.',
    expiration: '\u2022 Up to 6 months if kept in the fridge, but may lose moisture the longer they sit.\n\u2022 Up to a year if kept in a freezer',
    dateimage: 'assets/datesicon/medjool2.png',
  ),

  InfoDate(
    dateID: 3,
    name: 'Rutab',
    funfact: 'Rutab is considered the freshest type of Palm fruit and the most loaded in natural sugars and moisture content.',
    origins: 'Saudi Arabia',
    benefits: '\u2022 Cure for indigestion\n\u2022 Prevents abdominal cancer\n\u2022 Help in preventing cancer\n\u2022 Improves mental health\n\u2022 Cures skin problems',
    colors:'Skin : Glossy mahogany brown\nFlesh: Soft amber',
    texture: 'Soft and juicy',
    taste: 'Like maple syrup, caramel and honeyed toffee',
    expiration: '\u2022 1 to 2 months if kept in the fridge\n\u2022 Up to a year if kept in a freezer',
    dateimage: 'assets/datesicon/rutab2.png',
  ),

  InfoDate(
    dateID: 4,
    name: 'Nabtat Ali',
    funfact: 'Date palm is known as the ‘tree of life’ in the Middle East, and it’s the national symbol of Saudi Arabia.',
    origins: 'Saudi Arabia',
    benefits: '\u2022 Helps in losing weight\n\u2022 Controlling cholesterol levels\n\u2022 Healthy brain and hair\n\u2022 High with fiber\n\u2022 Promote natural labor',
    colors:'Skin : Matte yellow\nFlesh: Soft yellow',
    texture: 'Firm and chewy',
    taste: 'Caramel-like, a balanced sweetness and intense flavor',
    expiration: '\u2022 1 to 2 months if kept in the fridge\n\u2022 Up to a year if kept in a freezer',
    dateimage: 'assets/datesicon/nabtatali2.png',
  ),

  InfoDate(
    dateID: 5,
    name: 'Galaxy',
    funfact: 'Date fruits stones are used for making soap and even eyeliners.',
    origins: 'Saudi Arabia',
    benefits: '\u2022Helps to detoxify the body\n\u2022 Controls diabetes\n\u2022 Solves insomnia\n\u2022 Tackles iron deficiency\n\u2022 Prevent piles during pregnancy',
    colors:'Skin : Rich brown with golden-yellowish tones\nFlesh : Light golden',
    texture: 'Medium soft',
    taste: 'Caramel and honey',
    expiration: '\u2022Up to 5 months if kept in the fridge\n\u2022 Up to 5 until 12 months if kept in freezer',
    dateimage: 'assets/datesicon/galaxy2.png',
  ),

  InfoDate(
    dateID: 6,
    name: 'Meneifi',
    funfact: 'Date palm seeds can go dormant for decades until the right light and water conditions present themselves.',
    origins: 'Saudi Arabia',
    benefits: '\u2022 Post-menopausal bone health\n\u2022 Rich in disease-fighting antioxidants\n\u2022 Improves skin\n\u2022 Excellent natural sweetener\n\u2022 Blood sugar controls',
    colors:'Skin : Yellowish-brown\nFlesh : Soft',
    texture: 'Soft',
    taste: 'A sweet flavor',
    expiration: '\u2022 Up to 5 months if kept in the fridge\n\u2022 Up to 5 until 12 months if kept in freezer',
    dateimage: 'assets/datesicon/meneifi2.png',
  ),

  InfoDate(
    dateID: 7,
    name: 'Sugaey',
    funfact: 'These crisp dates are cultivated in Riyadh and famous for their dual shade and texture.',
    origins: 'Arabian Peninsula',
    benefits: '\u2022 Aids healthy bowel movements\n\u2022 High concentration of antioxidants\n\u2022 Reduces risk of cancer\n\u2022 Prevents microbial infections\n\u2022 Can protect kidneys',
    colors:'Skin : Multicoloured hues, yellow and brown\nFlesh : Soft',
    texture: 'Crispy on top and soft on the bottom',
    taste: 'Sweet like brown sugar at yellow part and mildly sweet at brown part',
    expiration: '\u2022 Up to 5 months if kept in the fridge\n\u2022 Up to 5 until 12 months if kept in freezer',
    dateimage: 'assets/datesicon/sugaey2.png',
  ),

  InfoDate(
    dateID: 8,
    name: 'Shaishe',
    funfact: 'The word ‘date’ comes from the Greek word daktylos, meaning finger, because a date looks like the tip of a finger.',
    origins: 'Saudi Arabia',
    benefits: '\u2022 Adds strength to nervous system\n\u2022 Reduces the rate of hair loss\n\u2022 Reduces the chance of getting night blindness\n\u2022 Can improve fertility among males\n\u2022 Rich in vitamins',
    colors:'Skin : Yellow and light brown with thick skin\nFlesh : Yellowish-brown',
    texture: 'Slightly dry',
    taste: 'Subtle flavour of brown sugar and not too sweet',
    expiration: '\u2022 Up to a month if kept at room temperature\n\u2022 Up to 5 months if kept in the fridge\n\u2022 Up to 5 until 12 months if kept in freezer',
    dateimage: 'assets/datesicon/shaishe2.png',
  ),

  InfoDate(
    dateID: 9,
    name: 'Sokari',
    funfact: "'Sokari' literally translates to sugary in Arabic, despite the fact that it is more commonly known as the 'King of Dates.'",
    origins: 'Al Qassim region',
    benefits: '\u2022 Replacement for sugary treats\n\u2022 Keeps the skin healthy\n\u2022 Maintain a balance of water\n\u2022 Improved digestion\n\u2022 Curing anemia',
    colors:'Skin : Light golden brown with patches of lighter color\nFlesh : Wrinkles and chewy light golden',
    texture: 'Sweet, crisp and firm',
    taste: 'Sweet caramel and sweeter than other types',
    expiration: '\u2022 10 - 12 months if kept in the fridge or freezer',
    dateimage: 'assets/datesicon/sokari2.png',
  ),
];