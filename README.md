# Mythera

Mythera is a Flutter app for exploring gods and deities from world mythologies. It combines an encyclopedic god database, narrative mythological history, and interactive quiz and battle features — in Indonesian and English.

## Features

### 🏛️ Gods & Deities
Browse **327 gods, heroes, monsters, and mythological figures** across six mythologies — Greek (73), Egyptian (44), Nordic (41), Hindu (44), Chinese (64), and Japanese (61). Each entry has a full profile with an origin story, domain and symbolism, and a signature myth, written in an encyclopedic, multi-paragraph style. Gods can be searched, browsed by category, and bookmarked for quick access.

### 📖 Mythology Stories
A collection of **58 major mythological events** — wars, creation myths, the rise and fall of divine eras — told as book-style, paginated narratives with chapters, a chronology, and a discussion of each event's impact and meaning. Reading progress is tracked per god and per story.

### 🎬 Mythic Pop Culture
A cross-reference of **48 characters** inspired by world mythology in modern films, games, and pop culture, each linked back to their mythological origin.

### 🔮 What's Your God?
A personality quiz that matches the user to a god based on birth date, personality, favorite element, and favorite things. The result screen explains, in plain language, why each match was chosen.

### 📝 Mythology Trivia
Pick a mythology genre and answer a timed set of trivia questions to test your knowledge.

### ⚔️ God Battle
Pick two gods (or pop-culture characters) and compare their strengths in a simulated, deterministic matchup — grounded in canonical myth outcomes where they exist, and framed as entertainment rather than a claim about any belief system.

### 🏅 Power Tiers
Browse gods ranked by tier, per mythology or across all six at once.

### Other features
- Bilingual interface (Indonesian / English), toggleable at any time
- Google Sign-In, with favorites, reading progress, and settings synced across devices via Firebase
- Daily reminder notifications with a rotating set of curated mythology facts
- Bookmarking and reading history, persisted locally and in the cloud
- Background music with an in-app mute/unmute control
- Animated onboarding for first-time users, with a welcome splash on every return visit

## Tech stack

- [Flutter](https://flutter.dev) / Dart
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) for local persistence (bookmarks, language, settings)
- [`audioplayers`](https://pub.dev/packages/audioplayers) for background music and sound effects
- [`firebase_core`](https://pub.dev/packages/firebase_core), [`firebase_auth`](https://pub.dev/packages/firebase_auth), [`cloud_firestore`](https://pub.dev/packages/cloud_firestore) for authentication and cross-device sync
- [`google_sign_in`](https://pub.dev/packages/google_sign_in) for account sign-in
- [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications) + [`timezone`](https://pub.dev/packages/timezone) for scheduled daily reminders
- Custom bundled fonts (Cinzel, Cinzel Decorative, MedievalSharp, Yatra One) for mythology-themed typography

## Project structure

```
lib/
  data/       God, history, quiz, and pop-culture content, grouped per mythology
  models/     Data models (God, MythStory, StoryChapter, QuizQuestion, ...)
  screens/    App screens (discover, detail, quiz, stories, battle, profile, ...)
  services/   Bookmarking, reading progress, sound, notifications, battle logic,
              auth, and Firestore sync
  widgets/    Reusable UI components (god card, static page scaffold, ...)
  l10n/       Language provider and localized strings
```

## Getting started

1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Add your own Firebase config: create a project in the [Firebase console](https://console.firebase.google.com), enable Authentication (Google Sign-In), Firestore, and Cloud Messaging, then download `google-services.json` into `android/app/`. This file is intentionally excluded from the repo since it's project-specific.
4. Run the app:
   ```
   flutter run
   ```

## Content

All mythological content is written to be accurate and consistent with commonly known, verifiable sources for each tradition — for example Hesiod and Homer for Greek mythology, the Book of the Dead and Pyramid Texts for Egyptian mythology, the Poetic and Prose Eddas for Norse mythology, the Vedas, Puranas, Ramayana, and Mahabharata for Hindu mythology, classical texts like *Journey to the West* and the *Fengshen Yanyi* for Chinese mythology, and the Kojiki and Nihon Shoki for Japanese mythology. Content is presented for educational and entertainment purposes, with respect for the mythologies and belief systems it draws from.
