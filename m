Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7906D507B
	for <lists+drbd-dev@lfdr.de>; Mon,  3 Apr 2023 20:31:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00E5342096B;
	Mon,  3 Apr 2023 20:31:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03CA6420323
	for <drbd-dev@lists.linbit.com>; Mon,  3 Apr 2023 08:20:22 +0200 (CEST)
Received: by mail-ed1-f53.google.com with SMTP id b20so112776619edd.1
	for <drbd-dev@lists.linbit.com>; Sun, 02 Apr 2023 23:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20210112; t=1680502822;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
	:date:message-id:reply-to;
	bh=JmR6Md0ANsS1Rhn/3c0zlg1qjIkICF02SS0b5ww0aPY=;
	b=NbPZBu3ee3v1D7NLap+rHSjmimzMhEtCNjhiSyM4O3a7CiyAzA/zRcabO8hEIbKQE9
	es7zEKI3TV2RtbAsOiIxtYAlBJquU+ZYyrx0LL2OkrpBZURAg7qOl1IXbCJotkyT9ntA
	R5/dPY+AUzNP7Lo9viTt6z1L0asX9gfiJBzL9Hpgug2DIGaTgnsg8U99PX6WF8HjGaxl
	oqgdMpvyo9nvFNTkHzfJV8LjtrigeDzmeUk1v6/MWLqbKDKtmI2FoT6n7ducGBbfRjeM
	xkIXZJ28YA4YXQERvMhGJDJKF70uTZxMiFO66IoeUuyoub2zBtTwMBimIkVESj0eU9sA
	/3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1680502822;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=JmR6Md0ANsS1Rhn/3c0zlg1qjIkICF02SS0b5ww0aPY=;
	b=uBH5Tv0KyW309uk2adITvVZHt+IEsszMQDWnNGCKpBIuZwyfJ4aKzFopcqb9tq8mqJ
	fwwgJROo3ACSygeNY1UW1WrrUWi+hxczW5XxPg32yFeevz5jvZb6405Xt5oRLfXGu2Vo
	EZtM60xwECwwdHhGroKMARk0/r58jcI4tB2xHd2phHlK/JRaYfy/keu5xpIqPs+j/LZz
	H8SMIA7lhtwUXXYAz8xN4uAW7teStmu+PkFRzC6VOrYmGXFKXwbuv3l6XQoIH8VoOzo1
	0YTEExmh2svnMq0Gn4XP/f06Q2EYc6CJYdHAEcRbaLsQ8nAx6tyyzt6n39MnjWuu8Akn
	VWWg==
X-Gm-Message-State: AAQBX9fXUb4otvGqg/lp2LqwqjPQ0aTjn3EV69j1Ab3Qu4dPRfAAObMy
	baBxsxr12GAutbItithtdLc=
X-Google-Smtp-Source: AKy350ZOc7yeozVUPq5JUuO4BxvkyAgPe780izXXLKNVSLtG9SzbGkEde+3BHjGRYx1UPJy/38hkfg==
X-Received: by 2002:a17:906:a015:b0:8af:3382:e578 with SMTP id
	p21-20020a170906a01500b008af3382e578mr16455543ejy.4.1680502822268;
	Sun, 02 Apr 2023 23:20:22 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
	8-20020a170906018800b009306ebc79d3sm4026343ejb.59.2023.04.02.23.20.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Apr 2023 23:20:21 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:20:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Christoph =?iso-8859-1?Q?B=F6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Message-ID: <6e0167a2-263d-4b79-aebc-42dc7df636fb@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330102744.2128122-8-christoph.boehmwalder@linbit.com>
X-Mailman-Approved-At: Mon, 03 Apr 2023 20:31:55 +0200
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3 7/7] drbd: Pass a peer device to the
 resync and online verify functions
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Christoph,

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder=
/genetlink-make-_genl_cmd_to_str-static/20230330-182912
base:   06965037ce942500c1ce3aa29ca217093a9c5720
patch link:    https://lore.kernel.org/r/20230330102744.2128122-8-christoph=
.boehmwalder%40linbit.com
patch subject: [PATCH v3 7/7] drbd: Pass a peer device to the resync and on=
line verify functions
config: riscv-randconfig-m031-20230402 (https://download.01.org/0day-ci/arc=
hive/20230402/202304020852.dVP30hiV-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304020852.dVP30hiV-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn: variable d=
ereferenced before check 'peer_device' (see line 587)

vim +/peer_device +588 drivers/block/drbd/drbd_worker.c

e68ceefa210f83 Christoph B=F6hmwalder 2023-03-30  585  static int make_resy=
nc_request(struct drbd_peer_device *const peer_device, int cancel)
b411b3637fa71f Philipp Reisner      2009-09-25  586  {
e68ceefa210f83 Christoph B=F6hmwalder 2023-03-30 @587  	struct drbd_device =
*const device =3D peer_device->device;
                                                                           =
                ^^^^^^^^^^^^^^^^^^^
Dereference

44a4d551846b8c Lars Ellenberg       2013-11-22 @588  	struct drbd_connectio=
n *const connection =3D peer_device ? peer_device->connection : NULL;
                                                                           =
                        ^^^^^^^^^^^
Check for NULL.  You added a bunch of unchecked dereferences later as
well so hopefully this NULL check can be removed.

b411b3637fa71f Philipp Reisner      2009-09-25  589  	unsigned long bit;
b411b3637fa71f Philipp Reisner      2009-09-25  590  	sector_t sector;
155bd9d1abd604 Christoph Hellwig    2020-09-25  591  	const sector_t capaci=
ty =3D get_capacity(device->vdisk);
1816a2b47afae8 Lars Ellenberg       2010-11-11  592  	int max_bio_size;
e65f440d474d7d Lars Ellenberg       2010-11-05  593  	int number, rollback_=
i, size;
506afb6248af57 Lars Ellenberg       2014-01-31  594  	int align, requeue =
=3D 0;
0f0601f4ea2f53 Lars Ellenberg       2010-08-11  595  	int i =3D 0;
92d94ae66aebda Philipp Reisner      2016-06-14  596  	int discard_granulari=
ty =3D 0;
b411b3637fa71f Philipp Reisner      2009-09-25  597  =

b411b3637fa71f Philipp Reisner      2009-09-25  598  	if (unlikely(cancel))
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  599  		return 0;
b411b3637fa71f Philipp Reisner      2009-09-25  600  =

b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  601  	if (device->rs_total =
=3D=3D 0) {
af85e8e83d160f Lars Ellenberg       2010-10-07  602  		/* empty resync? */
e68ceefa210f83 Christoph B=F6hmwalder 2023-03-30  603  		drbd_resync_finish=
ed(peer_device);
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  604  		return 0;
af85e8e83d160f Lars Ellenberg       2010-10-07  605  	}
af85e8e83d160f Lars Ellenberg       2010-10-07  606  =

b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  607  	if (!get_ldev(device)=
) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  608  		/* Since we only nee=
d to access device->rsync a
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  609  		   get_ldev_if_state=
(device,D_FAILED) would be sufficient, but
b411b3637fa71f Philipp Reisner      2009-09-25  610  		   to continue resyn=
c with a broken disk makes no sense at
b411b3637fa71f Philipp Reisner      2009-09-25  611  		   all */
d01801710265cf Andreas Gruenbacher  2011-07-03  612  		drbd_err(device, "Di=
sk broke down during resync!\n");
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  613  		return 0;
b411b3637fa71f Philipp Reisner      2009-09-25  614  	}
b411b3637fa71f Philipp Reisner      2009-09-25  615  =

9104d31a759fba Lars Ellenberg       2016-06-14  616  	if (connection->agree=
d_features & DRBD_FF_THIN_RESYNC) {
92d94ae66aebda Philipp Reisner      2016-06-14  617  		rcu_read_lock();
92d94ae66aebda Philipp Reisner      2016-06-14  618  		discard_granularity =
=3D rcu_dereference(device->ldev->disk_conf)->rs_discard_granularity;
92d94ae66aebda Philipp Reisner      2016-06-14  619  		rcu_read_unlock();
92d94ae66aebda Philipp Reisner      2016-06-14  620  	}
92d94ae66aebda Philipp Reisner      2016-06-14  621  =

b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  622  	max_bio_size =3D queu=
e_max_hw_sectors(device->rq_queue) << 9;
e68ceefa210f83 Christoph B=F6hmwalder 2023-03-30  623  	number =3D drbd_rs_=
number_requests(peer_device);
0e49d7b014c5d5 Lars Ellenberg       2014-04-28  624  	if (number <=3D 0)
0f0601f4ea2f53 Lars Ellenberg       2010-08-11  625  		goto requeue;
b411b3637fa71f Philipp Reisner      2009-09-25  626  =

b411b3637fa71f Philipp Reisner      2009-09-25  627  	for (i =3D 0; i < num=
ber; i++) {
506afb6248af57 Lars Ellenberg       2014-01-31  628  		/* Stop generating R=
S requests when half of the send buffer is filled,
506afb6248af57 Lars Ellenberg       2014-01-31  629  		 * but notify TCP th=
at we'd like to have more space. */
44a4d551846b8c Lars Ellenberg       2013-11-22  630  		mutex_lock(&connecti=
on->data.mutex);
44a4d551846b8c Lars Ellenberg       2013-11-22  631  		if (connection->data=
.socket) {
506afb6248af57 Lars Ellenberg       2014-01-31  632  			struct sock *sk =3D=
 connection->data.socket->sk;
506afb6248af57 Lars Ellenberg       2014-01-31  633  			int queued =3D sk->=
sk_wmem_queued;
506afb6248af57 Lars Ellenberg       2014-01-31  634  			int sndbuf =3D sk->=
sk_sndbuf;
506afb6248af57 Lars Ellenberg       2014-01-31  635  			if (queued > sndbuf=
 / 2) {
506afb6248af57 Lars Ellenberg       2014-01-31  636  				requeue =3D 1;
506afb6248af57 Lars Ellenberg       2014-01-31  637  				if (sk->sk_socket)
506afb6248af57 Lars Ellenberg       2014-01-31  638  					set_bit(SOCK_NOSP=
ACE, &sk->sk_socket->flags);
b411b3637fa71f Philipp Reisner      2009-09-25  639  			}
506afb6248af57 Lars Ellenberg       2014-01-31  640  		} else
506afb6248af57 Lars Ellenberg       2014-01-31  641  			requeue =3D 1;
44a4d551846b8c Lars Ellenberg       2013-11-22  642  		mutex_unlock(&connec=
tion->data.mutex);
506afb6248af57 Lars Ellenberg       2014-01-31  643  		if (requeue)
b411b3637fa71f Philipp Reisner      2009-09-25  644  			goto requeue;
b411b3637fa71f Philipp Reisner      2009-09-25  645  =

b411b3637fa71f Philipp Reisner      2009-09-25  646  next_sector:
b411b3637fa71f Philipp Reisner      2009-09-25  647  		size =3D BM_BLOCK_SI=
ZE;
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  648  		bit  =3D drbd_bm_fin=
d_next(device, device->bm_resync_fo);
b411b3637fa71f Philipp Reisner      2009-09-25  649  =

4b0715f09655e7 Lars Ellenberg       2010-12-14  650  		if (bit =3D=3D DRBD_=
END_OF_BITMAP) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  651  			device->bm_resync_f=
o =3D drbd_bm_bits(device);
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  652  			put_ldev(device);
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  653  			return 0;
b411b3637fa71f Philipp Reisner      2009-09-25  654  		}
b411b3637fa71f Philipp Reisner      2009-09-25  655  =

b411b3637fa71f Philipp Reisner      2009-09-25  656  		sector =3D BM_BIT_TO=
_SECT(bit);
b411b3637fa71f Philipp Reisner      2009-09-25  657  =

e68ceefa210f83 Christoph B=F6hmwalder 2023-03-30  658  		if (drbd_try_rs_be=
gin_io(peer_device, sector)) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  659  			device->bm_resync_f=
o =3D bit;
b411b3637fa71f Philipp Reisner      2009-09-25  660  			goto requeue;
b411b3637fa71f Philipp Reisner      2009-09-25  661  		}
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  662  		device->bm_resync_fo=
 =3D bit + 1;
b411b3637fa71f Philipp Reisner      2009-09-25  663  =

b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  664  		if (unlikely(drbd_bm=
_test_bit(device, bit) =3D=3D 0)) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  665  			drbd_rs_complete_io=
(device, sector);
b411b3637fa71f Philipp Reisner      2009-09-25  666  			goto next_sector;
b411b3637fa71f Philipp Reisner      2009-09-25  667  		}
b411b3637fa71f Philipp Reisner      2009-09-25  668  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
