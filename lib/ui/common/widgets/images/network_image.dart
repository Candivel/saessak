import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class NetworkImage extends StatelessWidget {
  const NetworkImage(
    this.url, {
    Key? key,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String url;
  final BoxFit fit;

  @override
  Widget build(final BuildContext context) {
    var secureUrl = url;
    if (url.contains('http://')) {
      secureUrl = secureUrl.replaceAll('http://', 'https://');
    }
    return CachedNetworkImage(imageUrl: secureUrl, fit: fit);
  }
}
