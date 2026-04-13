import { defineConfig } from '@prisma/config';
import * as dotenv from 'dotenv';
// SE DER ERRO NO  '@prisma/config'  É NECESSÁRIO INSTALAR O NODE!!! (https://nodejs.org/en/download)

// Carrega as variáveis do ficheiro .env
dotenv.config();

export default defineConfig({
  migrate: {
    // Aponta para o url da nossa base de dados PostgreSQL
    url: process.env.DATABASE_URL,
  },
});