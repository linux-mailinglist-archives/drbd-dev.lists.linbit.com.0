Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C0972970
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Sep 2024 08:21:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01DDF4208FD;
	Tue, 10 Sep 2024 08:21:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 587 seconds by postgrey-1.31 at mail19;
	Mon, 09 Sep 2024 15:50:30 CEST
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6B374201EE
	for <drbd-dev@lists.linbit.com>; Mon,  9 Sep 2024 15:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 8F129F90A07EC;
	Mon,  9 Sep 2024 16:40:41 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id UKXrqmmBMBf4; Mon,  9 Sep 2024 16:40:41 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 65003F90A07ED;
	Mon,  9 Sep 2024 16:40:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 65003F90A07ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1725889241;
	bh=j0w10pqKqsCrw9p4jGmOYSKGwJAYnt8q1qKqtK5tU14=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=IMmCe9UOVK5OEKqqUmeRavJNTsDhR3XSBn+T95wfSCkAxcIEbX1Qxz8IrqscPG1QW
	UBjvN4VeQ3Rp2xMIa0EO7LVnxxjDc5+yh2tgu+brpqpe6Du4bg/94KvgyBtFpFxXBY
	OHrFn9bNsqrrarPwPtO6S/qBzFtMYJMB/AOhMd8RvCSYVfzb2uH1/t9zgL/L9U/2ZX
	OCuic9PS9C+SWviPQqWBWN5Szhg5bf2F1Kbcv3+Yua3HFG6eEtLV495RynplbYh1o/
	WujCae8+G0v39cGT9ey43xxd4U+aDa6Rz9nLeDHgvF01ejZ3MlW+iHalYSEZ7p7VLt
	0f3mbo8+yYfjw==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DBj-TN5343t1; Mon,  9 Sep 2024 16:40:41 +0300 (MSK)
Received: from localhost.localdomain (unknown [89.169.48.235])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id 27DCEF90A07EC;
	Mon,  9 Sep 2024 16:40:41 +0300 (MSK)
From: Mikhail Lobanov <m.lobanov@rosalinux.ru>
To: Philipp Reisner <philipp.reisner@linbit.com>
Subject: [PATCH] drbd: Add NULL check for net_conf to prevent dereference in
	state validation
Date: Mon,  9 Sep 2024 09:37:36 -0400
Message-ID: <20240909133740.84297-1-m.lobanov@rosalinux.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 10 Sep 2024 08:21:28 +0200
Cc: Jens Axboe <axboe@kernel.dk>, lvc-project@linuxtesting.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	linux-block@vger.kernel.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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

If the net_conf pointer is NULL and the code attempts to access its=20
fields without a check, it will lead to a null pointer dereference.
Add a NULL check before dereferencing the pointer.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 44ed167da748 ("drbd: rcu_read_lock() and rcu_dereference() for tco=
nn->net_conf")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
---
 drivers/block/drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_st=
ate.c
index 287a8d1d3f70..87cf5883078f 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -876,7 +876,7 @@ is_valid_state(struct drbd_device *device, union drbd=
_state ns)
 		  ns.disk =3D=3D D_OUTDATED)
 		rv =3D SS_CONNECTED_OUTDATES;
=20
-	else if ((ns.conn =3D=3D C_VERIFY_S || ns.conn =3D=3D C_VERIFY_T) &&
+	else if (nc && (ns.conn =3D=3D C_VERIFY_S || ns.conn =3D=3D C_VERIFY_T)=
 &&
 		 (nc->verify_alg[0] =3D=3D 0))
 		rv =3D SS_NO_VERIFY_ALG;
=20
--=20
2.43.0

