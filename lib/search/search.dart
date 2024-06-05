import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class ChannelSearch {
  final String name;
  final String url;
  final String imageUrl;
  ChannelSearch(this.name, this.url, this.imageUrl);
}

List<ChannelSearch> channelSearch = [];

Future mechanisimToSearch(BuildContext context) {
  return showSearch(
      context: context,
      delegate: SearchPage(
          barTheme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white.withOpacity(0.8)),
              ),
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.white.withOpacity(0.8),
                    size: 20,
                  ),
                  backgroundColor: Theme.of(context).primaryColor)),
          searchStyle: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white.withOpacity(0.8)),
          searchLabel: "Channel name",
          failure: Center(
              child: Text(
            "No result !",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          builder: (channelSearch) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    channelSearch.imageUrl,
                    fit: BoxFit.contain,
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(channelSearch.name,
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
          filter: (channelSearch) => [
                channelSearch.name,
              ],
          items: channelSearch));
}