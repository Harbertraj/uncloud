# TDLib Setup

This folder is for TDLib shared library binaries.

## Flutter (Android)
- TDLib is bundled via the `tdlib` pub package
- No manual setup needed for Android

## Node.js Backend
- Use `prebuilt-tdlib` npm package (auto-downloads binaries)
- Or download from: https://github.com/niclaw/tdlib/releases

## Getting Telegram API credentials
1. Go to https://my.telegram.org
2. Login with your phone number
3. Create new application
4. Copy `api_id` and `api_hash`
5. Add to `.env` (backend) and Flutter config
