import Database from 'better-sqlite3';
import { mkdirSync, existsSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const dbPath = join(__dirname, '..', 'data', 'uncloud.db');

let db;

export function initDb() {
  const dataDir = join(__dirname, '..', 'data');
  if (!existsSync(dataDir)) mkdirSync(dataDir, { recursive: true });

  db = new Database(dbPath);
  db.exec(`
    CREATE TABLE IF NOT EXISTS backups (
      id INTEGER PRIMARY KEY,
      user_id TEXT NOT NULL,
      message_id INTEGER,
      file_name TEXT,
      file_size INTEGER,
      backup_date DATETIME DEFAULT CURRENT_TIMESTAMP
    );
  `);
  return db;
}

export function getDb() {
  return db;
}
