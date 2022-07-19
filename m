Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC357A345
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jul 2022 17:35:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F13DD4207B5;
	Tue, 19 Jul 2022 17:35:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 68E9C4206B5
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jul 2022 17:35:43 +0200 (CEST)
Received: by mail-pl1-f180.google.com with SMTP id k19so12286363pll.5
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jul 2022 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sourceruckus-org.20210112.gappssmtp.com; s=20210112;
	h=mime-version:from:date:message-id:subject:to;
	bh=aB+vcFJmM0yGvVgQ/Z7bOvLX0U/8RF7R2YkrROk1vaE=;
	b=yk0typMfo9CAA5RyBVY7SdNy5o4sA7VgcGTKyXnS+2DIxXSe09gkqg3MR2FC1wx80q
	4stNe14s24JPovrooIi/HXnb7vNO8g4VQkgtq6hhUMJhn+rauEl58KchF+32ywATKThT
	9miUVmZHJvFJA9jtR1PNpro+tVcsnmOCOeDdDbfHD9E/4z94qMnS378EbZaXiOCj62/I
	xGs78zYtBzWxcFuvyh6okv5rFWrSKXmiczv2ER1jjmM3Rb/MUKcEvr6/lkp0toUl7fjL
	99Iii58bv+G1DJfrK0+lCuin/5OxXSENrZKWtehG7mEPwObqx4nwRcqjFz4xLe/tTBli
	h/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=aB+vcFJmM0yGvVgQ/Z7bOvLX0U/8RF7R2YkrROk1vaE=;
	b=DNfJjEzZ+EhXgCYRnqlnDHvbl71dVDTatzYo79hDWbjohusRkIs8A2Kelh7NfLrIP0
	XYNvL2ANLXLItT5SKcT5XvCKMEogej3iL5djrG5CCKvM1FK8ZqvTp4ytaI2qCIbE42Xb
	1wOIg2lPJ96psUvCszwTAf1o+4MqXmxxsWZijwxrC07LVETjOYf/Yipm7fSHzB8/Zs1v
	XJd8VfRkbxe2mGIdmju5X2tOx67f+GJAsVPMx7cEX3G0dSbB3DKykY6bNrBMyk0Xld/C
	k0r6hlW7WdSi6e+ghXZTmtwA+eUGOSWVQzrHSadNTF1LmTChpq+d9tC0mqpKTzKceNnQ
	INdQ==
X-Gm-Message-State: AJIora9sfwhvRh72Bd+aPO8NF9s/A0zv/eJybFfG+VzrSlnne3mNMOI3
	nIab/GV6aWu3xIIHBioYBrNSS6FIzABPWouLRRoPcUeHtZsiiMVC
X-Google-Smtp-Source: AGRyM1uRO5Ys4AqXFpObDLyKJzj0+TAJcwbwYaEzsWXDYUciKVVfBGLTLOqNO5W8vftVe1lE6SGrhvUddx+ZDw4ULA0=
X-Received: by 2002:a17:90a:5b10:b0:1f2:c0a:f175 with SMTP id
	o16-20020a17090a5b1000b001f20c0af175mr2582270pji.20.1658244941789;
	Tue, 19 Jul 2022 08:35:41 -0700 (PDT)
MIME-Version: 1.0
From: Michael Labriola <veggiemike@sourceruckus.org>
Date: Tue, 19 Jul 2022 11:35:30 -0400
Message-ID: <CAA1fRFhjfFsADzgr0BS7H3=5Tzfu54g764dRE+WSHi4tjDDpyQ@mail.gmail.com>
To: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] corrupted resource can't be fixed by rolling back to old
	snapshot
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hey, all.  I posted this to drbd-user a few weeks ago and didn't get
any feedback...  Hoping I get a nibble on drbd-dev.

Here's a question that's bugging me.  I've had this happen
multiple times now (over the course of 2-3 years, so infrequent).
I've got a system set up with DRBD resources using ZFS volumes as the
block devices (for volume management and snapshots among other
reasons).  I've had some obvious hardware problems lead to what I
think is corrupted DRBD metadata a few times.  Now, I had expected to
be able to simply rollback to an earlier snapshot of the underlying
ZVOL on the primary, a slightly older one on the secondary node, and
sync back up nicely.  But what happens instead is no matter how old of
a snapshot I use, I continue to get these types of errors:

drbdadm dump-md nautilus_data
Found meta data is "unclean", please apply-al first

drbdadm apply-al nautilus_data
extent 4746752 beyond end of bitmap!
extent 4870144 beyond end of bitmap!
extent 5436416 beyond end of bitmap!
extent 5437440 beyond end of bitmap!
...
extent 6793216 beyond end of bitmap!
extent 6793218 beyond end of bitmap!
../shared/drbdmeta.c:2028:apply_al: ASSERT(bm_pos - bm_on_disk_pos <=
chunk - this_extent_size) failed.

What I'm trying to understand is how can I be corrupting my DRBD
resource so badly that going back in time to an older version of the
block device used by the resource is STILL corrupt?

This is an Ubuntu 20.04 system with 5.15 kernel and DRBD 9.1.5, but as
mentioned I've seen this problem a couple times over the years with
5.10 and 5.4 kernels and whatever version of DRBD9 compiled for those
kernels at the time.  I'm convinced I must be fundamentally
misunderstanding something about how DRBD works on this one.

My resource config follows:

# resource nautilus_data on skywalker: not ignored, not stacked
# defined at /etc/drbd.d/nautilus_data.res:1
resource nautilus_data {
    device               /dev/drbd1 minor 1;
    meta-disk            internal;
    on skywalker {
        node-id 0;
        disk             /dev/zdata/nautilus;
        address          ipv4 10.1.20.201:7810;
    }
    on vader {
        node-id 1;
        disk             /dev/zdata/nautilus;
        address          ipv4 10.1.20.202:7810;
    }
    connection {
        host skywalker         address         ipv4 192.168.1.2:7810;
        host vader         address         ipv4 192.168.1.3:7810;
        net {
            _name        vader;
        }
    }
    net {
        protocol           C;
        max-buffers      36k;
        max-epoch-size   20000;
        sndbuf-size       2M;
        rcvbuf-size       4M;
        allow-two-primaries yes;
        after-sb-0pri    discard-zero-changes;
        after-sb-1pri    discard-secondary;
        after-sb-2pri    disconnect;
    }
    disk {
        disk-barrier      no;
        disk-flushes      no;
        al-extents       3833;
        c-plan-ahead       1;
        c-fill-target    24M;
        c-max-rate       110M;
        c-min-rate       10M;
    }
}

--
Michael D Labriola
401-316-9844 (cell)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
