class AppStrings {
  AppStrings._();

  // -- Splash --
  static const splashTitle = {'id': 'Jelajahi Dewamu', 'en': 'Realm of the Gods'};
  static const splashSubtitle = {
    'id': 'Kisah para dewa & legenda dari seluruh penjuru dunia',
    'en': 'Journey through the ancient myths and epic sagas of humanity'
  };
  static const splashEnter = {'id': 'MASUK', 'en': 'ENTER'};

  // -- Home --
  static const homeTitle = 'MYTHARIUM';
  static const homeSubtitle = {'id': 'Jelajahi mitologi dunia', 'en': 'Explore world mythologies'};
  static const searchHint = {'id': 'Cari nama dewa, kekuatan...', 'en': 'Search god name, powers...'};
  static const resultCount = {'id': 'dewa', 'en': 'gods'};
  static const emptyTitle = {'id': 'Tidak ada dewa ditemukan', 'en': 'No gods found'};
  static const emptySubtitle = {'id': 'Coba kata kunci lain', 'en': 'Try another keyword'};

  // -- Filter chips --
  static const filterAll = 'All';

  // -- Detail --
  static const sectionPowers = {'id': 'Kekuatan', 'en': 'Powers'};
  static const sectionStory = {'id': 'Kisah', 'en': 'Story'};
  static const bookmarkSave = {'id': 'Simpan', 'en': 'Save'};
  static const bookmarkActive = {'id': 'Favorit', 'en': 'Favorited'};
  static const bookmarkAdded = {'id': 'ditambahkan ke favorit', 'en': 'added to favorites'};
  static const bookmarkRemoved = {'id': 'dihapus dari favorit', 'en': 'removed from favorites'};

  // -- God Card --
  static const learnMore = {'id': 'Pelajari', 'en': 'Learn More'};

  // -- Bookmark Screen --
  static const bookmarks = {'id': 'Favorit', 'en': 'Bookmarks'};
  static const emptyBookmarks = {'id': 'Belum ada favorit', 'en': 'No bookmarks yet'};
  static const emptyBookmarksSub = {'id': 'Tap ikon ❤️ di detail dewa untuk menyimpan', 'en': 'Tap the ❤️ icon on a god detail to save'};

  // -- Language --
  static const langLabel = {'id': 'Bahasa Indonesia', 'en': 'English'};

  static String get(String key, String lang) {
    final map = _all[key];
    return map?[lang] ?? key;
  }

  static final Map<String, Map<String, String>> _all = {
    'splashTitle': splashTitle,
    'splashSubtitle': splashSubtitle,
    'splashEnter': splashEnter,
    'homeSubtitle': homeSubtitle,
    'searchHint': searchHint,
    'resultCount': resultCount,
    'emptyTitle': emptyTitle,
    'emptySubtitle': emptySubtitle,
    'sectionPowers': sectionPowers,
    'sectionStory': sectionStory,
    'bookmarkSave': bookmarkSave,
    'bookmarkActive': bookmarkActive,
    'bookmarkAdded': bookmarkAdded,
    'bookmarkRemoved': bookmarkRemoved,
    'bookmarks': bookmarks,
    'emptyBookmarks': emptyBookmarks,
    'emptyBookmarksSub': emptyBookmarksSub,
    'learnMore': learnMore,
    'langLabel': langLabel,
  };
}
