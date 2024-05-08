import 'package:animaru/domain/anime_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required this.anime,
    super.key,
  });

  final Anime anime;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final controller = WebViewController();

  @override
  void initState() {
    if (widget.anime.trailer != null) {
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(
          Uri.parse(widget.anime.trailer!),
        );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.heart_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.anime.images.jpg.largeImageUrl,
                placeholder: (context, url) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Center(
                  child: Hero(
                    tag: widget.anime.title,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.33,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Center(
                child: Text(
                  widget.anime.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              if (widget.anime.status != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.ellipse,
                      color: widget.anime.airing ? Colors.green : Colors.red,
                      size: 8,
                    ),
                    const Gap(4),
                    Text(
                      widget.anime.status!,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(16),
                  ],
                ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.star),
                        Text(
                          widget.anime.score != null ? '${widget.anime.score!.toStringAsFixed(1)}/10' : 'Unknown',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.heart),
                        Text(widget.anime.favorites.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.analytics),
                        Text(widget.anime.popularity.toString()),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.calendar),
                        Text(widget.anime.aired.string),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.tv),
                        Text(
                          widget.anime.episodes != null ? '${widget.anime.episodes} eps' : 'Unknown',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.time),
                        Text(
                          widget.anime.duration?.replaceAll(' per ep', '') ?? 'Unknown',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Text(
                'Alternative titles:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(8),
              Text(
                'English: ${widget.anime.titleEnglish ?? 'Unknown'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Japanese: ${widget.anime.titleJapanese ?? 'Unknown'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider(),
              if (widget.anime.trailer != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trailer:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Gap(8),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: WebViewWidget(controller: controller),
                    ),
                    const Divider(),
                  ],
                ),
              Text(
                'Synopsis:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(8),
              Text(widget.anime.synopsis ?? 'Unknown'),
              const Divider(),
              Text(
                'Background:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(8),
              Text(widget.anime.background ?? 'Unknown'),
            ],
          ),
        ),
      ),
    );
  }
}
