#!/usr/bin/env bash
set -e
set -x

: ${PREFIX=/usr/local}

install -d /etc/cron.d
install -d /etc/cron.daily
install -d /etc/cron.hourly
install -d /etc/cron.weekly
install -d /etc/cron.monthly
install -m 0644 etc/zfs-auto-snapshot.cron.frequent /etc/cron.d/zfs-auto-snapshot
install etc/zfs-auto-snapshot.cron.hourly   /etc/cron.hourly/zfs-auto-snapshot
install etc/zfs-auto-snapshot.cron.daily    /etc/cron.daily/zfs-auto-snapshot
install etc/zfs-auto-snapshot.cron.weekly   /etc/cron.weekly/zfs-auto-snapshot
install etc/zfs-auto-snapshot.cron.monthly  /etc/cron.monthly/zfs-auto-snapshot
sed -i -e "s:zfs-auto-snapshot:${PREFIX}/sbin/zfs-auto-snapshot:g" /etc/cron.d/zfs-auto-snapshot
sed -i -e "s:zfs-auto-snapshot:${PREFIX}/sbin/zfs-auto-snapshot:g" /etc/cron.hourly/zfs-auto-snapshot
sed -i -e "s:zfs-auto-snapshot:${PREFIX}/sbin/zfs-auto-snapshot:g" /etc/cron.daily/zfs-auto-snapshot
sed -i -e "s:zfs-auto-snapshot:${PREFIX}/sbin/zfs-auto-snapshot:g" /etc/cron.weekly/zfs-auto-snapshot
sed -i -e "s:zfs-auto-snapshot:${PREFIX}/sbin/zfs-auto-snapshot:g" /etc/cron.monthly/zfs-auto-snapshot
install -d ${PREFIX}/share/man/man8
install src/zfs-auto-snapshot.8 ${PREFIX}/share/man/man8/zfs-auto-snapshot.8
install -d ${PREFIX}/sbin
install src/zfs-auto-snapshot.sh ${PREFIX}/sbin/zfs-auto-snapshot
