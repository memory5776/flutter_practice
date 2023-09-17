import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_loading_images/models/image_gallery_model.dart';

import 'bloc/image_gallery_bloc.dart';

class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({super.key});

  @override
  State<StatefulWidget> createState() => ImageGalleryPageState();
}

class ImageGalleryPageState extends State<ImageGalleryPage> {
  List<ImageGalleryModel> _data = [];
  late ImageGalleryBloc _imageGalleryBloc;

  @override
  void initState() {
    super.initState();
    _imageGalleryBloc = ImageGalleryBloc();
    _imageGalleryBloc.add(LoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _imageGalleryBloc,
      child: BlocConsumer<ImageGalleryBloc, ImageGalleryState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is DataFromLocalState) {
            _data = state.model;
          }
          if (state is DataFromServiceState) {
            _data = state.model;
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: const Text('Back'),
              centerTitle: false,
              // actions: [
              //   if (state is! LoadingState)
              //     Text(state is DataFromLocalState ? 'Local Data' : 'Service Data', textAlign: TextAlign.center,)
              // ],
            ),
            body: SafeArea(
              child: (state is LoadingState)
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: _data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4
                      ),
                      itemBuilder: (_, index) {
                        return Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.network(_data.elementAt(index).thumbnailUrl),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_data.elementAt(index).id.toString()),
                                Text(_data.elementAt(index).title, overflow: TextOverflow.ellipsis,),
                              ],
                            )
                          ],
                        );
                      }
                  )
            ),
          );
        })
      );
  }

}