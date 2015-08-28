# Workarounds
__Icons__
* :white_check_mark: - Fixed Upstream
* :o: - Workaround works.
* :x: - Still an issue
* :anger: - Massive pain in balls
____

1. [ :o: NetworkManager OpenVPN] [1]
2. [ :o: Pulseaudio] [2]
3. [ :o: KDE Spamming Journal] [3]
[1]: #1.network-manager
[2]: #2-pulseaudio
[3]: #3-kde-journal-spam

#### <br>

# 1. Network Manager
* [FS#46123](https://bugs.archlinux.org/task/46123) [networkmanager-openvpn] Does not work anymore
* [FS#46124](https://bugs.archlinux.org/task/46124) [networkmanager-openvpn] missing user (and maybe group)

__Logs__
* [Aug 28 03:52:40 Maxwell NetworkManager](http://codepad.org/pd9qW3sk)
```
Aug 28 03:52:40 Maxwell NetworkManager[390]: (nm-openvpn-service:2352): nm-openvpn-WARNING **: (nm-openvpn-service.c:1269):nm_openvpn_start_openvpn_binary: runtime check failed: (priv->mgt_path == NULL)
Aug 28 03:52:40 Maxwell NetworkManager[390]: <info>  VPN plugin state changed: starting (3)
Aug 28 03:52:40 Maxwell NetworkManager[390]: <info>  VPN connection 'ovpn' (Connect) reply received.
Aug 28 03:52:40 Maxwell NetworkManager[390]: <warn>  VPN connection 'ovpn' failed to connect: 'User 'nm-openvpn' not found, check NM_OPENVPN_USER.'.
Aug 28 03:52:40 Maxwell NetworkManager[390]: <warn>  error disconnecting VPN: Could not process the request because no VPN connection was active.
Aug 28 03:53:01 Maxwell NetworkManager[390]: <info>  VPN service 'openvpn' disappeared
```

__Workaround__
* Add user & group by ___AnAkkk (AnAkkk) - Thursday, 27 August 2015, 23:26 GMT___
```
groupadd -r nm-openvpn
useradd -r -g nm-openvpn -d / -s /sbin/nologin -c "Default user for running openvpn spawned by NetworkManager" nm-openvpn
```

# 2. Pulseaudio
* Stop volume get lowered during events (___comment cork___)
  ```
  /etc/pulse/default.pa

  ### Cork music/video streams when a phone stream is active
  # load-module module-role-cork
  ```
* Stop Master volume get adjusted by applications and spit to 100% Volume :anger:
  ```
  /etc/pulse/daemon.conf

  flat-volumes = no
  ```

# 3. KDE Journal Spam
* KDE spamming journal (___add debug=false___)
  ```
  /usr/bin/startkde

  # Disable's logging so it won't spam into journald
  QT_LOGGING_RULES="*.debug=false"
  export QT_LOGGING_RULES
  ```
