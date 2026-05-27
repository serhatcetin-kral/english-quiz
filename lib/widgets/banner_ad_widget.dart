import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {

  const BannerAdWidget({
    super.key,
  });

  @override
  State<BannerAdWidget> createState() =>
      _BannerAdWidgetState();
}

class _BannerAdWidgetState
    extends State<BannerAdWidget> {

  BannerAd? bannerAd;

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    loadAd();
  }

  void loadAd() {

    bannerAd = BannerAd(

      size: AdSize.banner,

      adUnitId:

      Platform.isAndroid

          ? 'ca-app-pub-3940256099942544/6300978111'

          : 'ca-app-pub-6282915034498194/5011195233',

      listener: BannerAdListener(

        onAdLoaded: (_) {

          setState(() {

            isLoaded = true;
          });
        },

        onAdFailedToLoad: (ad, error) {

          ad.dispose();

          print(error);
        },
      ),

      request: const AdRequest(),
    );

    bannerAd!.load();
  }

  @override
  void dispose() {

    bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (!isLoaded || bannerAd == null) {

      return const SizedBox();
    }

    return Container(

      alignment: Alignment.center,

      width: bannerAd!.size.width.toDouble(),

      height: bannerAd!.size.height.toDouble(),

      child: AdWidget(
        ad: bannerAd!,
      ),
    );
  }
}