import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_course/model/photo_model.dart';
import 'package:udemy_course/network/fetch_api.dart';

final photoStateProvider = FutureProvider<List<PhotoModel>>((ref) async {
  return fetchPhotos();
});
