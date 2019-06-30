Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 782255B240
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2019 00:46:57 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3BBDC103B4D9;
	Mon,  1 Jul 2019 00:46:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B99681028A76
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2019 00:46:54 +0200 (CEST)
Received: by mail-io1-f66.google.com with SMTP id e5so24463987iok.4
	for <drbd-dev@lists.linbit.com>; Sun, 30 Jun 2019 15:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=1hc/iX74V6u4kaE6VVGHF8sYS4n19zAHFwPgfs6OIwk=;
	b=Ed4hjB/fKtZ1qWGr72rUbhIVdadJupf0HhUt8Tc0Yrt13+wExdY2vrolklHj7HoiWl
	w11ZJRcuPi/6MKP7gyn+GQM8EB0BzPU7fnd2pDJJ+akU+RRpHrDeemwgwjquHTALeA+t
	+w9yGEfxBoTlyw5cBI9Pd3+rdQiQC9OdEorgvUWhVS1HXZ3f0YVJgP6Ee4kN9il+iKsE
	Z16ynOsdhnms5yYRAoEKfJLvDa0CkOQ9FgqkNFbxXnXo+y13oVR2ygT44e8UBGsJ585c
	J4gw3+FL+LsjSnBwcvameIwu5GG4P8QkmD8JvHnPjckiomZA7MxODYoeJRSWF+YhOcbZ
	VD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=1hc/iX74V6u4kaE6VVGHF8sYS4n19zAHFwPgfs6OIwk=;
	b=bNi2yNqZHMUqFA3nPP6ka4gX6NUoocFWzt72w80MAW5s4GooEZNyoeO8Lyhtw0mtJ1
	J2FueEAL4xx3/zDqenvNjnOeTpTPfUSnqwX0gsPSlmg4TCU3GrWlwOEqVfkMFG8JODRF
	RYe8znTb24E48bGzVQLv+UaEJOuP9GiaDiJTdWIy+1dUnPs9i+ZYhGaj5sjzIWG8BigZ
	tHPK2a555AB2EEvIsHO8jTih8U0jb2MeBi4ilCPZJ5giHqd+/wpNMHAtRO8wG8b6QZkc
	jf71V9BwytwNJfpC1LOOOvzlCOgsd61cUjYD8p2iLwqllSXFcwt8nwUd1tip4MnRFC7o
	6Gig==
X-Gm-Message-State: APjAAAUVbYhyceYkopt9CNKO1YqwFS6yenKFVFgW0J5DdTTG0bedlclg
	UeufgPG2HiNzL0f7/s9zlZmk3blR
X-Google-Smtp-Source: APXvYqybV96wRpbrjn9xQ90UXoj4Q2LEbspeTKumuMf8lHxNmtcuyw771UEHiEv7anqXgaHmoG1fZQ==
X-Received: by 2002:a6b:6012:: with SMTP id r18mr4996527iog.241.1561934813330; 
	Sun, 30 Jun 2019 15:46:53 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	z17sm13910808iol.73.2019.06.30.15.46.52
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Jun 2019 15:46:52 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <44599673-cf74-7e79-3672-af9feea537d2@gmail.com>
Date: Sun, 30 Jun 2019 16:46:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] How to leak a peer_devices idr instance
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

I've been valgrinding the SCST/DRBD usermode server to look for bugs in my kernel function
emulation.  Once in a while it points me at a problem in DRBD.  I mentioned in a message last
week about the "resync_fifo" leak (which appears consistently in the valgrind output).

Ideally I could get a clean valgrind run, with all allocations having been freed before exit.
After deleting objects using drbdsetup and then running the server's exit handlers, it is very
close, with a couple of "usual suspects", plus whatever I discover from time to time as I try 
different operations.

Today's discovery is the ability to leak a peer_devices idr instance by a sequence of six
drbdsetup create and delete steps.  Whether or not it leaks depends on the order of the delete
steps.  After a fresh restart of the server the first sequence below leaks, but not the second.

If I delete the peer before the minor it leaks the peer_devices idr.
    sudo drbdsetup new-resource r0 0
    sudo drbdsetup new-minor r0 1 0 
    sudo drbdsetup new-peer r0 1 --_name=vagrant
    sudo drbdsetup del-peer r0 1                # delete peer first leaks peer_devices idr 
    sudo drbdsetup del-minor 1
    sudo drbdsetup del-resource r0

If I delete the minor before the peer it doesn't leak.
    sudo drbdsetup new-resource r0 0
    sudo drbdsetup new-minor r0 1 0 
    sudo drbdsetup new-peer r0 1 --_name=vagrant
    sudo drbdsetup del-minor 1                  # delete minor first doesn't leak
    sudo drbdsetup del-peer r0 1
    sudo drbdsetup del-resource r0

What appears to be happening:

    During del-minor, the peer_devices idr gets removed in drbd_unregister_device(), for each
    connection it finds.  That appears to be the only place that idr gets removed after use.

    But in the leaking sequence, the connection has already been removed by the del-peer command
    before the later del-minor command runs.  So the connection loop in drbd_unregister_device()
    (line 3935 below) iterates zero times and does not free any peer_devices idr.

    3928 void drbd_unregister_device(struct drbd_device *device)
    ... 
    3934         spin_lock_irq(&resource->req_lock);
    3935         for_each_connection(connection, resource) {
    3936                 idr_remove(&connection->peer_devices, device->vnr);
    3937         }
    3938         idr_remove(&resource->devices, device->vnr);
    3939         idr_remove(&drbd_devices, device_to_minor(device));
    3940         spin_unlock_irq(&resource->req_lock);

Regards,
David Butterfield
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
