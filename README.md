# A simple media streaming app which uses kurento media server

This build is based off of Kurento Open source project:
https://doc-kurento.readthedocs.io/en/6.6.1/index.html
https://github.com/Kurento/kurento-docker/tree/master/kurento-media-server

### How do I run the media streaming server image

1. Build the docker image by running 
`docker build -t manvishri/mediastreaming-server:latest .`

2. Run the image without building it (by pulling the image from repo)
`docker run manvishri/mediastreaming-server -p 8888:8888 -d`

3. Test if the media streaming server is up and running by executing this command. If you get a 500 response - the media streaming server is up and running!
```bash
curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: 127.0.0.1:8888" -H "Origin: 127.0.0.1" http://127.0.0.1:8888/kurento\n
```

### Future enhancements
- [x] Dockerize media streaming server
- [ ] Build the sender/receiver server (netty/jetty/spring)
- [ ] Dockerie sender/receiver server (netty/jetty/spring)
- [ ] Use docker-compose and run the app as set of services
- [ ] Integrate kubernetes and run the application on cloud
- [ ] Build in monitoring to monitor realtime traffic events
