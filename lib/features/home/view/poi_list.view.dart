import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/theme/app_colors.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:protect_ua_women/features/home/home.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
import 'package:saferefuge_ui/saferefuge_ui.dart';

class POIListView extends StatefulWidget {
  const POIListView({Key? key}) : super(key: key);

  @override
  State<POIListView> createState() => _POIListViewState();
}

class _POIListViewState extends State<POIListView> {
  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.locationPermissionStatus == LocationPermissionStatus.denied) {
          // open filter screen
        }

        if (state.poisStatus == POIsStatus.success && state.pois.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No POIs found'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          shadowColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: HomeSearchField(
                    onChange: (value) {},
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.grey2,
                    ),
                    hintText: 'What is needed?',
                    cursorColor: AppColors.grey2,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 44,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF1B3284).withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      context.router.push(const FiltersRoute());
                    },
                    icon: const Icon(
                      Icons.tune_sharp,
                      color: AppColors.action,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: const PreferredSize(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 32,
                child: CategoriesList(),
              ),
            ),
            preferredSize: Size.fromHeight(32),
          ),
        ),
        backgroundColor: Colors.white,
        body: const _POIList(),
      ),
    );
  }

  void _onInit() async {
    context.read<AppBloc>().add(const LoadPOIsByCurrentLocation());
  }
}

class _POIList extends StatefulWidget {
  const _POIList({
    Key? key,
  }) : super(key: key);

  @override
  State<_POIList> createState() => _POIListState();
}

class _POIListState extends State<_POIList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.poisStatus == POIsStatus.loading && state.pois.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state.poisStatus == POIsStatus.success && state.pois.isEmpty) {
            return const _NoResults();
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: state.pois.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (BuildContext context, int index) {
              if (index + 1 >= state.pois.length &&
                  state.poisStatus == POIsStatus.loading) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        bottom: index == state.pois.length - 1 ? 16 : 0,
                      ),
                      child: POICard(poi: state.pois[index]),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                );
              }

              return Container(
                margin: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: index == state.pois.length - 1 ? 16 : 0,
                ),
                child: POICard(poi: state.pois[index]),
              );
            },
          );
        },
      ),
    );
  }

  void _onScroll() {
    final int poisCount = context.read<AppBloc>().state.pois.length;
    final bool hasReachedMaximum =
        context.read<AppBloc>().state.poisReachedMaximum;
    if (_isBottom && !hasReachedMaximum) {
      context.read<AppBloc>().add(LoadPOIsByCurrentLocation(skip: poisCount));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nothing found'),
            const SizedBox(height: 16),
            SRElevetedButton(
              onPressed: () {},
              child: const Text('Try again with increased range'),
            ),
          ],
        ),
      ),
    );
  }
}
