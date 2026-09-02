# Imagem base leve, baseada em Alpine Linux
FROM node:20-alpine

# Diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copia só os arquivos de manifesto primeiro (otimização de cache)
COPY package*.json ./

# Instala apenas dependências de produção (ignora jest/supertest)
RUN npm install --omit=dev

# Agora copia o restante do código-fonte
COPY . .

# Documenta a porta que a API escuta (bate com PORT=3000 do .env)
EXPOSE 3000

# Comando de inicialização, equivalente ao "npm start"
CMD ["node", "src/server.js"]