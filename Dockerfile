# Utilise une image PHP avec Apache
FROM php:7.4-apache
# Copie les fichiers de l'application web dans le conteneur
COPY . /var/www/html/
# Installe le module PDO pour MySQL
#RUN docker-php-ext-install pdo_mysql
# Copie le fichier SQL d'initialisation dans le conteneur
#COPY init.sql /docker-entrypoint-initdb.d/
# Expose le port 80 pour qu'il soit accessible depuis l'extérieur
EXPOSE 80
