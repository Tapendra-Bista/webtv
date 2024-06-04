import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:webtv/play/play.dart';
import 'package:webtv/provider/provider.dart';

class ChannelSearch {
  final String name;
  final String url;
  final String imageUrl;
  ChannelSearch(this.name, this.url, this.imageUrl);
}

List<ChannelSearch> channelSearch = [];

Future mechanisimToSearch(context) {
  return showSearch(
      context: context,
      delegate: SearchPage(
          searchStyle: Theme.of(context).textTheme.headlineMedium,
          searchLabel: "channel name",
          failure: Center(
              child: Text(
            "No result !",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          builder: (t) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Play.routeName);
                  context
                      .read<ChannelProvider>()
                      .updated(channelurl: t.url, channelname: t.name);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      t.imageUrl,
                      fit: BoxFit.contain,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(t.name,
                        style: Theme.of(context).textTheme.headlineMedium)
                  ],
                ),
              ),
          filter: (t) => [t.name],
          items: channelSearch));
}
