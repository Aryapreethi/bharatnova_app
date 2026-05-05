# BharatNova App

A Flutter news feed application built as part of a development assignment.

## Features Implemented

### Task 1 — UI & Device Features
- UI closely matches the provided Figma design
- Location permission requested on app launch
- Notification permission requested on app launch
- Real-time city location displayed in AppBar using Geolocator
- TabBar with Post, Nova, News, Article tabs
- Bottom navigation bar with FAB button
- Exit confirmation dialog on back press

### Task 2 — API Integration & Feed
- Posts fetched dynamically from [DummyJSON API](https://dummyjson.com/posts)
- Shimmer loading effect while fetching posts
- Error handling with user friendly messages (no internet, server error)
- Pull to refresh functionality
- Infinite scroll pagination (loads 10 posts at a time)
- Read More / Read Less for long post content

## State Management
- Used **Provider** for state management
- Separate providers for Feed and Location

## Project Structure