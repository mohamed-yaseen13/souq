import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:souq/core/services/location_service.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  // ignore: unused_field
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    _loadUserLocation();
  }

  Future<void> _loadUserLocation() async {
    try {
      final position = await LocationService.getCurrentLocation();
      setState(() {
        _currentLatLng = LatLng(position.latitude, position.longitude);
      });
      await _getAddressFromLatLng(_currentLatLng!);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> _getAddressFromLatLng(LatLng pos) async {
    final placemarks = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
    );
    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      setState(() {
        _currentAddress =
            "${place.street}, ${place.locality}, ${place.administrativeArea}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Address")),
      body: _currentLatLng == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLatLng!,
                      zoom: 15,
                    ),
                    onMapCreated: (controller) => _mapController = controller,
                    markers: {
                      Marker(
                        markerId: const MarkerId("selectedLocation"),
                        position: _currentLatLng!,
                        draggable: true,
                        onDragEnd: (newPos) async {
                          setState(() => _currentLatLng = newPos);
                          await _getAddressFromLatLng(newPos);
                        },
                      ),
                    },
                    onTap: (newPos) async {
                      setState(() => _currentLatLng = newPos);
                      await _getAddressFromLatLng(newPos);
                    },
                  ),
                ),
                if (_currentAddress != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _currentAddress!,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save Address"),
                  ),
                ),
              ],
            ),
    );
  }
}
