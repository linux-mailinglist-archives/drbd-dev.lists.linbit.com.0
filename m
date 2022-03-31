Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EE30B4EE3C8
	for <lists+drbd-dev@lfdr.de>; Fri,  1 Apr 2022 00:05:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C405942032B;
	Fri,  1 Apr 2022 00:05:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6CCA4201DC
	for <drbd-dev@lists.linbit.com>; Fri,  1 Apr 2022 00:05:54 +0200 (CEST)
Received: by mail-ed1-f53.google.com with SMTP id h4so883922edr.3
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 15:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3Ho9jg4pQwI43mh2smbjNNYfVQlK85ymR2bcGPQmzEU=;
	b=TGeR34J+02kbkPsHkSSgqp7sHsJXw5OIEwemL78K4n/ObMV856TJBti1bvbKgUeKQg
	mnlVUl6utz5rdQjEoK7zAt8Ul/3fBsOyMmW4aAnvXAnWMw2DIPyj62tKAAIBoV0kOiCT
	FZfMn8Bue+cYPnBEpr5adaZWrYoZNJn49A711nVvaLcKjbpNbZo6ybimlyH6l4UBJIUP
	08kWipvb4yNxZFsB3c4BI8A1a1Wnw389tVd/BfjiAHUfC1UERENV5KtWX4jy0Yhh9okW
	9lpZhHNPMERB5zgnJEWmQBLEms4eZwf4pFxlyg53mvPPHxFgPsFXyzol9NBmhWPdFEDg
	s1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3Ho9jg4pQwI43mh2smbjNNYfVQlK85ymR2bcGPQmzEU=;
	b=T5GFgy+QQELX5iiFcKcPn4zK5fLKu1qwuYAqwT2VRNGiWDHFBxxZ1wb9UR3/5SlDLC
	aCgae1wVdNBrYVF4UJUVrO8az8kqC3mSzSl56yJjdmzArg0twbPqr/TBi2LxNemnkphd
	q6bzS2XT6W3EwAZv0qyGFAG9ALEHVWYn7YyyhQsNskG1YSeQnrrPCW5jXO2JeaFP93JE
	mo4UhXJ9KcMYbvVYvJHDVB/hXnJzzoykIzb3FO1QcgvxBpvc4qhGcOpAJHnjYvmHF1Lb
	jSbXnbQ+BkNrM4JXZQtmO9LkqUT1DaJlYxdj0SgZunLNMLqHANVHheZnUzOs8GeKvJTj
	TcfA==
X-Gm-Message-State: AOAM533DS2Ob7cLiWJNZYP6RP96aq/RFExprM83A+NNsVYTxJd9YuKgu
	LrkYeX9t9yf6l+fIwaUXmO8=
X-Google-Smtp-Source: ABdhPJxShOKbJ4iBsD8bocoidzsE4n6V+HgZS/4jKAfFsKZmUCc4WqDot638Q5DB+rvQu04qJm8tsQ==
X-Received: by 2002:a05:6402:1107:b0:416:439a:6a9e with SMTP id
	u7-20020a056402110700b00416439a6a9emr18117030edv.382.1648764354432;
	Thu, 31 Mar 2022 15:05:54 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
	[62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
	o2-20020a50d802000000b00410d7f0c52csm321110edj.8.2022.03.31.15.05.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Mar 2022 15:05:54 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri,  1 Apr 2022 00:03:48 +0200
Message-Id: <20220331220349.885126-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, "Bos,
	H.J." <h.j.bos@vu.nl>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	linux-block@vger.kernel.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Mike Rapoport <rppt@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/2] drbd: remove usage of list iterator variable
	after loop for list_for_each_entry_safe_from()
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

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to iterate through the list [1].

Since that variable should not be used past the loop iteration, a
separate variable is used to 'remember the current location within the
loop'.

To either continue iterating from that position or skip the iteration
(if the previous iteration was complete) list_prepare_entry() is used.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 96881d5babd9..9676a1d214bc 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -171,7 +171,7 @@ void tl_release(struct drbd_connection *connection, unsigned int barrier_nr,
 		unsigned int set_size)
 {
 	struct drbd_request *r;
-	struct drbd_request *req = NULL;
+	struct drbd_request *req = NULL, *tmp = NULL;
 	int expect_epoch = 0;
 	int expect_size = 0;
 
@@ -225,8 +225,11 @@ void tl_release(struct drbd_connection *connection, unsigned int barrier_nr,
 	 * to catch requests being barrier-acked "unexpectedly".
 	 * It usually should find the same req again, or some READ preceding it. */
 	list_for_each_entry(req, &connection->transfer_log, tl_requests)
-		if (req->epoch == expect_epoch)
+		if (req->epoch == expect_epoch) {
+			tmp = req;
 			break;
+		}
+	req = list_prepare_entry(tmp, &connection->transfer_log, tl_requests);
 	list_for_each_entry_safe_from(req, r, &connection->transfer_log, tl_requests) {
 		if (req->epoch != expect_epoch)
 			break;

base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
