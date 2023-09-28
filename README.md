# MySQL + PHPMyAdmin docker-compose demo CI/CD pipeline


<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/mysql"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example application and CI/CD pipeline showing how to deploy a MySQL + PhpMyAdmin docker-compose to elestio.


# Once deployed ...

You can connect to your server with any MySQL client with those credentials:

    Host: [CI_CD_DOMAIN]
    Port: 24306
    Login: root
    Password: [SOFTWARE_PASSWORD]

You can connect to your DB through PHPMyAdmin:

    https://[CI_CD_DOMAIN]:24580/
    Login: root
    Password: [SOFTWARE_PASSWORD]

You can also connect with any MySQL client like the official CLI:

    mysql --host=[CI_CD_DOMAIN] --port=24306 --user=root --password=[SOFTWARE_PASSWORD]
