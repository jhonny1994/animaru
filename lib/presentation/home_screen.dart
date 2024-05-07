import 'package:animaru/presentation/details_screen.dart';
import 'package:animaru/providers/animes_notifier_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final restClient = ref.watch(animeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        title: const CircleAvatar(
          foregroundImage: CachedNetworkImageProvider(
            'https://banner2.cleanpng.com/20190920/rga/transparent-anime-icon-away-icon-face-icon-5d85657ea3bf81.4172325415690233586707.jpg',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xff131212),
        selectedItemColor: const Color(0xffF06071),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.flame_outline),
            activeIcon: Icon(Ionicons.flame),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.analytics_outline),
            activeIcon: Icon(Ionicons.analytics),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.heart_outline),
            activeIcon: Icon(Ionicons.heart),
            label: 'home',
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: restClient.when(
            data: (data) {
              return ListView(
                children: [
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: data.animes.length,
                    itemBuilder: (context, index) {
                      final anime = data.animes.elementAt(index);
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => DetailsScreen(anime: anime),
                          ),
                        ),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 0.75,
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: anime.images.jpg.imageUrl,
                                    imageBuilder: (context, imageProvider) => Hero(
                                      tag: anime.title,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            topLeft: Radius.circular(8),
                                          ),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (anime.score != null)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          ),
                                          color: const Color(0xffF06071).withOpacity(0.75),
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: Text(
                                          '${anime.score!.toStringAsFixed(1)}/10',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  if (anime.popularity != null)
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          color: const Color(0xffF06071).withOpacity(0.75),
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: Text(
                                          '#${anime.popularity}',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  color: Color(0xffF06071),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Center(
                                  child: Text(
                                    anime.title,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: data.pagination.currentPage != 1
                            ? IconButton(
                                onPressed: () {},
                                icon: const Icon(Ionicons.arrow_back_circle_outline),
                              )
                            : const SizedBox.shrink(),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Page ${data.pagination.currentPage} of ${data.pagination.lastVisiblePage}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Expanded(
                        child: data.pagination.hasNextPage
                            ? IconButton(
                                onPressed: () {},
                                icon: const Icon(Ionicons.arrow_forward_circle),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
