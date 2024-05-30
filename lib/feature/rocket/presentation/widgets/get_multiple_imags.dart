import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GetMultipleImages extends StatefulWidget {
  const GetMultipleImages({
    super.key,
    required this.imageFilesUrl,
  });

  final List<dynamic> imageFilesUrl;

  @override
  State<GetMultipleImages> createState() => _GetMultipleImagesState();
}

class _GetMultipleImagesState extends State<GetMultipleImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (int i = 0; i < widget.imageFilesUrl.length; i++)
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageFilesUrl[i].toString(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
