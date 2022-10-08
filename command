2  docker swarm init
    3  apt update
    4  apt install docker.io -y
    5  clear
    6  docker swarm init
    7  docker node ls
    8  clear
    9  docker node ls
   10  docker node rm Worker01
   11  docker node ls
   12  clear
   13  docker swarm join-token worker
   14  docker node ls
   15  clear
   16  history
   17  docker node inspect Worker01
   18  clear
   19  docker service create  --name=viz --publish=8080:8080/tcp  --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock dockersamples/visualizer
   20  docker service --help
   21  clear
   22  docker ps
   23  docker service create --name webserver --replicas 1 --publish 80:80 -d nginx
   24  docker service ls
   25  docker ps
   26  clear
   27  docker service ls
   28  docker service ps webservice
   29  docker service ls
   30  docker service ps  webserver
   31  docker service ls
   32  docker service ps  webserver
   33  docker service scale webserver=5
   34  docker service ls
   35  docker service ps  webserver
   36  docker service scale webserver=3
   37  docker service rm webserver
   38  docker service create --name webservice -d --mode=global --publish=80:80 nginx
   39  docker service scale webserver=2
   40  docker service rm webservice
   41  docker service create --name webservice -d --constraint="node.role==manager" --publish=80:80 nginx
   42  docker service scale webserver=3
   43  docker service scale webservice=3
   44  docker service scale webservice=5
   45  docker service scale webservice=3
   46  docker service rm webservice
   47  docker service scale webservice=5
   48  docker service rm webservice
   49* 
   50  docker node update --label-add="webserver=true" worker01
   51  docker node update --label-add="env=prod" Worker01
   52  docker service create --name webservice -d --constraint="node.labels.env==prod" --publish 80:80 nginx
   53  docker service scale webservice=5
   54  docker service scale webservice=3
   55  docker service scale webservice=1
   56  docker service create --name redis --replicas 5 --update-delay 10s redis:3.0.6
   57  docker service rm webservice
   58  docker service ls
   59  docker service ps redis
   60  docker service update redis --image redis:3.0.7
   61  docker service update redis --image redis:21
   62  docker service ls
   63  docker service ps redis
   64  docker service rollback redis
   65  docker service rm redis
   66  ls
   67  mkdir mydb
   68  cd mydb/
   69  vim stack.yml
   70  mv stack.yml docker-compose.yml
   71  ls
   72  cat docker-compose.yml 
   73  clear
   74  ls
   75  cp docker-compose.yml stack.yml
   76  ls
   77  cd ..
   78  mv mydb/stack.yml .
   79  ls
   80  docker stack deploy -c stack.yml mystack
   81  docker service ls
   82  docker stack ls
   83  docker stack services mystack
   84  docker service ps mystack_db
   85  clear
   86  docker stack services mystack
   87  docker service ps mystack_db
   88  docker service ps mystack_wordpress
   89  docker network ls
   90  docker service scale=3
   91  docker service scale=3 mystack
   92  history
   93  docker service scale mystack=3
   94  docker service ls
   95  docker service scale mystack_db=3
   96  docker service scale mystack_wordpress=2
   97  docker stack rm mystack
   98  docker stack ls
   99  docker service ls
  100  docker network ls
  101  clear
  102  ls /var/lib/docker/
  103  cd /var/lib/docker/
  104  ls
  105  cd swarm/
  106  ls
  107  cd ..
  108  tar -zcvf swarm.tar.gz swarm/
  109  docker node ls
  110  ls
  111  rm -ifr swarm
  112  ls
  113  systemctl stop docker
  114  systemctl start docker
  115  docker node ls
  116  systemctl stop docker
  117  ls
  118  rm -fr swarm
  119  ls
  120  tar -xvzf swarm.tar.gz
  121  ls
  122  rm ifr swarm.tar.gz 
  123  rm -ifr swarm.tar.gz 
  124  ls
  125  systemctl start docker
  126  docker node ls
