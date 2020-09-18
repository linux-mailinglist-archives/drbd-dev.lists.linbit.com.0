Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43D28BBFF
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:33:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D385A4203C8;
	Mon, 12 Oct 2020 17:33:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01302420317
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:33:30 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id o18so17433708edq.4
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id;
	bh=013g0i8QlKeYIa+PQabY8G8McburlFG37viq6GvIofg=;
	b=j7aL5rP0aGoy3IOKOCqmTh3KNehQQJKVFspwk6YxdduZnsoCVlkfBK37EFt67T0D9P
	v6X6wlglxvNnmc/UEopmtKEaQaX5mDPRjwcP5rZzPzUgabl+wjutnFlGmEYMYwzNE4tc
	fRSQXfLIMqKZOiAlqYrd9dQitwdjopMLbpjOFt8B7B1DNlU9n44I1qGUwPQVC7oCWB9D
	WutruWqY3qkPM/YkacYtc4d4EUqVnlsH4r3UM9R+VW8guQhTijWy1lPFXNB7olW534sf
	q6DFUWbJzlmQTrYfsOEMm0qojnS3upDtz58A4QtFvkgExr1q0/E+NJeoyZ4+afDpXtTB
	0hGg==
X-Gm-Message-State: AOAM533bVvm4Q6ypAuHiWPhW5xBuXINlptRQHUqaVKy6u1RiQThxVL4T
	QylpwwurkE5FKRzZb9VXiVKLvABsOw5qBl1+
X-Google-Smtp-Source: ABdhPJzyMnDFXGh8qHwjabbDmkgfNladn7CzpDiGZVqb1H4aYSRk4uzI/R7bUMM8K3wUp0FFCIigbA==
X-Received: by 2002:a05:6402:28e:: with SMTP id
	l14mr14616452edv.157.1602516750390; 
	Mon, 12 Oct 2020 08:32:30 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	j22sm10705107edp.77.2020.10.12.08.32.29
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:32:29 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:32:28 +0200
Resent-Message-ID: <20201012153228.GM2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 513 seconds by postgrey-1.31 at mail19;
	Fri, 18 Sep 2020 07:33:46 CEST
Received: from m97179.mail.qiye.163.com (m97179.mail.qiye.163.com
	[220.181.97.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3EDF420E62
	for <drbd-dev@lists.linbit.com>; Fri, 18 Sep 2020 07:33:46 +0200 (CEST)
Received: from atest-guest.localdomain (unknown [218.94.118.90])
	by m97179.mail.qiye.163.com (Hmail) with ESMTPA id BCA21E0253B;
	Fri, 18 Sep 2020 13:25:10 +0800 (CST)
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
To: drbd-dev@lists.linbit.com,
	philipp.reisner@linbit.com
Date: Fri, 18 Sep 2020 05:25:08 +0000
Message-Id: <1600406708-15123-1-git-send-email-dongsheng.yang@easystack.cn>
X-Mailer: git-send-email 1.8.3.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSUI3V1ktWUFJV1kPCR
	oVCBIfWUFZGkNDH0geTx0aQklIVkpNS0tPS01MSktCSklVGRETFhoSFyQUDg9ZV1kWGg8SFR0UWU
	FZT0tIVUpKS0JITVVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6Pio4FD5PDRVWAwswTxQq
	KygKCR9VSlVKTUtLT0tNTEpKS0lDVTMWGhIXVR8UFRwIEx4VHFUCGhUcOx4aCAIIDxoYEFUYFUVZ
	V1kSC1lBWUlKQ1VCT1VKSkNVQktZV1kIAVlBSUtISzcG
X-HM-Tid: 0a749fac6a5020bdkuqybca21e0253b
Cc: Dongsheng Yang <dongsheng.yang@easystack.cn>
Subject: [Drbd-dev] [PATCH] drbd_state: dont clear NEW_CUR_UUID when
	re-gained quorum
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

We cant clear NEW_CUR_UUID when we re-gain quorum, because
there is a secondary offline.

E.g:
There is a cluster with 3 nodes, 1 primary (node-1), 2 secondary (node-2, node-3)

(1) all uptodate, primary with quorum=2, quorum-minimum-redundancy=2.
(2) node-1 network error -> node-1 lost quorum
(3) node-3 down.
(4) node-1 network recovery -> node-1 regain quorum, clear NEW_CUR_UUID (node-1 uptodate, node-2 uptodate, node-3 offline)
(5) write data on primary node. -> as NEW_CUR_UUID cleared, the uuid is old.
(6) node-3 up. -> as the uuid in primary is old, same with what in node-3. there is no-sync.

Then we will loss the new data in node-3.

To fix it, dont clear NEW_CUR_UUID in (4).

Fixes: aaaa257b837a26ac4a38f2e86632d682fc57a2
Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_state.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 5b1744a..358bcc0 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -2592,7 +2592,6 @@ static void finish_state_change(struct drbd_resource *resource, struct completio
 
 		if (!device->have_quorum[OLD] && device->have_quorum[NEW]) {
 			clear_bit(PRIMARY_LOST_QUORUM, &device->flags);
-			clear_bit(NEW_CUR_UUID, &device->flags);
 		}
 	}
 
-- 
1.8.3.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
