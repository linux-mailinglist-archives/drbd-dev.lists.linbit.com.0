Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 460063DD201
	for <lists+drbd-dev@lfdr.de>; Mon,  2 Aug 2021 10:31:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92C33420620;
	Mon,  2 Aug 2021 10:31:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 597814203EF
	for <drbd-dev@lists.linbit.com>; Mon,  2 Aug 2021 10:16:12 +0200 (CEST)
Received: from BC-Mail-Ex31.internal.baidu.com (unknown [172.31.51.25])
	by Forcepoint Email with ESMTPS id 0727AEB6A3BF75144B9B;
	Mon,  2 Aug 2021 16:00:30 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
	BC-Mail-Ex31.internal.baidu.com (172.31.51.25) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2242.12; Mon, 2 Aug 2021 16:00:29 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
	BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2308.14; Mon, 2 Aug 2021 16:00:29 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <philipp.reisner@linbit.com>, <lars.ellenberg@linbit.com>,
	<axboe@kernel.dk>
Date: Mon, 2 Aug 2021 16:00:21 +0800
Message-ID: <20210802080023.1259-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) To
	BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Mon, 02 Aug 2021 10:31:27 +0200
Cc: Cai Huoqing <caihuoqing@baidu.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/2] drbd: Make use of PFN_UP helper macro
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

it's a nice refactor to make use of PFN_UP helper macro.
when run checkpath.pl for the first patch, found that
WARNING: Prefer 'unsigned int' to bare use of 'unsigned'.
so fix it. BTW

Cai Huoqing (2):
  drbd: Make use of PFN_UP helper macro
  drbd: Replace "unsigned" with "unsigned int"

 drivers/block/drbd/drbd_bitmap.c   | 2 +-
 drivers/block/drbd/drbd_receiver.c | 8 ++++----
 drivers/block/drbd/drbd_worker.c   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
