import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/views/image_view.dart';

Widget brandName() {
  return RichText(
      text: TextSpan(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          children: [
        TextSpan(
            text: "Wallpaper",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        TextSpan(
            text: "HUB",
            style: TextStyle(
              color: Colors.purpleAccent[700],
              fontWeight: FontWeight.bold,
            ))
      ]));
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((e) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(imgUrl: e.src.portrait)));
          },
          child: Hero(
            tag: e.src.portrait,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FadeInImage.assetNetwork(
                  placeholder: 'lib/assets/loading.gif',
                  image: e.src.portrait,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
