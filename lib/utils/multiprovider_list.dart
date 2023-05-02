import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:xertain/module/image_genarator/vm/image_generator_vm.dart';

List<SingleChildWidget> multiProviderList = [
  ChangeNotifierProvider.value(value: ImageGeneratorVm()),
];
