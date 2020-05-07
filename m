Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED81F824F
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:58:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D7F14203F0;
	Sat, 13 Jun 2020 11:58:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 861B34203F0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:28 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id x13so12285576wrv.4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Unc/dfEZo0k0GpP8snfNUNAKLnalP6BKHCuPPuCUWEU=;
	b=ohRN9JzbKELYHa32aeBT7EXRMZ0V2YBmtod4PHobku1LLQyRNps5iAsaSuRkCUSmPD
	L74EBgeRe6YeB5IN1gA2x9OXKXEdIZxz7alZOqM1lhmgLlN3sP81YkH9KzxOzMh8Ju8k
	gTmVo4H4tFhvJASIAhH9inLPoNUxoDdCWjUQi9L0xlmFFZOeXYPDZFuGbxu/9qOmHgfT
	LoQ7QJ1Rq3qKQe4wScIN+Y0NeWLcAtCyUTZ+Xm2pCk6qVCv7UxkwTHuvbs6DD4oCuOSo
	FrsZcSdG3Pjyuv+NbSzPiEEeUh+BunKWyKL/NrhQyowhzKSC4KakjkWfdMHax/ycVl5k
	wcMw==
X-Gm-Message-State: AOAM531hIV5xrRvxxLtBwDs5IpyQipDENzUgUarByzxwx81rmNFJGxXh
	bXBiUYD/GbSCl58oKvwPx1BecBqRIQ7GDg==
X-Google-Smtp-Source: ABdhPJw/ai2Kr9swHNYIKpthHaxRKkghRQqkQ3gxIJzGaY9jrF4K9elJLEpjTfoAfOJ9DU8ZPaQsyw==
X-Received: by 2002:adf:9e03:: with SMTP id u3mr19296868wre.413.1592042187717; 
	Sat, 13 Jun 2020 02:56:27 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c16sm14188023wrx.4.2020.06.13.02.56.27
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:27 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:25 +0200
Resent-Message-ID: <20200613095625.GG4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5D0C4203E8
	for <drbd-dev@lists.linbit.com>; Thu,  7 May 2020 23:47:36 +0200 (CEST)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <colin.king@canonical.com>)
	id 1jWoMh-0000Um-MN; Thu, 07 May 2020 21:47:35 +0000
From: Colin King <colin.king@canonical.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
Date: Thu,  7 May 2020 22:47:35 +0100
Message-Id: <20200507214735.66114-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Drbd-dev] [PATCH] block/drbd: remove redundant initialization to
	variable rv
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

From: Colin Ian King <colin.king@canonical.com>

The variable rv is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/drbd/drbd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index c094c3c2c5d4..22dfaa91a89d 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3522,7 +3522,7 @@ void drbd_uuid_set_bm(struct drbd_device *device, u64 val) __must_hold(local)
  */
 int drbd_bmio_set_n_write(struct drbd_device *device) __must_hold(local)
 {
-	int rv = -EIO;
+	int rv;
 
 	drbd_md_set_flag(device, MDF_FULL_SYNC);
 	drbd_md_sync(device);
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
