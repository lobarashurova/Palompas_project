import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/extensions/widget_extensions.dart';

class ProductItem extends StatefulWidget {
  ProductItem({super.key, required this.onPressed, required this.title});

  final String title;
  final Function onPressed;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isPressed) {
          widget.onPressed.call();
        }
        setState(() {
          isPressed = true;
        });
      },
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10, top: 10),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: context.colors.onPrimary,
            border: Border.all(color: context.colors.display, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        width: 75,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://avatars.mds.yandex.net/i?id=c6aee0a9453e386d721ce1c1b3914515_l-4238614-images-thumbs&n=13",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.red, BlendMode.colorBurn)),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    16.kw,
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: widget.title.s(15).w(400).c(context.colors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 4,
                  right: 4,
                  child: "12 \$".s(12).w(600).c(context.colors.lightBlue))
            ],
          ),
        ),
      ),
    );
  }
}
