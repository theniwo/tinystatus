# tinystatus
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/theniwo/tinystatus) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/theniwo/tinystatus) ![Docker Pulls](https://img.shields.io/docker/pulls/theniwo/tinystatus) ![Docker Architectures](https://img.shields.io/badge/arch-x86%20%7C%20amd64-informational)

tinystatus generates an html status page via shell script

Based on [tinystatus](https://github.com/bderenzo/tinystatus) by [bderenzo](https://github.com/bderenzo)



## Usage
```
git clone https://github.com/theniwo/tinystatus
./tinystatus/tinystatus
```
Edit config files under .tinystatus

or

```
docker run -d \
        --name tinystatus \
        --hostname tinystatus \
        --restart unless-stopped \
        --memory "128M" \
        -v $PWD/.tinystatus/checks.list:/root/tinystatus/checks.list:ro \
        -v $PWD/.tinystatus/incidents.list:/root/tinystatus/incidents.list:ro \
        -p 8888:80 \
        theniwo/tinystatus:latest
```
*Info*
- Set the amount of ram to your liking. (128 MB - 256 MB should be plenty)
- Of course you can change the port and add volumes, too. :wink:


## Connect

### Via webbrowser
`http://IP:PORT`


---
**NOTES**
<!---
	<pre>
	Scrolltext
	</pre>
-->

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Infobox_info_icon.svg/1200px-Infobox_info_icon.svg.png" alt="drawing" width="20"/>

The latest version will be updated regularly.

**CONTACT**

[disp@mailbox.org](mailto:disp@mailbox.org)

**LINKS**

[Docker Hub](https://hub.docker.com/repository/docker/theniwo/tinystatus)

[Git Hub](https://github.com/theniwo/tinystatus)
