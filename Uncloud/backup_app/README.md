# Uncloud Backup

Unlimited backup app — photos, videos, files, and apps to Telegram Saved Messages.

## Features

- **Unlimited storage** — Uses your Telegram Saved Messages (or private channel)
- **Backup anything** — Photos, videos, documents, APKs
- **Compress + Encrypt** — Reduces size, optional password protection
- **Deletable** — Remove old backups anytime
- **Minimal UI** — Clean, feature-rich interface

## Architecture

```
backup_app/
├── mobile/flutter_app/    # Flutter frontend (Dart)
├── backend/node_server/   # Node.js API (optional metadata/index)
└── tdlib/                 # TDLib setup notes
```

## Quick Start

### 1. Get Telegram API credentials

1. Go to [my.telegram.org](https://my.telegram.org)
2. Login with your phone
3. Create application → Copy `api_id` and `api_hash`

### 2. Flutter app

```bash
cd mobile/flutter_app
flutter pub get
# Add API credentials to lib/config/telegram_config.dart (create from example)
flutter run
```

### 3. Backend (optional)

```bash
cd backend/node_server
npm install
cp .env.example .env
# Edit .env with API_ID and API_HASH
npm run dev
```

## Screens

1. **Login** — Phone number → Telegram auth
2. **Dashboard** — Quick backup/restore, storage overview
3. **Select Files** — Choose: Photos / Videos / Files / Apps
4. **Backup Progress** — Compress → Encrypt → Upload
5. **Restore** — Download from Saved Messages
6. **Settings** — Auto backup, encryption, delete backups

## Tech Stack

| Layer    | Technology  |
|----------|-------------|
| Frontend | Flutter     |
| Backend  | Node.js     |
| Telegram | TDLib       |
| Database | SQLite      |
| Storage  | Saved Messages / Private Channel |

## TDLib Setup

- **Flutter**: Uses `tdlib` pub package (Android included)
- **Node.js**: Use `tdl` + `prebuilt-tdlib` for desktop proxy (optional)

## License

MIT
