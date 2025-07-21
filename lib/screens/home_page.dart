import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../providers/coffee_shop_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeShopProvider>(context);
    final shops = provider.shops..sort((a, b) => b.rating.compareTo(a.rating));
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Card akun pengguna dengan margin top
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('Nama Pengguna'),
              subtitle: const Text('user@email.com'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Carousel produk kopi
        CarouselSlider(
          options: CarouselOptions(height: 140, autoPlay: true),
          items:
              [
                    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                    'https://images.unsplash.com/photo-1511920170033-f8396924c348',
                    'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
                  ]
                  .map(
                    (url) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: 24),
        const Text(
          'Pedagang Kopi Terbaik',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        ...shops.map(
          (shop) => Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  shop.photoUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => const Icon(Icons.store),
                ),
              ),
              title: Text(shop.name),
              subtitle: Row(
                children: [
                  RatingBarIndicator(
                    rating: shop.rating,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 16.0,
                  ),
                  const SizedBox(width: 8),
                  Text(shop.rating.toStringAsFixed(1)),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
