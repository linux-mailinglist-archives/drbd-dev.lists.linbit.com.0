Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A22AEC7E
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Nov 2020 09:55:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83CF54207EF;
	Wed, 11 Nov 2020 09:55:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 189854207FB
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 09:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nVz8RkNtpZwARdADh/JLCUJA7/hL1Ru40zDyIK26ET0=;
	b=tinmFTQPUUV98QgHlYKWX8YU4L
	4qD5VD7H0dD3uFNSDokl4KoFGi+j9gbRq7IRLld2eCm6EcqPRS6TWJuVKJhRvlBT4k8G49ePxnn5y
	IJdwH0Tkv70a7xu934IYCUXQlwrqMdxTy/SOG5XZrYyyc8yRDIsMxf9cnhcVLrtzz5C+wb1IO24Zf
	AqNi1dVWI5Z0ckM3+Q2ktx3U+FU4QA8GqzJow7/V+uWu26C7iqg4HEhWS44W5/9cZSIyjuIofOa4K
	kaEY3fE06TS463cWbBOQ4b28ewRycc05JB8+7U97q79iJYL/Y9Nk16FoT28Ku03ykhf7QO82EmBlE
	Y3KW2tZQ==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTM-0007cn-Hp; Wed, 11 Nov 2020 08:27:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 11 Nov 2020 09:26:50 +0100
Message-Id: <20201111082658.3401686-17-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 16/24] drbd: use set_capacity_and_notify
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

Use set_capacity_and_notify to set the size of both the disk and block
device.  This also gets the uevent notifications for the resize for free.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Ilya Dryomov <idryomov@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 65b95aef8dbc95..1c8c18b2a25f33 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2036,8 +2036,7 @@ void drbd_set_my_capacity(struct drbd_device *device, sector_t size)
 {
 	char ppb[10];
 
-	set_capacity(device->vdisk, size);
-	revalidate_disk_size(device->vdisk, false);
+	set_capacity_and_notify(device->vdisk, size);
 
 	drbd_info(device, "size = %s (%llu KB)\n",
 		ppsize(ppb, size>>1), (unsigned long long)size>>1);
@@ -2068,8 +2067,7 @@ void drbd_device_cleanup(struct drbd_device *device)
 	}
 	D_ASSERT(device, first_peer_device(device)->connection->net_conf == NULL);
 
-	set_capacity(device->vdisk, 0);
-	revalidate_disk_size(device->vdisk, false);
+	set_capacity_and_notify(device->vdisk, 0);
 	if (device->bitmap) {
 		/* maybe never allocated. */
 		drbd_bm_resize(device, 0, 1);
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
