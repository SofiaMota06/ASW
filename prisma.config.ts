

import 'dotenv/config';
import { defineConfig, env } from '@prisma/config';
// SE DER ERRO NO  '@prisma/config'  É NECESSÁRIO INSTALAR O NODE!!! (https://nodejs.org/en/download) e dps no terminal --> npx prisma migrate dev --name init_tabelas
export default defineConfig({
  datasource: {
    // Aponta para o url da nossa base de dados PostgreSQL usando o ajudante "env"
    url: env('DATABASE_URL'),
  },
});