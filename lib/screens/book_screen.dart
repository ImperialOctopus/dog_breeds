import 'package:dog_breeds/components/book/mobile_book.dart';
import 'package:dog_breeds/components/book/web_book.dart';
import 'package:dog_breeds/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  final BookData book;

  const BookScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildPlatform(context),
        //child: _buildMobile(context),
      ),
    );
  }

  Widget _buildPlatform(BuildContext context) {
    if (kIsWeb) {
      return _buildWeb(context);
    }
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return _buildMobile(context);
      default:
        throw FallThroughError();
    }
  }

  Widget _buildWeb(BuildContext context) {
    return WebBook(
      startingBookmark: Bookmark.firstPage(book: book),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return MobileBook(
      startingBookmark: Bookmark.firstPage(book: book),
    );
  }
}
