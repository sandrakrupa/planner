import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();


  ImageCubit() : super(ImageState());

  Future<void> pickAndUploadImage(String uid) async {
    final PickedFile? pickedFile =
        (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile?;

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      const String fileName = 'image.jpg';
      final Reference storageRef =
          _storage.ref().child('users/$uid/images/$fileName');

      // try {
      //   final UploadTask uploadTask = storageRef.putFile(imageFile);
      //   await uploadTask.whenComplete(() {
      //     _logger.i('Image uploaded successfully');
      //   });
      // } catch (e, stackTrace) {
      //   _logger.e('Error uploading image', e, stackTrace);
      // }
    }
  }
}
