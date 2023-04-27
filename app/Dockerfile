# Utiliser une image de base contenant un serveur Apache
FROM httpd:latest

# Copier les fichiers de configuration Apache dans le conteneur
COPY ./apache-config/httpd.conf /usr/local/apache2/conf/httpd.conf

# Exposer le port 80 pour le serveur web
EXPOSE 80

# Démarrer le serveur Apache au lancement du conteneur
CMD ["httpd-foreground"]
