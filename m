Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C161347214B
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Dec 2021 08:03:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 150B2420965;
	Mon, 13 Dec 2021 08:03:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2ED1D420629
	for <drbd-dev@lists.linbit.com>;
	Fri, 10 Dec 2021 06:08:59 +0100 (CET)
Received: from canpemm500008.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J9JF016htzZffX;
	Fri, 10 Dec 2021 12:43:16 +0800 (CST)
Received: from localhost.huawei.com (10.175.124.27) by
	canpemm500008.china.huawei.com (7.192.105.151) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2308.20; Fri, 10 Dec 2021 12:46:08 +0800
From: Li Jinlin <lijinlin3@huawei.com>
To: <song@kernel.org>, <philipp.reisner@linbit.com>,
	<lars.ellenberg@linbit.com>, <axboe@kernel.dk>, <hare@suse.de>,
	<jack@suse.cz>, <ming.lei@redhat.com>, <tj@kernel.org>,
	<mcgrof@kernel.org>, <mcroce@microsoft.com>
Date: Fri, 10 Dec 2021 13:17:04 +0800
Message-ID: <20211210051707.2202646-1-lijinlin3@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
	canpemm500008.china.huawei.com (7.192.105.151)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 13 Dec 2021 08:03:45 +0100
Cc: linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
	linfeilong@huawei.com, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/3] Fix undefined behaviour during device
	synchronization
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

md/drbd drivers use 'signed int' variable to track sync vs non-sync IO,
and judge whether sync IO needs to be throttled by signed comparison.
If the value of the variable is greater than INT_MAX or close to
INT_MAX, some undefined behavior may occur.

Fix by using 64bit signed integer type.

The v2 "md: Fix undefined behaviour in is_mddev_idle" patch
differences to v1:
- add ubsan info in message
- use 64bit signed integer type instead of long type;
- move sync_io variable form struct gendisk to struct md_rdev, and 
  modify md_sync_acct() and md_sync_acct_bio() to fit for this change.

Li Jinlin (3):
  md: Fix undefined behaviour in is_mddev_idle
  drdb: Fix undefined behaviour in drbd_rs_c_min_rate_throttle
  drdb: Remove useless variable in struct drbd_device

 drivers/block/drbd/drbd_bitmap.c   |  2 +-
 drivers/block/drbd/drbd_int.h      |  5 ++---
 drivers/block/drbd/drbd_main.c     |  3 +--
 drivers/block/drbd/drbd_receiver.c | 12 ++++++------
 drivers/block/drbd/drbd_state.c    |  1 -
 drivers/block/drbd/drbd_worker.c   |  5 ++---
 drivers/md/md.c                    |  6 +++---
 drivers/md/md.h                    | 13 +++++++++----
 drivers/md/raid1.c                 |  4 ++--
 drivers/md/raid10.c                | 24 ++++++++++++------------
 drivers/md/raid5.c                 |  4 ++--
 include/linux/genhd.h              |  1 -
 12 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
