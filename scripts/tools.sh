 #!/bin/bash

# Instalação do Apache
echo "Installing some tools..."
echo -e "\tApache"
sudo apt-get install apache2 &> .log

# Modificação da permissão de uma das pastas
sudo chmod -R 765 /var/www/html

# Configuração do Apache
sudo a2enmod rewrite
sudo cp $FILES_FOLDER/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

# Solicitação de reinício da aplicação do Apache
sudo service apache2 restart

# Instalação do PHP
echo -e "\tPHP"
sudo apt-get install php7.0 php7.0-fpm libapache2-mod-php7.0 php7.0-mysql &> .log

# Instalação do MySQL
echo -e "\tMySQL"
sudo apt-get install mysql-client mysql-server &> .log

# Instalação do phpMyAdmin
echo -e "\tphpMyAdmin"
sudo apt-get install phpmyadmin &> .log

# Configuração do phpMyAdmin
sudo cp $FILES_FOLDER/apache/apache2.conf /etc/apache2/apache2.conf
sudo cp $FILES_FOLDER/phpmyadmin/config.inc.php /etc/phpmyadmin/config.inc.php
