import 'package:animaru/domain/anime_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    required this.anime,
    super.key,
  });
  final Anime anime;
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
                imageUrl: anime.images.jpg.largeImageUrl,
                placeholder: (context, url) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Center(
                  child: Hero(
                    tag: anime.title,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.33,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                  anime.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              if (anime.status != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.ellipse,
                      color: anime.airing ? Colors.green : Colors.red,
                      size: 8,
                    ),
                    const Gap(4),
                    Text(
                      anime.status!,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(16),
                  ],
                ),
              const Gap(16),
              const Divider(height: 0),
              const Gap(8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.star),
                        Text(
                          anime.score != null ? '${anime.score!.toStringAsFixed(1)}/10' : 'Unknown',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.heart),
                        Text(anime.favorites.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.analytics),
                        Text(anime.popularity.toString()),
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
                        Text(anime.aired.string),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.tv),
                        Text(
                          anime.episodes != null ? '${anime.episodes} eps' : 'Unknown',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Icon(Ionicons.time),
                        Text(
                          anime.duration?.replaceAll(' per ep', '') ?? 'Unknown',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(8),
              const Divider(height: 0),
              const Gap(16),
              Text(
                'Alternative titles:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(8),
              Text(
                'English: ${anime.titleEnglish ?? 'Unknown'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Japanese: ${anime.titleJapanese ?? 'Unknown'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap(8),
              const Divider(height: 0),
              const Gap(16),
              Text(
                'Synopsis:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(8),
              Text(anime.synopsis ?? 'Unknown'),
              const Gap(8),
              const Divider(height: 0),
              const Gap(16),
              Text(
                'Background:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(8),
              Text(anime.background ?? 'Unknown'),
            ],
          ),
        ),
      ),
    );
  }
}
