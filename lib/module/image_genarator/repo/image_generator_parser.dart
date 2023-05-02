import 'package:xertain/module/image_genarator/model/image_model.dart';

class ImageGeneratorParser {
  imageGen (resp){
    var data = resp['data'];
    ImageModel imageModel = ImageModel();
    for(var i=0;i<data.length;i++){
      imageModel.image = data[i]['url'];
    }
    return imageModel;
  }
}