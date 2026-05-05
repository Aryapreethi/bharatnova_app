import 'package:flutter/material.dart';
import '../../../providers/feed_provider.dart';


class FeedErrorWidget extends StatelessWidget {
  final ErrorType errorType;
  final VoidCallback onRetry;

  const FeedErrorWidget({
    super.key,
    required this.errorType,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              _getIcon(),
              size: 80,
              color: Colors.grey[400],
            ),

            const SizedBox(height: 16),


            Text(
              _getTitle(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              _getSubtitle(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (errorType) {
      case ErrorType.network:
        return Icons.wifi_off_rounded;
      case ErrorType.server:
        return Icons.cloud_off_rounded;
      case ErrorType.unknown:
        return Icons.error_outline_rounded;
    }
  }

  String _getTitle() {
    switch (errorType) {
      case ErrorType.network:
        return 'No Internet Connection';
      case ErrorType.server:
        return 'Server Error';
      case ErrorType.unknown:
        return 'Something Went Wrong';
    }
  }

  String _getSubtitle() {
    switch (errorType) {
      case ErrorType.network:
        return 'Please check your connection and try again';
      case ErrorType.server:
        return 'Our servers are having issues. Please try again later';
      case ErrorType.unknown:
        return 'An unexpected error occurred. Please try again';
    }
  }
}