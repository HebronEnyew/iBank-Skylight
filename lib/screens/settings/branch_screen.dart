import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BranchModel {
  final String name;
  final String distance;
  final LatLng location;

  BranchModel({
    required this.name,
    required this.distance,
    required this.location,
  });
}

class BranchScreen extends StatefulWidget {
  const BranchScreen({super.key});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  final List<BranchModel> branches = [
    BranchModel(
      name: "Bank 1656 Union Street",
      distance: "50 m",
      location: const LatLng(40.7700, -74.0200),
    ),
    BranchModel(
      name: "Bank Secaucus",
      distance: "1,2 km",
      location: const LatLng(40.7895, -74.0565),
    ),
    BranchModel(
      name: "Bank 1657 Riverside Drive",
      distance: "5,3 km",
      location: const LatLng(40.8000, -74.0400),
    ),
    BranchModel(
      name: "Bank Rutherford",
      distance: "70m",
      location: const LatLng(40.8260, -74.0760),
    ),
    BranchModel(
      name: "Bank 1656 Union Street",
      distance: "30m",
      location: const LatLng(40.7650, -74.0250),
    ),
  ];

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Branch",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          // OpenStreetMap
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(40.7895, -74.0565),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.yourapp.name',
              ),
              MarkerLayer(
                markers: branches.map((branch) {
                  return Marker(
                    point: branch.location,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Color(0xFF3B3DBF),
                      size: 35,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Handle Bar
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: 45,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Bank",
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        itemCount: branches.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 32),
                        itemBuilder: (context, index) {
                          final branch = branches[index];
                          return InkWell(
                            onTap: () {
                              _mapController.move(branch.location, 15.0);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xFF3B3DBF),
                                  size: 30,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    branch.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ),
                                Text(
                                  branch.distance,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
