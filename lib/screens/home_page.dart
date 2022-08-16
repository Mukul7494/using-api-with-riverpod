import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_course/model/photo_model.dart';
import 'package:udemy_course/state/state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<PhotoModel>> photos = ref.watch(photoStateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Fetching API")),
      body: photos.when(
          data: (photos) {
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: photos.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 85,
                      // width: 0,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              photos[index].thumbnailUrl.toString()),
                        ),
                        title: Text("${photos[index].title}"),
                      ),
                    ))
                  ],
                );
              },
            );
          },
          error: (err, stack) => Center(
                child: Text("${err.toString()}"),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
