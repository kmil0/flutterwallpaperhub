import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black),
      ),
      Text("HUB", style: TextStyle(color: Colors.blue))
    ],
  );
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
            child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              e.src.portrait,
              fit: BoxFit.cover,
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
