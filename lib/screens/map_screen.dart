// Tampilan utama peta dengan marker coffee shop
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/coffee_shop_provider.dart';
import '../models/coffee_shop.dart';
import '../widgets/coffee_shop_bottom_sheet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  CoffeeShop? _selectedShop;

  @override
  void initState() {
    super.initState();
    Provider.of<CoffeeShopProvider>(context, listen: false).loadShops();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeShopProvider>(context);
    return Scaffold(
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-7.3201, 110.1623),
                    zoom: 13,
                  ),
                  markers: provider.shops
                      .map(
                        (shop) => Marker(
                          markerId: MarkerId(shop.id.toString()),
                          position: LatLng(shop.lat, shop.lng),
                          infoWindow: InfoWindow(title: shop.name),
                          onTap: () {
                            setState(() {
                              _selectedShop = shop;
                            });
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => CoffeeShopBottomSheet(shop: shop),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toSet(),
                  onMapCreated: (controller) => _mapController = controller,
                ),
                // Card akun pengguna mengambang di atas map
                Positioned(
                  top: 32,
                  left: 16,
                  right: 16,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
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
              ],
            ),
    );
  }
}
