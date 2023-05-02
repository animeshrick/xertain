import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xertain/module/image_genarator/vm/image_generator_vm.dart';
import 'package:xertain/resources/components/custom_image_widget.dart';
import 'package:xertain/resources/components/popup_items.dart';
import 'package:xertain/resources/text/custom_textStyle.dart';
import 'package:xertain/utils/my_sized_box.dart';

class ImageGeneratorUi extends StatelessWidget {
  ImageGeneratorVm imageGeneratorVm = ImageGeneratorVm();
  TextEditingController searchImageTextCtrl = TextEditingController();
  List<String> size = ['100x100','512x512','1024x1024'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.placeholderText,
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Open AI Image Generator'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CupertinoSearchTextField(
                  controller: searchImageTextCtrl,
                  placeholder: 'Search Your Image',
                  style: const TextStyle(color: CupertinoColors.black),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: CupertinoColors.white,
                      border: Border.all(color: CupertinoColors.systemGrey)),
                  placeholderStyle: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                          color: CupertinoColors.placeholderText,
                          fontStyle: FontStyle.italic)),
              10.ph,
              Theme(
                data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                    disabledColor: Colors.blue
                ),
                child: Row(
                  children: [
                    customText("Image Size: ", Colors.white, 14),
                    RadioMenuButton(
                        value: size[0],
                        groupValue: 'a',
                        onChanged: (v) {                        },
                        child: customText('Small', Colors.white, 12)),
                    RadioMenuButton(
                        value: size[1],
                        groupValue: '512x512',
                        onChanged: (v) {},
                        child: customText('Medium', Colors.white, 12)),
                    RadioMenuButton(
                        value: size[2],
                        groupValue: '0',
                        onChanged: (v) {},
                        child: customText('Large', Colors.white, 12)),
                  ],
                ),
              ),
              10.ph,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.search,
                        size: 28,
                        color: CupertinoColors.white,
                      ),
                      10.pw,
                      customText('Search', Colors.white, 16)
                    ],
                  ),
                  onPressed: () {
                    if (searchImageTextCtrl.text.trim().isEmpty) {
                      PopUpItems().showWarning(context);
                    } else {
                      imageGeneratorVm.imageGeneratorVm(
                          imageSize: '512x512',
                          userInput: searchImageTextCtrl.text.toString());
                    }
                  },
                ),
              ),
              35.ph,
              ChangeNotifierProvider<ImageGeneratorVm>.value(
                value: imageGeneratorVm,
                child: Consumer<ImageGeneratorVm>(builder: (context, image, _) {
                  return image.imageValue.data == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CupertinoActivityIndicator(
                                radius: 15.0,
                                color: CupertinoColors.activeBlue),
                            15.ph,
                            customText(
                                'Waiting for user input', Colors.white, 18),
                          ],
                        )
                      : Column(
                          children: [
                            CustomImageView(url: image.imageValue.data!.image),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CupertinoButton.filled(
                                    child: customText(
                                        "Download", Colors.white, 14),
                                    onPressed: () async {},
                                  ),
                                ),
                                // CustomShareButton(text: 'text'),
                                CupertinoButton(
                                  child: const Icon(CupertinoIcons.share),
                                  onPressed: () {
                                    Share.share('Open-AI API Driven App',
                                        subject: 'Xertain');
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
