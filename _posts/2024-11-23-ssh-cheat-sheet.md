---
layout: post 
title: SSH Cheat Sheet 
date: 2024-11-23 
categories: sysadmin
---

### Forward a local port through an intermediary host to a remote host

Opens a shell on intermediary host and forwards a port to remote host through SSH's secure channel. The forwarded port is accessible on the local machine via localhost:port

```
ssh -L localport:remotehost:remoteport user@intermediary_host
```

### Execute a single command through an intermediary host onto a remote host

Netcat-like, doesn't open a shell on intermediary host. Must use IP or FQDN for remote host

```
ssh -W remote_host:port user@intermediary_host
```

### Forward a local port to a remote host, accessible on local host

```
ssh -L localport:remotehost:remoteport user@remotehost
```

Add the -g flag to make the local port acessible to other systems on the local LAN

```
ssh -g -L localport:remotehost:remoteport user@remotehost
```

### Forward a local port to a remote host, accessible on remote host; aka reverse shell

```
ssh -R remoteport:localhost:localport user@remotehost
```

### Forward an internal port to a remote host, accessible on remote host

```
ssh -R remoteport:host_on_internal_LAN:internalport user@remotehost
```

### Dynamic forward; aka SOCKS proxy

```
ssh -D port user@remotehost
```

Use the `-N` flag to prevent opening a shell upon SSH connection

```
ssh -N -D port user@remotehost
```

### Public SOCKS proxy

Again, use the `-g` flag to make the port (SOCKS proxy) accessible to other systems on the LAN (DANGEROUS)

```
ssh -g -D port user@remotehost
```

### Chain ssh sessions

Use the `-a` flag to disable agent forwarding then the `-t` flag to force a psuedo-tty

```
ssh -a -t user@host_1 'ssh user@host_2'
```

### Tunnel an ssh connection through an HTTP proxy

Using `proxy-connect`:

```
ssh -o ProxyCommand='connect -H proxyserver:proxyport sshserver sshport' user@sshserver
```

Using `corkscrew`:

```
ssh -o ProxyCommand='corkscrew proxyserver proxyport sshserver sshport' user@sshserver`
```

### Send a file using SSH

```
cat file.send | ssh user@remoteserver 'cat > file.recieve'
```
