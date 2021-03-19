# Install Airflow on Docker
Instalasi airflow bisa dengan mudah menggunakan docker. Instalasi dengan docker juga bisa menggunakan cara instalasi secara langsung maupun menggunakan docker compose. Source yang bisa digunakan yaitu
1. https://github.com/puckel/docker-airflow/
2. https://github.com/apache/airflow

## Compose file v1 (Apache)
Kita bisa memilih akan memakai compose dari apache atau puckle.

1. Apache : https://airflow.apache.org/docs/apache-airflow/stable/docker-compose.yaml
2. Puckle : https://github.com/puckel/docker-airflow/blob/master/docker-compose-LocalExecutor.yml

## Langkah
1. Download file compose (.yml) (terserah dari apache atau dari puckle) dan letakkan di suatu directory misal di C:Users\LENOVO\Documents\Airflow
2. Pada folder Airflow tersebut buatlah tiga sub folder yaitu dags, logs, plugins
3. Open terminal (CMD) dan ketikkan docker-compose up


## Refference
1. https://www.metabase.com/docs/latest/operations-guide/running-metabase-on-docker.html

