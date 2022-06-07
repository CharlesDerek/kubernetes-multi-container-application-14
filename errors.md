# List of conflicts on build recorded:

### Daemon potential error failures on Linux Distro initial build:

```Error response from daemon: Get "https://registry-1.docker.io/v2/": dial tcp: lookup registry-1.docker.io on [::1]:53: read udp [::1]:43042->[::1]:53: read: connection refused```

- This error means that the daemon was unable to connect to the docker registry.

3 Solutions (Debian Based):

- Restart the Docker daemon: ```sudo systemctl restart docker``` (worked)

- Check that the DNS settings are correct: ```cat /etc/resolv.conf```

- Check that the firewall is not blocking access to the docker registry: ```sudo ufw status```

