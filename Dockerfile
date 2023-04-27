# Utilisez une image officielle de PHP Apache
FROM php:7.4-apache

# Copiez les fichiers de l'application dans le répertoire de travail de l'application
COPY ./app /var/www/html/

# Installez les extensions PHP nécessaires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Configurez Apache pour qu'il utilise le répertoire de travail de l'application comme document root
RUN sed -i 's/\/var\/www\/html/\/var\/www\/html\/public/g' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/\/var\/www\/html/\/var\/www\/html\/public/g' /etc/apache2/sites-available/default-ssl.conf

# Activez le module rewrite d'Apache
RUN a2enmod rewrite

# Exposez le port 80 pour accéder au serveur web
EXPOSE 80
