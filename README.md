# Mytharium

Mytharium is a Flutter app for exploring gods and deities from world mythologies. It combines an encyclopedic god database, narrative mythological history, and interactive quiz and battle features, available in both Indonesian and English.

## Features

### Gods & Goddesses
Browse 171 gods, heroes, monsters, and mythological figures across four mythologies: Greek, Egyptian, Nordic, and Hindu. Each entry has a detailed profile page with an origin story, domain and symbolism, and a signature myth, written in an encyclopedic, multi-paragraph style. Gods can be searched, filtered by category, and bookmarked for quick access later.

### What's Your God?
A personality quiz that matches the user to a god based on birth date, personality, favorite element, and favorite things (multiple selections allowed). The result screen explains, in plain language, why each match was chosen.

### Mythology History
A collection of 37 major mythological events (wars, creation myths, the rise and fall of divine eras) told as book-style, paginated narratives with chapters, a chronology, and a discussion of each event's impact and meaning.

### Mythology Quiz
A trivia quiz mode: pick a mythology genre and answer a set of questions to test your knowledge.

### God Battle
Pick two gods and compare their strengths in a simulated matchup, framed clearly as entertainment rather than a claim about any belief system.

### Other features
- Bilingual interface (Indonesian / English), toggleable at any time
- Bookmarking, persisted locally on the device
- Background music with an in-app mute/unmute control

## Tech stack

- [Flutter](https://flutter.dev) / Dart
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) for local persistence (bookmarks, language, settings)
- [`audioplayers`](https://pub.dev/packages/audioplayers) for background music and sound effects
- [`google_fonts`](https://pub.dev/packages/google_fonts) for mythology-themed typography

## Project structure

```
lib/
  data/       God, history, and quiz content, grouped per mythology
  models/     Data models (God, MythStory, StoryChapter, QuizQuestion, ...)
  screens/    App screens (home, detail, quiz, history, battle, bookmarks, ...)
  services/   Bookmarking, sound, and battle logic
  widgets/    Reusable UI components (god card, music button, ...)
  l10n/       Language provider and localized strings
```

## Getting started

1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Run the app:
   ```
   flutter run
   ```

## Content

All mythological content is written to be accurate and consistent with commonly known, verifiable sources for each tradition (for example Hesiod and Homer for Greek mythology, the Book of the Dead and Pyramid Texts for Egyptian mythology, the Poetic and Prose Eddas for Norse mythology, and the Vedas, Puranas, Ramayana, and Mahabharata for Hindu mythology). Content is presented for educational and entertainment purposes, with respect for the mythologies and belief systems it draws from.
