Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C58657F967
	for <lists+drbd-dev@lfdr.de>; Mon, 25 Jul 2022 08:29:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB594420634;
	Mon, 25 Jul 2022 08:29:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 55B3C4201D6
	for <drbd-dev@lists.linbit.com>; Sat, 23 Jul 2022 10:00:06 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id w185so6227663pfb.4
	for <drbd-dev@lists.linbit.com>; Sat, 23 Jul 2022 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+lfnDOjXhW7oeG1YfdtLm2gXojFDgdLapEjPNrm2eGM=;
	b=P+d5RjY4Kh2suZ/56c+y0VXrKklcrHEDMb74mAOWHVESlUV9kC1/+NnMJDrPi0kDrr
	iE4UITe/OxQnb8eRCcuSEl0YOPU5qxu93RdJD2PQW+l3gu/wTpLDE9UDh+2IA4RM4jAo
	lTKrtTxgOkfLS44KLNaNMGS2t9dVZhBdigo8TCgODn3/96rKJLG4wcwPL6HtGhlEZpqJ
	xyMbhQOG3V9mscZalmDhjely9aVDLWVoO7R0r06NS/NrrRqGYzvrSTpPR0nstKdkFMPg
	3ArlREqd9fLo6bEvySQBWNDYD20Hts96q5OtrjQTM0qNyotZZdlGKrmIRdE3NwN4Ddpc
	Ae5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+lfnDOjXhW7oeG1YfdtLm2gXojFDgdLapEjPNrm2eGM=;
	b=C/h9hWeDuQxx+L8BpBu+yJdSKsfgN9RY12oChm0smnVWQYO+NeoqhzWgeIPNtwulUI
	CqN6+SbTu7AQIIx+PO8nK4oGSOtzSN5h7G0CyoRRiM194gK1q75UxEeeh2cMdGz/fIPB
	e2pjbl9fx11JsPWCHkGT19CWh3m0RgBnpA56b2T3CGwteSv/qC70xocNXaOg6sr6s97+
	Sz/B43yPZo48Z8IoqoGdvtbWqYRCltYGs0W+92j5cCmkYjyUFcTLNxwyGIv6+koLBSgr
	5TViRqyxVoFHk7Nyxwr2w7Bg9xCFj2Pf48RSJKap9pK/Qi8Asef2mDlakAcHdontGEjY
	J3Tg==
X-Gm-Message-State: AJIora8k/ugISj8VzVDtOjPqSFI79vP7gMasZbLZGF7GoLSXOn35yyn9
	1fJf4k80YDRyJxVyhXUE/WU=
X-Google-Smtp-Source: AGRyM1s1LPV6UAsJk1cWI9v18U6ylR2x3JT4IywPniYlyfHVl9UFa45nZNpShuvzDO3wWgVixEMRew==
X-Received: by 2002:a65:6c05:0:b0:41a:d13f:f0fb with SMTP id
	y5-20020a656c05000000b0041ad13ff0fbmr1070388pgu.393.1658563205817;
	Sat, 23 Jul 2022 01:00:05 -0700 (PDT)
Received: from localhost.localdomain ([223.79.193.31])
	by smtp.gmail.com with ESMTPSA id
	a15-20020aa7970f000000b00525302fe9c4sm5245646pfg.190.2022.07.23.01.00.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Jul 2022 01:00:05 -0700 (PDT)
From: John Sanpe <sanpeqf@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com
Date: Sat, 23 Jul 2022 15:59:31 +0800
Message-Id: <20220723075931.163245-1-sanpeqf@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:29:10 +0200
Cc: John Sanpe <sanpeqf@gmail.com>, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] lib/lru_cache: Fixed array overflow caused by
	incorrect boundary handling.
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

This problem occurs when malloc element failed on the first time.
At this time, the counter i is 0. When it's released, we subtract 1
in advance without checking, which will cause i to become UINT_MAX,
resulting in array overflow.

Signed-off-by: John Sanpe <sanpeqf@gmail.com>
---
 lib/lru_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/lru_cache.c b/lib/lru_cache.c
index 52313acbfa62..04d95de92602 100644
--- a/lib/lru_cache.c
+++ b/lib/lru_cache.c
@@ -147,7 +147,7 @@ struct lru_cache *lc_create(const char *name, struct kmem_cache *cache,
 		return lc;
 
 	/* else: could not allocate all elements, give up */
-	for (i--; i; i--) {
+	while (i--) {
 		void *p = element[i];
 		kmem_cache_free(cache, p - e_off);
 	}
-- 
2.36.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
