Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DFA29A4C7
	for <lists+drbd-dev@lfdr.de>; Tue, 27 Oct 2020 07:37:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6E2E5420629;
	Tue, 27 Oct 2020 07:37:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19D2F420621
	for <drbd-dev@lists.linbit.com>; Mon, 26 Oct 2020 22:57:54 +0100 (CET)
Received: from localhost.localdomain (unknown [192.30.34.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1D396207E8;
	Mon, 26 Oct 2020 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603749063;
	bh=f18+YYO36+VPphTtiqB2BItLkQXJGL58MdoL6F+07ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arg345ekDPB+aYgx7YEhAXpCXOxypeKaeML9Sk4wxNp2TKPUrXFcnxv1RB8ks2+BH
	eems8pMSm3vn4pcR3xmKraOxrUT4zePERaecUbGd4YRU64BDl48+lSwgLW5hSIEBX6
	TMPZ4znkbFJuR9ZeyVBTJUTCqdYvNmJdeMGYwhAE=
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
Date: Mon, 26 Oct 2020 22:50:34 +0100
Message-Id: <20201026215043.3893318-2-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201026215043.3893318-1-arnd@kernel.org>
References: <20201026215043.3893318-1-arnd@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Oct 2020 07:37:48 +0100
Cc: Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/2] drbd: address enum mismatch warnings
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

From: Arnd Bergmann <arnd@arndb.de>

gcc -Wextra warns about mixing drbd_state_rv with drbd_ret_code
in a couple of places:

drivers/block/drbd/drbd_nl.c: In function 'drbd_adm_set_role':
drivers/block/drbd/drbd_nl.c:777:14: warning: comparison between 'enum drbd_state_rv' and 'enum drbd_ret_code' [-Wenum-compare]
  777 |  if (retcode != NO_ERROR)
      |              ^~
drivers/block/drbd/drbd_nl.c:784:12: warning: implicit conversion from 'enum drbd_ret_code' to 'enum drbd_state_rv' [-Wenum-conversion]
  784 |    retcode = ERR_MANDATORY_TAG;
      |            ^
drivers/block/drbd/drbd_nl.c: In function 'drbd_adm_attach':
drivers/block/drbd/drbd_nl.c:1965:10: warning: implicit conversion from 'enum drbd_state_rv' to 'enum drbd_ret_code' [-Wenum-conversion]
 1965 |  retcode = rv;  /* FIXME: Type mismatch. */
      |          ^
drivers/block/drbd/drbd_nl.c: In function 'drbd_adm_connect':
drivers/block/drbd/drbd_nl.c:2690:10: warning: implicit conversion from 'enum drbd_state_rv' to 'enum drbd_ret_code' [-Wenum-conversion]
 2690 |  retcode = conn_request_state(connection, NS(conn, C_UNCONNECTED), CS_VERBOSE);
      |          ^
drivers/block/drbd/drbd_nl.c: In function 'drbd_adm_disconnect':
drivers/block/drbd/drbd_nl.c:2803:11: warning: implicit conversion from 'enum drbd_state_rv' to 'enum drbd_ret_code' [-Wenum-conversion]
 2803 |   retcode = rv;  /* FIXME: Type mismatch. */
      |           ^

In each case, both are passed into drbd_adm_finish(), which just takes
a 32-bit integer and is happy with either, presumably intentionally.

Restructure the code to pass either type directly in there in most
cases, avoiding the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/drbd/drbd_nl.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index bf7de4c7b96c..3d6995ee675b 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -770,6 +770,7 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 	struct set_role_parms parms;
 	int err;
 	enum drbd_ret_code retcode;
+	enum drbd_state_rv rv;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
@@ -790,12 +791,14 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 	mutex_lock(&adm_ctx.resource->adm_mutex);
 
 	if (info->genlhdr->cmd == DRBD_ADM_PRIMARY)
-		retcode = drbd_set_role(adm_ctx.device, R_PRIMARY, parms.assume_uptodate);
+		rv = drbd_set_role(adm_ctx.device, R_PRIMARY, parms.assume_uptodate);
 	else
-		retcode = drbd_set_role(adm_ctx.device, R_SECONDARY, 0);
+		rv = drbd_set_role(adm_ctx.device, R_SECONDARY, 0);
 
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
 	genl_lock();
+	drbd_adm_finish(&adm_ctx, info, rv);
+	return 0;
 out:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
@@ -1962,7 +1965,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	drbd_flush_workqueue(&connection->sender_work);
 
 	rv = _drbd_request_state(device, NS(disk, D_ATTACHING), CS_VERBOSE);
-	retcode = rv;  /* FIXME: Type mismatch. */
+	retcode = (enum drbd_ret_code)(int)rv;  /* FIXME: Type mismatch. */
 	drbd_resume_io(device);
 	if (rv < SS_SUCCESS)
 		goto fail;
@@ -2568,6 +2571,7 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	struct drbd_resource *resource;
 	struct drbd_connection *connection;
 	enum drbd_ret_code retcode;
+	enum drbd_state_rv rv;
 	int i;
 	int err;
 
@@ -2687,11 +2691,11 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	}
 	rcu_read_unlock();
 
-	retcode = conn_request_state(connection, NS(conn, C_UNCONNECTED), CS_VERBOSE);
+	rv = conn_request_state(connection, NS(conn, C_UNCONNECTED), CS_VERBOSE);
 
 	conn_reconfig_done(connection);
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	drbd_adm_finish(&adm_ctx, info, rv);
 	return 0;
 
 fail:
@@ -2799,11 +2803,12 @@ int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info)
 
 	mutex_lock(&adm_ctx.resource->adm_mutex);
 	rv = conn_try_disconnect(connection, parms.force_disconnect);
-	if (rv < SS_SUCCESS)
-		retcode = rv;  /* FIXME: Type mismatch. */
-	else
-		retcode = NO_ERROR;
 	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	if (rv < SS_SUCCESS) {
+		drbd_adm_finish(&adm_ctx, info, rv);
+		return 0;
+	}
+	retcode = NO_ERROR;
  fail:
 	drbd_adm_finish(&adm_ctx, info, retcode);
 	return 0;
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
