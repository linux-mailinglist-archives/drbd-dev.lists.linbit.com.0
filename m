Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F916180305
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Mar 2020 17:18:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 216894203E2;
	Tue, 10 Mar 2020 17:18:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA0664203D3
	for <drbd-dev@lists.linbit.com>; Tue, 10 Mar 2020 17:18:28 +0100 (CET)
Received: by mail-wm1-f68.google.com with SMTP id a5so2094760wmb.0
	for <drbd-dev@lists.linbit.com>; Tue, 10 Mar 2020 09:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id:feedback-id;
	bh=61UuijkIsbPc58m/ng1Ajcvn3r5vA+o8lsPGEXdAd6k=;
	b=ODeIgtsmbt6sXD7HIjp58hwx2pHI4E3x5zlwEV3SQpxrwQbiL5/QEoMP3zEofpzq68
	HyAUbac82nSkCGOnkA/fuH0CitVmJDhlqrDg+htwE1brTpN96KfeyIydguAlJJ7KUvUc
	Nk/XTdtIpv6eDjP46Kh9lQCKLENYHiRVJrhDbQ2FxZcY4qF9PjoYcobmWkSkRFYsJ5lv
	njgMq42B0PWbKBihqGEidAMxqPou/DnDT6ZBdcxTl2XEbZ0s2iMplrpQx9WMAQkwE1/Z
	bwInWJcQoTX0dqyvFehDrPr2L3iG65eeSyIihRpZ9oEhQ2GuUvY4RsZcZijUcJvfLmM2
	FmNg==
X-Gm-Message-State: ANhLgQ1+JA2v0+zdkRFlKRh0wjwpjMvaOEH4t+TZiUnnbltsl9/W0bdX
	gZ80c/FnAM9wCQRLv0dzfvwJxwtVfTbxIzz9
X-Google-Smtp-Source: ADFU+vvMaXlnHYTciU8vL5HrRvRQcm1ArbKFlY/Hd55+a3ESGPRk5GOAubxtcw6ihOvgxHs/RPukYA==
X-Received: by 2002:a1c:a714:: with SMTP id q20mr2873985wme.148.1583857107773; 
	Tue, 10 Mar 2020 09:18:27 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id d1sm3916641wrw.52.2020.03.10.09.18.27
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Mar 2020 09:18:27 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Tue, 10 Mar 2020 17:18:25 +0100
Resent-Message-ID: <20200310161825.GB10072@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 309 seconds by postgrey-1.31 at mail19;
	Sat, 07 Mar 2020 03:46:10 CET
Received: from qq.com (smtpbg477.qq.com [59.36.132.88])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 33FF5420385
	for <drbd-dev@lists.linbit.com>; Sat,  7 Mar 2020 03:46:09 +0100 (CET)
X-QQ-mid: bizesmtp26t1583548766t2eox8l2
Received: from localhost.localdomain (unknown [218.76.23.26])
	by esmtp10.qq.com (ESMTP) with 
	id ; Sat, 07 Mar 2020 10:39:25 +0800 (CST)
X-QQ-SSF: 01400000000000V0Z[F0000A0000000
X-QQ-FEAT: S722vhW538PuPVCP1S3NbgNB6Wl1yePiO7+WOHFrhlHwdWugekbFHKAHy9tMp
	4uQCMY03RB21QaOFOdHY991kCM8edIng92kIUAZ455g2ipF/Z06CwKIbjREBkQaqEICcFh4
	BsW1Kyjrp/PvI6irxXXM3r8MdQJa7yVAy90Y3ZFdZdoWhTz+43ksHTIhEotYo3Vb4lZbo5N
	yzd7ghWg2PhZcJQZKD6IM+6FvQcPG0nJI5lETo7i9S2cIqcSZJSU0Fode2SC6F2YJ7XiGF9
	mkdIjjAVAo35byeo06dl8owt30LHJJD6aMpEWie86UMF7GtaZ3xF2kcqUV3/QrYTw3LeJ1s
	r9F04zq
X-QQ-GoodBg: 2
From: Jackie Liu <liuyun01@tj.kylinos.cn>
To: axboe@kernel.dk
Date: Sat,  7 Mar 2020 10:39:25 +0800
Message-Id: <20200307023925.20789-1-liuyun01@tj.kylinos.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] block/drbd: delete invalid function
	drbd_md_mark_dirty_
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

From: Jackie Liu <liuyun01@kylinos.cn>

We deleted last_md_mark_dirty long ago, this function no longer needs to
exist, delete it, otherwise a compilation error will occur when DEBUG is
opened.

Fixes: ac0acb9e39ac ("drbd: use drbd_device_post_work() in more place")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/block/drbd/drbd_main.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index a18155cdce41..6fc776ccef3e 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3414,22 +3414,11 @@ int drbd_md_read(struct drbd_device *device, struct drbd_backing_dev *bdev)
  * the meta-data super block. This function sets MD_DIRTY, and starts a
  * timer that ensures that within five seconds you have to call drbd_md_sync().
  */
-#ifdef DEBUG
-void drbd_md_mark_dirty_(struct drbd_device *device, unsigned int line, const char *func)
-{
-	if (!test_and_set_bit(MD_DIRTY, &device->flags)) {
-		mod_timer(&device->md_sync_timer, jiffies + HZ);
-		device->last_md_mark_dirty.line = line;
-		device->last_md_mark_dirty.func = func;
-	}
-}
-#else
 void drbd_md_mark_dirty(struct drbd_device *device)
 {
 	if (!test_and_set_bit(MD_DIRTY, &device->flags))
 		mod_timer(&device->md_sync_timer, jiffies + 5*HZ);
 }
-#endif
 
 void drbd_uuid_move_history(struct drbd_device *device) __must_hold(local)
 {
-- 
2.17.1



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
