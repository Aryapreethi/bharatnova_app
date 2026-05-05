import 'package:bharatnova_app/presentation/screens/widgets/post_card.dart';
import 'package:bharatnova_app/presentation/screens/widgets/post_shimmer.dart';
import 'package:bharatnova_app/providers/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feed_error_widget.dart';

Widget buildPostFeed() {
  return Consumer<FeedProvider>(
    builder: (context, feedProvider, _) {
      if (feedProvider.state == FeedState.loading) {
        return const PostShimmer();
      }

      if (feedProvider.state == FeedState.error) {
        return FeedErrorWidget(
          errorType: feedProvider.errorType,
          onRetry: () => feedProvider.fetchPosts(),
        );
      }

      return RefreshIndicator(
        onRefresh: () => feedProvider.refresh(),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent * 0.8) {
              feedProvider.fetchMorePosts();
            }
            return false;
          },
          child: ListView.builder(
            itemCount: feedProvider.posts.length + 1,
            itemBuilder: (context, index) {
              if (index == feedProvider.posts.length) {
                if (feedProvider.isFetchingMore) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (!feedProvider.hasMore) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'No more posts',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }
              return PostCard(post: feedProvider.posts[index]);
            },
          ),
        ),
      );
    },
  );
}
