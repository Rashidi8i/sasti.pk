class Category {
  const Category(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final homeCategries = <Category>[
  const Category('assets/images/kt.png', 'Kitchen', 'sofa'),
  const Category('assets/images/fnt.png', 'Furniture', 'sofa'),
  const Category('assets/images/bty.png', 'Beauty', 'sofa'),
  const Category('assets/images/m_fashion.png', 'Men\'s Fashion', 'sofa'),
  const Category('assets/images/m_fashion.png', 'Women\'s Fashion', 'sofa'),
  const Category('assets/images/grcy.png', 'Grocereies', 'sofa'),
  const Category('assets/images/sp.png', 'Sports', 'sofa'),
  const Category('assets/images/mb.png', 'Mobiles', 'sofa'),
];
