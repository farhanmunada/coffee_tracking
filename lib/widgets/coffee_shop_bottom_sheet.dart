// BottomSheet untuk detail coffee shop
import 'package:flutter/material.dart';
import '../models/coffee_shop.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CoffeeShopBottomSheet extends StatelessWidget {
  final CoffeeShop shop;
  const CoffeeShopBottomSheet({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    try {
      // Cek data utama
      if (shop.name.isEmpty || shop.address.isEmpty) {
        return _errorWidget('Data coffee shop tidak lengkap.');
      }
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: shop.photoUrl.isNotEmpty
                          ? Image.network(
                              shop.photoUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.broken_image,
                                    size: 80,
                                    color: Colors.grey,
                                  ),
                            )
                          : const Icon(
                              Icons.broken_image,
                              size: 80,
                              color: Colors.grey,
                            ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shop.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            shop.address,
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Jam buka: ${shop.openHours}',
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Kontak: ${shop.contact}',
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: shop.rating,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 24.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(width: 8),
                  Text(shop.rating.toStringAsFixed(1)),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Komentar Pengunjung:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (shop.comments.isEmpty)
                const Text('Belum ada komentar.')
              else
                ...shop.comments.map(
                  (c) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      c.user.isNotEmpty ? c.user : 'Anonim',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(c.comment.isNotEmpty ? c.comment : '-'),
                    trailing: RatingBarIndicator(
                      rating: c.rating.toDouble(),
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 16.0,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    } catch (e) {
      return _errorWidget('Terjadi error: $e');
    }
  }

  Widget _errorWidget(String message) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            Text(message, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
