### STAGE 1: Build ###
# Étape 1 : Utiliser une image de base légère avec Node.js
FROM node:12.7-alpine AS build

# Étape 2 : Définir le répertoire de travail
WORKDIR /usr/src/app

# Étape 3 : Copier les fichiers package.json et package-lock.json
COPY package.json package-lock.json ./

# Étape 4 : Installer les dépendances
RUN npm install

# Étape 5 : Copier tous les fichiers du projet Angular
COPY . .

# Étape 6 : Compiler le projet Angular
RUN npm run build
### STAGE 2: Serve ###
# Étape 1 : Utiliser une image Nginx comme base
FROM nginx:alpine

# Étape 2 : Copier les fichiers compilés depuis le stage "build"
COPY --from=build /usr/src/app/dist/aston-villa-app /usr/share/nginx/html

# Étape 3 : Exposer le port 80 pour l'accès HTTP
EXPOSE 80

# Étape 4 : Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]


