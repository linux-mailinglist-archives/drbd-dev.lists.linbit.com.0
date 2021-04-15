Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E22360293
	for <lists+drbd-dev@lfdr.de>; Thu, 15 Apr 2021 08:44:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0AF8A420949;
	Thu, 15 Apr 2021 08:44:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F8914202B2
	for <drbd-dev@lists.linbit.com>; Thu, 15 Apr 2021 08:36:56 +0200 (CEST)
Received: by mail-pl1-f174.google.com with SMTP id y2so11498221plg.5
	for <drbd-dev@lists.linbit.com>; Wed, 14 Apr 2021 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O+VmOPsutLxbN0SISKvUBxfTjW2pc+8lima7NycWzR8=;
	b=lD4HiQNo8MT+VgKL4K0tiv+2oEH/9W7yRMdX4q3HoqJkCe6V0kmQhfv4m0vvCYYAR3
	xng5VJhOu1OCH5qw32zMTXjQNUihjSys6zx7o1gyhkIYvp6W4Zi2LzAGkdFmdv5B8HTa
	ZfNPjJLqlDQ5bRNXVt+FvlxYqGiKQFNlr6pM7HMlXaP40/MxYP0jCKjS+Mo+Ajx5loyG
	mgoWxkV2aCwzO1Yn4ykdz8SowDdjHD28QfV9/JcyjJZvuWc6+AoKZIiON18DT0RTRHvd
	zwNAIT/igunaGyZIPj1BK34oyKfgL9rSR/8RQa9larM15XmRE3z+CwQGb2G0G0NLcZu9
	8d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O+VmOPsutLxbN0SISKvUBxfTjW2pc+8lima7NycWzR8=;
	b=GspKhQ6wumyCtymveydQPwYAcX82sPqs1XxMHcCpszl5HGCXv6BanwMtmBP2YupvNY
	7fXISsynRiQLNvLxsLFyinTQir0SbOCNkm1lz8XE3tw88EzTzamAlbBwrZtFq0qsCrIT
	xD4YYSM6i72qqtatJNP/YnKkyUmHIwJKwmRNfChtbD4HVXYr2OmortbqnJk8XOVZIReK
	mwPwT83BJN9tf4mCe96P9CAhL+Iwf2NIOHAJ1/0EmYgorzvvK4aNmagQRIoQMnJBNUII
	24nui8Z+3um0OlaU2SHArXwEBcI1doPNwyHrkhRqrtpzg+dhDYOE7CUXLMeni6kruDd3
	FyGQ==
X-Gm-Message-State: AOAM533fInmrWVaAN8Pwl7+cGAiRgEhfL85K+pil0h+4Dr4+yagNB0cj
	8I858TIgy+jm5xRsqTgJP2/x3WBf+GBPmFNz74i7PQ==
X-Google-Smtp-Source: ABdhPJxuOIe7ayXzFVqIrghy2qj4bGPNJ4KJg1tYr81ovUIIrvtyCrIyTSA0eMSrokNFp3YPNfaSSg==
X-Received: by 2002:a17:90a:4e0b:: with SMTP id
	n11mr2215303pjh.108.1618468615840; 
	Wed, 14 Apr 2021 23:36:55 -0700 (PDT)
Received: from localhost.localdomain ([113.16.249.230])
	by smtp.gmail.com with ESMTPSA id 25sm1375827pgx.72.2021.04.14.23.36.53
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Apr 2021 23:36:55 -0700 (PDT)
From: Ming Li <tolimit1019@gmail.com>
X-Google-Original-From: Ming Li <mingli199x@qq.com>
To: drbd-dev@lists.linbit.com
Date: Thu, 15 Apr 2021 14:36:46 +0800
Message-Id: <20210415063646.5298-1-mingli199x@qq.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Apr 2021 08:44:18 +0200
Cc: Ming Li <tolimit1019@gmail.com>
Subject: [Drbd-dev] [PATCH] check head in page_chain_del for every loop
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

From: Ming Li <tolimit1019@gmail.com>

there will be crash when we get a NULL head in loop.

Signed-off-by: Ming Li <tolimit1019@gmail.com>
---
 drbd/drbd_receiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index f127a235..28fb2e06 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -280,12 +280,12 @@ static struct page *page_chain_del(struct page **head, int count)
 	BUG_ON(!head);
 
 	page = READ_ONCE(*head);
-	if (!page)
-		return NULL;
 
 	do {
 		n = count;
 		rv_head = page;
+		if (!page)
+			return NULL;
 		while (true) {
 			tmp = page_chain_next(page);
 			if (--n == 0)
-- 
2.24.3 (Apple Git-128)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
