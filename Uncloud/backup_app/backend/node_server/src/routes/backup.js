import { Router } from 'express';
import multer from 'multer';
import { getDb } from '../db.js';

const router = Router();
const upload = multer({ dest: 'uploads/' });

router.post('/register', (req, res) => {
  const { userId, phone } = req.body;
  if (!userId || !phone) {
    return res.status(400).json({ error: 'userId and phone required' });
  }
  res.json({ ok: true, userId });
});

router.get('/history/:userId', (req, res) => {
  const db = getDb();
  const backups = db.prepare(
    'SELECT * FROM backups WHERE user_id = ? ORDER BY backup_date DESC'
  ).all(req.params.userId);
  res.json(backups);
});

router.post('/record', (req, res) => {
  const { userId, messageId, fileName, fileSize } = req.body;
  const db = getDb();
  db.prepare(
    'INSERT INTO backups (user_id, message_id, file_name, file_size) VALUES (?, ?, ?, ?)'
  ).run(userId, messageId || null, fileName, fileSize || 0);
  res.json({ ok: true });
});

router.delete('/:backupId', (req, res) => {
  const db = getDb();
  db.prepare('DELETE FROM backups WHERE id = ?').run(req.params.backupId);
  res.json({ ok: true });
});

export const backupRoutes = router;
