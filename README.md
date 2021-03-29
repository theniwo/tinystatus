# tinystatus
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/theniwo/tinystatus) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/theniwo/tinystatus) ![Docker Pulls](https://img.shields.io/docker/pulls/theniwo/tinystatus) ![Docker Architectures](https://img.shields.io/badge/arch-x86%20%7C%20amd64-informational)

tinystatus generates an html status page via shell script

Based on [tinystatus](https://github.com/bderenzo/tinystatus) by [bderenzo](https://github.com/bderenzo)



## Usage
```
git clone https://github.com/theniwo/tinystatus
cd tinystatus
./tinystatus
```

or

```
docker run -d \
        --name tinystatus \
        --hostname tinystatus \
        --restart unless-stopped \
        --memory "64M" \
	-e INTERVAL=10 \
        -v $PWD/.tinystatus/checks.list:/root/tinystatus/checks.list:ro \
        -v $PWD/.tinystatus/incidents.list:/root/tinystatus/incidents.list:ro \
        -p 8888:80 \
        theniwo/tinystatus:latest
```
*Info*
- Edit config files under `./tinystatus/.tinystatus/`
- If you change the configuration you have to restart the container `docker restart tinystatus`
- The status is updated every 10 seconds or `INTERVAL`
- Set the maximum amount of ram to your liking. (64 MB - 128 MB should be plenty)
- Of course you can change the port and add volumes, too. :wink:

## Connect

### Via webbrowser
`http://IP:8888`


---
**NOTES**
<!---
	<pre>
	Scrolltext
	</pre>
-->

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Infobox_info_icon.svg/1200px-Infobox_info_icon.svg.png" alt="drawing" width="20"/>

* The latest version will be updated regularly.

**CONTACT**

[E-Mail](mailto:tinystatus@theniwo.de)

**LINKS**

[Docker Hub](https://hub.docker.com/repository/docker/theniwo/tinystatus)

[Git Hub](https://github.com/theniwo/tinystatus)

---
