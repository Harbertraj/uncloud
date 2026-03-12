import 'express' from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { backupRoutes } from './routes/backup.js';
import { initDb } from './db.js';

dotenv.config();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

initDb();

app.get('/health', (_, res) => res.json({ status: 'ok' }));
app.use('/api/backup', backupRoutes);

app.listen(PORT, () => {
  console.log(`Uncloud backend running on http://localhost:${PORT}`);
});
