Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F322107FE
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Jul 2020 11:26:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87E564203ED;
	Wed,  1 Jul 2020 11:26:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 46FF14203F3
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 11:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dEDCWXfjhVQGOOrCUmr0J53WrGJ1BtJhis14QIiQIQk=;
	b=AhI5YsV13Iv7q6tUnnLzpio3XP
	uAnzpDzGCx6Ne6ojt9Q+KH1At6DZKdynwMnkdI7IGyo995agZAB2NSOTiBd+k3DHKYC8B4CLEtNKE
	TtveQ2NbJsuJBjtkhUCvdfcJHAfgI2c/EtuxG/XKf8oPBGJwkkW5zSkOe/ljCB8bu2JfgRYUCFnIe
	rydsCUFaIKQYUGqxkAEPTNu7R8xCBYr5/7/x0U6Sua8CbuGNZu7da7vhukC4ljxsIpqvwi+UcNaYv
	tJJ6g6Avyvsz13KgZDujJKiTYSeikkjJhpUn+t/sqWC6SJT1aq3a15v82WckDhWs2sK8ooGi2mECN
	62jUTcnA==;
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYhF-0000hb-3M; Wed, 01 Jul 2020 09:06:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 11:06:19 +0200
Message-Id: <20200701090622.3354860-2-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	linux-btrfs@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/4] drbd: remove a bogus bdi_rw_congested call
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

bdi_rw_congested returns congestion state, so calling it without
looking at the return value doesn't make much sense.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_proc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index 1c41cd9982a257..3c0193de249830 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -265,7 +265,6 @@ int drbd_seq_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "%2d: cs:Unconfigured\n", i);
 		} else {
 			/* reset device->congestion_reason */
-			bdi_rw_congested(device->rq_queue->backing_dev_info);
 
 			nc = rcu_dereference(first_peer_device(device)->connection->net_conf);
 			wp = nc ? nc->wire_protocol - DRBD_PROT_A + 'A' : ' ';
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
