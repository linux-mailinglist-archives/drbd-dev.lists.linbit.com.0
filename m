Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 256ADC2D2AD
	for <lists+drbd-dev@lfdr.de>; Mon, 03 Nov 2025 17:36:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3325D1627A4;
	Mon,  3 Nov 2025 17:36:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09ADC162276
	for <drbd-dev@lists.linbit.com>; Sat,  1 Nov 2025 06:44:36 +0100 (CET)
Received: by mail-pg1-f173.google.com with SMTP id
	41be03b00d2f7-b6cea7c527bso2445285a12.3
	for <drbd-dev@lists.linbit.com>; Fri, 31 Oct 2025 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1761975876; x=1762580676;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=hXfrEv5oiBHpW6muXJlmwbpRlo7zdmnpcibEEEHdvoI=;
	b=l3c71xMFGBjSU7e4Le3cm/WE/WKxFC64AX7xePAzvoXVEwCDZYTqtqJgTuC/muvTBS
	eVerwSExP9aGiqKG8lt8/WdtNZyggXIsne9/orgg1KIGdWYyhyG8UnVzXYkQn4bpRjGu
	tN8ZNgETH0Sj21Erf+hUYQWSSI27sqObWQuyexDFE7hv+QfaMl7WON7jZSvYwCJmqpM2
	pZOghWD6+Ub6+4Hk7PuzA+fh6aVyu+wfHroBMeZHF7HnrMI1vXHYBdnhn0jUsB9q3s7b
	tkwnmHHqDPKhUJE3WML2e6HW9IST1ODXHH6Ag05qRkmnlLYPVyOpkbRj8w1vUBmqy7QT
	4VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1761975876; x=1762580676;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=hXfrEv5oiBHpW6muXJlmwbpRlo7zdmnpcibEEEHdvoI=;
	b=HNKUZnBPqYyl2KgxKwTN5UKhfYaECNpYCPYTC8opG+n1bXZauiKfJsCBhix0KKkm5c
	xVFVDYY58YXVynT85b7WySDV/NlUmm3pb3wueSr0i6JddeBMAFkj+r5xnFsjpx5wOTrn
	MiF/KuXh2WFv+k6CmfPfeR3uxwLVFUZEW0h8oaLoBElGKTrCN9ablCyiIiqEgGtuiwi6
	8BrnaPJISLhbBPGFKv/ks6nxhVzvAJRZRUIoJ8GYvhekpNi5DdFOcPi2t7LAKU+FXt8D
	YY6rervYuH3506hSVXpZkFbirGM0vSjPXGCcUPgt4IY0PlBEuqmN1iAKVzrqwGCnqBnu
	m+cw==
X-Forwarded-Encrypted: i=1;
	AJvYcCVaRK0xhs3AyEi+k9dFwzi/O4+TLZ3HjOkFxiLnFZeJM3juEGO8zx7AOs+1zgs9igJYKcy+u6k82g==@lists.linbit.com
X-Gm-Message-State: AOJu0YwiyTwSz6PCkMnG+tu98FMKDjiBYEtTDYL64iny1C/ydx4tTEFi
	LC3Ph7SVPhalzV7GoAD4+NpvOBUPULHeEIKNhxuGlf3NsmEABJWsbfIx
X-Gm-Gg: ASbGncs9nqy3WI3qH2JDVti8FYDd9AdCcFygZ1HT13Y52zhvBQKQltfbnkydAdq2Z7w
	nRCOlm+vOC7lN9CrujJ3eCFVocg7B9JV7GqGeAdlKSQjsAHCvI62XzzfHzde7XFODAkrEavDjmK
	NJyx/yjWa/DE3ekf+vmDWWtSEW+sNaRcNSTdjwon/lVBTVGbc1ejcLRkN/xSLK5OzvsGh5YJoXF
	sXG16oB2SDy8dvRWdIyfniWRmGEYjjiwtNJIqh0EMGWayV7A9VqrauhmWmzJJE5cohq8WDFyQBi
	LM/dhs8Se1sFXNmnyW8eDUFFIWas+qAS7GCXMxvepmbwPHa584CDpbBTqOgVOraWGHTH+SR7wz8
	YSskqdaoeYuM5PwAjadmyfZXgjV0TjWEI+6UBLrFpBlyyVB1/XsGLkkWYhO8/HHzte6ChA1ty
X-Google-Smtp-Source: AGHT+IEGJ4mGhF1h11nXlNMyKOMIlTHFuQycoD3FINV1TwEi5cyxUm493MSp+VBY0wey3CeA3mtjJQ==
X-Received: by 2002:a05:6a20:3d86:b0:334:8ac9:bc5 with SMTP id
	adf61e73a8af0-348cc8e5729mr8648568637.36.1761975875916; 
	Fri, 31 Oct 2025 22:44:35 -0700 (PDT)
Received: from fedora ([38.137.53.248]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7a7d897e86fsm4067572b3a.11.2025.10.31.22.44.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Oct 2025 22:44:35 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: philipp.reisner@linbit.com
Subject: [PATCH] drbd: replace kmap() with kmap_local_page() in receiver path
Date: Sat,  1 Nov 2025 11:14:22 +0530
Message-ID: <20251101054422.17045-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Nov 2025 17:36:08 +0100
Cc: axboe@kernel.dk, i.shihao.999@gmail.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Use kmap_local_page() instead of kmap() to avoid
CPU contention.

kmap() uses a global set of mapping slots that can cause contention
between multiple CPUs, while kmap_local_page() uses per-CPU slots
eliminating this contention. It also ensures non-sleeping operation
and provides better cache locality.

Convert kmap() to kmap_local_page() as it aligns with ongoing
kernel efforts to modernize kmap() usage for better multi-core
scalability.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/block/drbd/drbd_receiver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index caaf2781136d..14821420ea50 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1736,13 +1736,13 @@ read_in_block(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
 	page = peer_req->pages;
 	page_chain_for_each(page) {
 		unsigned len = min_t(int, ds, PAGE_SIZE);
-		data = kmap(page);
+		data = kmap_local_page(page);
 		err = drbd_recv_all_warn(peer_device->connection, data, len);
 		if (drbd_insert_fault(device, DRBD_FAULT_RECEIVE)) {
 			drbd_err(device, "Fault injection: Corrupting data on receive\n");
 			data[0] = data[0] ^ (unsigned long)-1;
 		}
-		kunmap(page);
+		kunmap_local(data);
 		if (err) {
 			drbd_free_peer_req(device, peer_req);
 			return NULL;
@@ -1777,7 +1777,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)

 	page = drbd_alloc_pages(peer_device, 1, 1);

-	data = kmap(page);
+	data = kmap_local_page(page);
 	while (data_size) {
 		unsigned int len = min_t(int, data_size, PAGE_SIZE);

@@ -1786,7 +1786,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
 			break;
 		data_size -= len;
 	}
-	kunmap(page);
+	kunmap_local(data);
 	drbd_free_pages(peer_device->device, page);
 	return err;
 }
--
2.51.0

