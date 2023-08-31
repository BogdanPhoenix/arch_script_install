#!/bin/bash

sudo pacman -S postgresql

sudo -u postgres bash -c "initdb -D /var/lib/postgres/data"

sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin

sudo chown $USER /var/lib/pgadmin
sudo chown $USER /var/log/pgadmin

python3 -m venv /var/lib/pgadmin/pgadmin4
source /var/lib/pgadmin/pgadmin4/bin/activate
pip install pgadmin4

cat << EOF > /home/$USER/pgadminStart.sh
#!/bin/bash
source /var/lib/pgadmin/pgadmin4/bin/activate
pgadmin4
EOF

chmod 744 /home/$USER/pgadminStart.sh

pgadmin4
