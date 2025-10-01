Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 16108BC4509
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Oct 2025 12:27:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 723BE162773;
	Wed,  8 Oct 2025 12:27:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 547 seconds by postgrey-1.31 at mail19;
	Wed, 01 Oct 2025 12:35:27 CEST
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D6FD160990
	for <drbd-dev@lists.linbit.com>; Wed,  1 Oct 2025 12:35:27 +0200 (CEST)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1759314379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding;
	bh=nfgEVOB3DZQ6/kGEtKzVJBDpgTIVIwUcLDFO2qRH4V4=;
	b=Y3Kx4jJtMijcjrfdGyIl1ZbwTNaaOMfm8177xkBDBVYvTOPoeujjuxwTlvo2lEj0ZQFn1F
	mNYctUeqTJuu4MZciKvB2Ai8YqECPNxjB2AX7CZ3iQimhxvuU6c0Olu8bKyWkq6Fzhf+Rt
	Fg0BMN5YVPCkUTrbO9+dTCTYT0yhzdU=
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [bug-report] NULL pointer dereference in __drbd_change_sync()
Date: Wed,  1 Oct 2025 13:26:14 +0300
Message-ID: <20251001102619.8912-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Oct 2025 12:27:12 +0200
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	lvc-project@linuxtesting.org, drbd-dev@lists.linbit.com
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

In the Linux kernel, there's an unpatched bug in the DRBD code in the __drbd_change_sync() function,
a NULL pointer dereference.

The call stack that leads to this error looks like this:

drbd_request_endio
|-> __req_mod(req, what, NULL, &m);
    |-> case READ_COMPLETED_WITH_ERROR:
    |-> drbd_set_out_of_sync(NULL, ... )
    	|-> __drbd_change_sync(NULL, ... );
            |-> peer_device->device (NULL->device)

This bug has already been fixed here [1], but porting this commit to the kernel will be quite
difficult, since the DRBD code in the Linux kernel and on GitHub [2] differs significantly.

But ignoring it is also not a good idea.

The blamed kernel commit is 0d11f3cf279c ("drbd: Pass a peer device to the resync and online verify functions")
which came with series [3].

One possible solution is to reverse the patch series [3] because "it is mainly no-ops, pretty much just 
preparation for future upstreaming work" as its cover letter says.  

However, there seems to be no active drbd module development in mainline kernel since that series was posted in 2023.

[1]: https://github.com/LINBIT/drbd/commit/effc7281bf1a7922daa6393632fc6eeac1732bfa
[2]: https://github.com/LINBIT/drbd
[3]: https://lore.kernel.org/all/20230330102744.2128122-1-christoph.boehmwalder@linbit.com/

Found by Linux Verification Center (linuxtesting.org) with SVACE.

-- 
2.43.0

