import 'package:flutter/cupertino.dart';

class TrackItem{
  final Function onTap;
  final Image activeImage;
  final Image inactiveImage;
  final String label;
  final String description;

  TrackItem({this.description, this.onTap, this.activeImage, this.inactiveImage, this.label});
}
