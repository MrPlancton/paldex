part of '../home.dart';

class _PalNews extends StatelessWidget {
  const _PalNews();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        _buildHeader(context),
        _buildNews(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(28, 0, 28, 22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Pokémon News',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNews() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return const NewsCard(
          title: 'Pokémon Rumble Rush Arrives Soon',
          time: '15 May 2019',
          thumbnail: AppImages.thumbnail,
        );
      },
    );
  }
}
