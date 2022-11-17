# Extrnode’s open-source load balancer 
In August, cloud provider Hetzner said it banned blockchain nodes from hosting and mining cryptocurrency. And last week, it blocked all Solana nodes on its servers. As a result, more than 1,000 validators (22% of the total stake) went offline, and some applications became slow or inoperative. The reason is that the RPC nodes hosted by Hetzner were disabled. 

To solve such problems in the future, [extrnode](https://extrnode.com/) has released an open-source load balancer that will automatically reroute requests from delinquent nodes to active ones on Solana. 

We invite the Solana community to test it and give feedback on our [Discord](https://discord.gg/mb2xQ7kgdq).

## How to use extrnode’s open-source load balancer
You can deploy a docker container on your host using your load balancer. If you want to check or edit the default configuration, you can build a docker image from the source or use the already made image from [Docker Hub](https://hub.docker.com/r/extrnode/solana-lb).

### Start proxy
#### Build image from sources
- Clone sources to your working directory and enter inside:
    ```git clone https://github.com/extrnode/solana-lb```
    ```cd solana-lb/```
    You can use default configuration and HTTP protocol.
    To use your own domain name (with automatic HTTPS), first make sure your domain's A/AAAA DNS records are properly pointed to this machine's public IP, then replace ":80" in Caddyfile with your domain name.
    More details about [Caddy](https://caddyserver.com/)
- Build image, using Dockerfile:
    ```docker build -t extrnode/solana-lb .```

#### Pull already built image from Docker Hub
- ```docker pull extrnode/solana-lb```

#### Run container
- HTTP

```docker run -d -p 80:80 --name solana-lb_c extrnode/solana-lb```
- HTTPS ( for use with domain name )

```docker run -d -p 80:80 -p 443:443 -p 443:443/udp --name solana-lb_c extrnode/solana-lb```

## Load balancer features
The main feature of extrnode’s open-source load balancer is that it automatically reroutes requests to another active RPC endpoint when the RPC node in use is down. As a result, dApps that use extrnode will only stop working if all available RPCs go offline.

The reliable operation of applications is the main advantage of extrnode. But there are others as well:

- extrnode’s open-source load balancer will be free to use. Just run it on Docker, connect to it, and all is set.
- In theory, the open-source load balancer can be configured to pick up the closest RPCs with the fastest response time.
- It’s community-driven: users can contribute ideas, modify their clients, and complement the project's source code.

## Use cases and plans
In the current version, devs can use extrnode’s open-source load balancer to test applications on the mainnet. We can't guarantee its quality yet and don't recommend using the load balancer for production applications.

Soon we will release a free public load balancer and extrnode Premium for production use. extrnode’s public load balancer will be hosted on [Everstake](https://everstake.one/)'s infrastructure. Developers will need to send requests to extrnode's RPC endpoint for the load balancer to reroute them to other RPCs. The premium version will have only battle-tested validators, like 01node, Chainflow, Imperator, Chainode Tech, Stakin, Staking Facilities, Triton One, in the RPC cluster to provide clients with higher communication speeds and reliability.

## Alternatives
Other existing solutions fall into three categories:

- Decentralized but paid balancers. Users often have to pay in volatile project tokens.
Free but centralized balancers. Users can only access an RPC of a single provider, which reduces the solution’s reliability in case of attacks.
DIY load balancer. Complex and expensive, as the development would require a team, money, and infrastructure to host the solution.

- In the end, devs either have to pay or be afraid of an RPC shutdown due to incidents like Hetzner’s ban. extrnode’s load balancer will enable developers to work without such tradeoffs.

Subscribe to extrnode on [Twitter](https://twitter.com/extrnode) and join [Discord](https://discord.gg/mb2xQ7kgdq) to be the first to see new announcements, ask questions, and enjoy online parties.
