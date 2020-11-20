Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4A2BFFE7
	for <lists+drbd-dev@lfdr.de>; Mon, 23 Nov 2020 07:21:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F3334207A4;
	Mon, 23 Nov 2020 07:21:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 244EC42062D
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 19:28:02 +0100 (CET)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5D6772224C;
	Fri, 20 Nov 2020 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605896881;
	bh=kZP/yJ0fC48nk2mQjLHjxqe4jwNkrL9OlMX67rrCfeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSGFVJL9JogUdypN/ZQyffCYDFsJCGJixU+LHOGoE5LJZ6ez1a/tr/mVSC6YJKauR
	3BPVhKZKtScgBwYWR4sYpZ3ohALDf8WFjDkB7GVCOROu/g9eu2wkT2hn2knGy8pEvX
	lCGdldmuh5vBvBDOmfhVQjMMdSd7z1YzrlgMaMUo=
Date: Fri, 20 Nov 2020 12:28:06 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
Message-ID: <44663f18fb12e39c53b0e69039c98505b7c6d5da.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 23 Nov 2020 07:21:47 +0100
Cc: linux-block@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 027/141] drbd: Fix fall-through warnings for Clang
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
of warnings by explicitly adding a break statement instead of just
letting the code fall through to the next, and by adding a fallthrough
pseudo-keyword in places whre the code is intended to fall through.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/block/drbd/drbd_receiver.c | 1 +
 drivers/block/drbd/drbd_req.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index dc333dbe5232..c19bb74ac935 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5863,6 +5863,7 @@ static int got_NegRSDReply(struct drbd_connection *connection, struct packet_inf
 		switch (pi->cmd) {
 		case P_NEG_RS_DREPLY:
 			drbd_rs_failed_io(device, sector, size);
+			break;
 		case P_RS_CANCEL:
 			break;
 		default:
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 330f851cb8f0..9f212a923a3c 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -750,6 +750,7 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
 
 	case WRITE_ACKED_BY_PEER_AND_SIS:
 		req->rq_state |= RQ_NET_SIS;
+		fallthrough;
 	case WRITE_ACKED_BY_PEER:
 		/* Normal operation protocol C: successfully written on peer.
 		 * During resync, even in protocol != C,
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
