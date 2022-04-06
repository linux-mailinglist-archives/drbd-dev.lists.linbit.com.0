Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C614F6990
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:07:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC471420FDD;
	Wed,  6 Apr 2022 21:07:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 727384205EF
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:30 +0200 (CEST)
Received: by mail-ej1-f42.google.com with SMTP id ot30so6169347ejb.12
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+nyp7OX1W1Fn5BbwnjKbR+lJdVHHkk18+5VS/ZBLl7Y=;
	b=Dx31FWyqp8a4yw4JDlmDuzyHowcDdFIxuWvRdZtAibJU9DCTAzyrS0NapTDIdql+yn
	UmAUPO1EiOdY7/KzHIjLA5UCc97TJ/f3Q0UxGGwLMHwTiKh2xTl6ijiU670s8fBUx84P
	eg0LFW/165hj6f3YbdLHIEljvGng9g+ZmebiUjWmf6zqJDFv3M+dcBZyl7WKsAwfcN35
	vpQhRH/XwlQ66uhfu2s+2ihvNiiPbTC1oEMih7cGIKCEV+o4k+pNFFMiQRANw4FAgD74
	Fu/zUB1FQ6a1yKp9Wb2Z1wIly37MwkjDItzBGdiHi/O2VqxEdsb9FdYLMKTaBlBA5AfK
	UtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+nyp7OX1W1Fn5BbwnjKbR+lJdVHHkk18+5VS/ZBLl7Y=;
	b=0b4S8LjbE0DBA5y3tS3KskPv5AarzK/ZcsjL5E9U6LQefsUNFHGG4Du9TjEon4OPQt
	zfZGiwwE6h270JY/y7dWgxrvCL6ObhC/KCGlXZWrTntczit6LhLv6Ss+PA1K9EA+LLt5
	zaIrWOHya+x7WHBWkm9sSQ2rwlc1qOhnzc/hJNhuLjV+DxFctek44QULyKVm0R6lxryV
	J84IeQnBLIo5RS0XqxKvfLdbdAUfJv4SsFy1WB50ZeNPAXqRu/qOKjwDQloWBkA5Q6xL
	nsD8ekDRgHimPmW5hWYkTAs0vGS7/Esce7YzqrmzPCnAz5WFyY3sivxp4rI0IYSy016p
	OnNA==
X-Gm-Message-State: AOAM5318iyb7eSF16tjM1i9DTfqUWDE/SdVblqDz3PyPOJBd+7Ymt8BX
	dyx5eCKFS1bSkw2V9G1NegiMK5J0
X-Google-Smtp-Source: ABdhPJysIJlKR0YpwnjF/Bo3FpPKzC8wDAcVGAN6w8AohntTEfCK5iYxD9mV6tlmoAskOH4ROIB49g==
X-Received: by 2002:a17:907:2d90:b0:6db:729e:7f25 with SMTP id
	gt16-20020a1709072d9000b006db729e7f25mr9911182ejc.203.1649272049814;
	Wed, 06 Apr 2022 12:07:29 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	z6-20020a056402274600b004194fc1b7casm8249210edd.48.2022.04.06.12.07.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:29 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:08 +0200
Message-Id: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/7] DRBD updates for 5.19
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

Mostly cosmetic changes, bound for 5.19.

Arnd Bergmann (2):
  drbd: fix duplicate array initializer
  drbd: address enum mismatch warnings

Cai Huoqing (2):
  drbd: Make use of PFN_UP helper macro
  drbd: Replace "unsigned" with "unsigned int"

Haowen Bai (1):
  drbd: Return true/false (not 1/0) from bool functions

Jiapeng Chong (1):
  block: drbd: drbd_receiver: Remove redundant assignment to err

Uladzislau Rezki (Sony) (1):
  drdb: Switch to kvfree_rcu() API

 drivers/block/drbd/drbd_bitmap.c   |  2 +-
 drivers/block/drbd/drbd_main.c     | 11 +++++-----
 drivers/block/drbd/drbd_nl.c       | 33 +++++++++++++++---------------
 drivers/block/drbd/drbd_receiver.c | 15 ++++++--------
 drivers/block/drbd/drbd_req.c      |  2 +-
 drivers/block/drbd/drbd_state.c    |  3 +--
 drivers/block/drbd/drbd_worker.c   |  2 +-
 7 files changed, 32 insertions(+), 36 deletions(-)

-- 
2.35.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
