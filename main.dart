import 'package:flutter/material.dart';

void main() {
  runApp(const MyShopMini());
}

const Color kBackground = Color(0xFFF2E6DC); // coklat muda
const Color kBrown = Color(0xFF4A2E2A);
const Color kAccentGold = Color(0xFFB98545);

class MyShopMini extends StatelessWidget {
  const MyShopMini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.brown,
        brightness: Brightness.light,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kBrown, displayColor: kBrown),
      ),
      home: const HomeScreen(),
    );
  }
}

const Map<String, List<Map<String, dynamic>>> productsByCategory = {
  'Makanan': [
    {
      'name': 'Nasi Goreng Spesial',
      'price': 15000,
      'icon': Icons.rice_bowl,
      'image':
          'assets/nasi goreng.jpeg'
    },
    {
      'name': 'Sate Madura',
      'price': 20000,
      'icon': Icons.set_meal,
      'image':
          'assets/sate.jpeg'
    },
    {
      'name': 'Bakso Komplit',
      'price': 12000,
      'icon': Icons.soup_kitchen,
      'image':
          'assets/bakso.jpeg'
    },
  ],
  'Minuman': [
    {
      'name': 'Espresso',
      'price': 25000,
      'icon': Icons.local_cafe,
      'image':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=1200&q=80&auto=format&fit=crop'
    },
    {
      'name': 'Caffè Latte',
      'price': 30000,
      'icon': Icons.local_cafe,
      'image':
          'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=1200&q=80&auto=format&fit=crop'
    },
    {
      'name': 'matcha latte',
      'price': 35000,
      'icon': Icons.icecream,
      'image':
          'assets/matcha.jpeg'
    },
  ],
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, Object>> categories = const [
    {'label': 'Makanan', 'icon': Icons.fastfood},
    {'label': 'Minuman', 'icon': Icons.local_drink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'MyShop Mini',
          style: TextStyle(
            color: kBrown,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.6,
            shadows: [
              Shadow(color: Color(0x22000000), offset: Offset(0, 1), blurRadius: 2),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: kBrown)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero banner - mewah
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                        Text('Selamat Datang di MyShop Mini', style: TextStyle(color: kBrown, fontSize: 18, fontWeight: FontWeight.w800)),
                        SizedBox(height: 6),
                        Text('Nikmati kopi dan sajian premium, suasana mewah dan hangat.', style: TextStyle(color: Colors.black87)),
                      ]),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800&q=80&auto=format&fit=crop',
                        width: 88,
                        height: 88,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Categories row (Makanan, Minuman)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: categories.map((c) {
                  final label = c['label'] as String;
                  final icon = c['icon'] as IconData;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ProductListScreen(category: label)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 6))],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(icon, size: 28, color: kBrown),
                            const SizedBox(height: 8),
                            Text(label, style: const TextStyle(fontWeight: FontWeight.w700, color: kBrown)),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 18),

              const Text('Menu Unggulan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBrown)),
              const SizedBox(height: 12),

              // Featured products grid (show minuman)
              Expanded(
                child: GridView.builder(
                  itemCount: productsByCategory['Minuman']!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, idx) {
                    final item = productsByCategory['Minuman']![idx];
                    return _CoffeeProductCard(
                      product: item,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: item))),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBrown,
        onPressed: () {},
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }
}

class _CoffeeProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  const _CoffeeProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final name = product['name'] as String;
    final price = product['price'] as num;
    final image = product['image'] as String?;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: const Offset(0, 8))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: image != null
                  ? Hero(tag: name, child: Image.network(image, height: 120, fit: BoxFit.cover))
                  : Container(height: 120, color: Colors.grey.shade200),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w800, color: kBrown)),
                const SizedBox(height: 6),
                Text('Rp ${price.toString()}', style: const TextStyle(color: kBrown, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: kAccentGold, borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.white),
                        splashRadius: 20,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: onTap,
                      child: const Text('Detail'),
                      style: TextButton.styleFrom(foregroundColor: kBrown),
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final String category;
  const ProductListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = productsByCategory[category] ?? [];
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        title: Text(category, style: const TextStyle(color: kBrown, fontWeight: FontWeight.w800)),
        iconTheme: const IconThemeData(color: kBrown),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.72,
          ),
          itemBuilder: (context, i) {
            final prod = products[i];
            return _CoffeeProductCard(
              product: prod,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: prod))),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final name = product['name'] as String;
    final price = product['price'] as num;
    final image = product['image'] as String?;
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        children: [
          Stack(
            children: [
              if (image != null)
                Hero(tag: name, child: Image.network(image, width: double.infinity, height: 320, fit: BoxFit.cover))
              else
                Container(height: 320, color: Colors.grey.shade200),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(0, -20, 0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(width: 60, height: 6, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6))),
                  const SizedBox(height: 12),
                  Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kBrown)),
                  const SizedBox(height: 8),
                  Text('Rp ${price.toString()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kBrown)),
                  const SizedBox(height: 16),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 1,
                    child: Column(
                      children: const [
                        ListTile(title: Text('Size'), subtitle: Text('M • 250ml'), trailing: Icon(Icons.chevron_right)),
                        Divider(height: 1),
                        ListTile(title: Text('Add-ins'), subtitle: Text('Hot water'), trailing: Icon(Icons.chevron_right)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: kBrown, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text('Add item', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
