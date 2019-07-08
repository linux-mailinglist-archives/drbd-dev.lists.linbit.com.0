Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3CD627FD
	for <lists+drbd-dev@lfdr.de>; Mon,  8 Jul 2019 20:10:00 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C667103B4DE;
	Mon,  8 Jul 2019 20:09:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3494F103B4B8
	for <drbd-dev@lists.linbit.com>; Mon,  8 Jul 2019 20:09:53 +0200 (CEST)
Received: by mail-io1-f45.google.com with SMTP id j5so17996859ioj.8
	for <drbd-dev@lists.linbit.com>; Mon, 08 Jul 2019 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:organization:subject:to:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=5+OPPKJn00aAL0TFHUXKrA2xIhsjBKG0aqEw6BPXpb8=;
	b=Q5UCI/NAeKdHz+Kg2a71aZR+OR861zohnR4WRHIhxPI9Z9qfaigP1bzGkkXziUyBwe
	x37CNijko+RgGah9S1DCn9F00CCOoSSUzI550Gu0WIddhoClI9u/tSS9T7+/0yuEgyTT
	PGn3QptkJanI7KwhikYjHmZIpZCO4wNQXs6eZHrbnxjaV7TY75mFGD0f7YdP1rxptWJH
	V0kOe2xxTrOpjlMD1Qa8rk9x4U3YF2T42brVgTP04Qvw7a7zLT5KW6a8fwnjFlJ5xwjS
	BrLtnSuMFLqtATnFPXZQjXpk5gh0wLGGkGbImCYMIvRPZz1ZT9j6I2sUONIWFHU2ZwZn
	n6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:organization:subject:to:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=5+OPPKJn00aAL0TFHUXKrA2xIhsjBKG0aqEw6BPXpb8=;
	b=lbrCGvgbjubOnJKyMsD/fAtNCZhgrUgWbM/cFsM8V8w+EW5FwLXVALKuf1oqXXD2sM
	51oZykfhXJ97arnFHUBWDYcMOevjjzcfVGFwf0THb1lu2/SsX4nX/8O4941rk6926HNc
	G+LHev51Eo9O5D0SZGRZ/D9L5gyzEW0TWwqFMJamgcBnwFPF/iOBoiDNtgC1aSNnrtNJ
	n59Ni2UT7d31dVsSi1EDobvQS3P3R5t911qY/8WMaAM07ltRgmyJ4xhRCNwZ8N0LeXC8
	+ldV+0ZIf5ODPz8mJq55bsMun2jp5wt6jYrrbYl6baFlLUacNSnjbHG0AMjucFx8pvB+
	Hkjg==
X-Gm-Message-State: APjAAAV8iTcuyYQi/TYntOtWWwUEAvlU2UCof/PjUyke6fODnJBL4GU+
	JykMaVYhjHMmndrFiMwlN2qZQwyq
X-Google-Smtp-Source: APXvYqyfH8BZXqe12s5xMbSRhr20MlrjTJrmhbxIf0fYHsBP05iBba9OUtuCg4P7ERZ1XRr7aErN7Q==
X-Received: by 2002:a6b:fd10:: with SMTP id c16mr19258605ioi.217.1562609392155;
	Mon, 08 Jul 2019 11:09:52 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191])
	by smtp.gmail.com with ESMTPSA id v3sm9027145iom.53.2019.07.08.11.09.51
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 11:09:51 -0700 (PDT)
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
To: drbd-dev@lists.linbit.com
Message-ID: <d3164ad9-e05e-5c46-aa91-9166ebe732e2@gmail.com>
Date: Mon, 8 Jul 2019 12:09:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] left shift of negative value in dcbp_set_pad_bits()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This fixes a C undefined-behavior runtime error encountered by libubsan after gcc -fsanitize=undefined:
left shift of negative value in dcbp_set_pad_bits()

I mentioned this one before, but in the context of a boring compiler warning.
The runtime undefined-behavior may make it more interesting.


diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 062c5ca1..16b4f02d 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -1832,7 +1840,7 @@ static void dcbp_set_start(struct p_compressed_bm *p, int set)
 static void dcbp_set_pad_bits(struct p_compressed_bm *p, int n)
 {
	BUG_ON(n & ~0x7);
-	p->encoding = (p->encoding & (~0x7 << 4)) | (n << 4);
+	p->encoding = (p->encoding & (~0x7u << 4)) | (n << 4);
 }
 
 static int fill_bitmap_rle_bits(struct drbd_peer_device *peer_device,
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
