import 'package:flutter_arc/data/datasources/fakeapi_datasource/fakeapi.dart';
import 'package:flutter_arc/data/models/address_model.dart';
import 'package:flutter_arc/data/models/image_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressProvider = FutureProvider<List<AddressModel>>((ref) async {
  final api = FakeApi();

  final addresses = await api.getAddresses();

  if (addresses.isEmpty) {
    throw Exception('No users found'); // 👈 Throws error intentionally
  }

  return addresses;
});

final imagesProvider = FutureProvider<List<ImageModel>>((ref) async {
  final api = FakeApi();

  final images = await api.getImages();

  return images;
});
