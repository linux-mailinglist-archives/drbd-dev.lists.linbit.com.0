Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 20938251141
	for <lists+drbd-dev@lfdr.de>; Tue, 25 Aug 2020 07:03:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E87C542092E;
	Tue, 25 Aug 2020 07:03:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 395 seconds by postgrey-1.31 at mail19;
	Tue, 25 Aug 2020 07:03:19 CEST
Received: from smtprelay.hostedemail.com (smtprelay0212.hostedemail.com
	[216.40.44.212])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09D7142092A
	for <drbd-dev@lists.linbit.com>; Tue, 25 Aug 2020 07:03:19 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 218E718019F28
	for <drbd-dev@lists.linbit.com>; Tue, 25 Aug 2020 04:57:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id E4F91100E7B40;
	Tue, 25 Aug 2020 04:56:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1311:1314:1345:1359:1515:1534:1539:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3350:3868:4321:5007:6119:6261:10004:10848:11026:11658:11914:12043:12297:12555:12895:12986:13069:13311:13357:13894:14181:14384:14394:14721:21080:21627:21990:30054,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:2, LUA_SUMMARY:none
X-HE-Tag: shoes50_100f5dc27059
X-Filterd-Recvd-Size: 1584
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf08.hostedemail.com (Postfix) with ESMTPA;
	Tue, 25 Aug 2020 04:56:51 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Date: Mon, 24 Aug 2020 21:56:03 -0700
Message-Id: <1c8081264d82101d7837220c5ee221c307da5d91.1598331148.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 06/29] drbd: Avoid comma separated statements
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

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/block/drbd/drbd_receiver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 422363daa618..87f732fb5456 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -111,8 +111,10 @@ static struct page *page_chain_tail(struct page *page, int *len)
 {
 	struct page *tmp;
 	int i = 1;
-	while ((tmp = page_chain_next(page)))
-		++i, page = tmp;
+	while ((tmp = page_chain_next(page))) {
+		++i;
+		page = tmp;
+	}
 	if (len)
 		*len = i;
 	return page;
-- 
2.26.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
