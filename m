Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPKaFDcHx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:39:51 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id F2D5934C04B
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:39:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C08C816313A;
	Fri, 27 Mar 2026 23:39:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E13241630DF
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:38:51 +0100 (CET)
Received: by mail-wr1-f47.google.com with SMTP id
	ffacd0b85a97d-439b6d9c981so1663958f8f.1
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651131;
	x=1775255931; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=WlsHszycIvw/QjzRhwmwlarVo2hjLbBll+nKLfvtHzg=;
	b=hx3HeDb7TqnaBIxoiA7YnKdIpC/ZHsPCazrS6j4dDBuHEFF/hDVBGZI1VrFDU5RFEP
	IYJCyyDW5cS1taHOUiKrUvqXMAIFF1xlNqE82RLIr1a756Zg8JRyT+kVM2fcAAmwZ42e
	MdQ3nmrTAW3y1giEHaVYQe245zv4Zk5Owf4hwtWT4kbyGdYGmcTzDpoQxp05C2MyTFw7
	cuO4sFqCMu9pabfQUbUxgkibjP03fiCnZtyilf/p2x5PnCA8FNBwqepl2fE8G/SF92Yn
	LaQwPXSfnySNFRa3dPPjUTKq1+o6xLEPaZCgsCml425aHGXPMG+qGqG1Ie9kqvaB4fx+
	M5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651131; x=1775255931;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=WlsHszycIvw/QjzRhwmwlarVo2hjLbBll+nKLfvtHzg=;
	b=hSe9x040qN+u0wnwAtXgtGSCWBmE+sEJYLlnUAkqoKnEctqArkuUQMFfD6ENlhGHz7
	ZM1XSvDz7xpJU1q5OisHOfqRdmk4j/SWzuwDskwondjwLR/lfAg+Nr3nwxv5GR7Eoqwl
	ha3RQOeaLEgjRFTGs2H6A58I21UY6+dnfZn8y/matnElCUEaixbZQMxn0ptzm50Xjm0a
	6nq5bZUenrD1TPwdztuui5MFpTB1JBx4sTkxFNNbN5GVSeyhE/TRu8j+YN1FkasVIS3q
	18Dca753lebH3Js5CyNWAQ/UFlcGOXuDjsX0YbprGbqCcfC7fDJvdD7PPN2ptdO3NSQ9
	cYgA==
X-Gm-Message-State: AOJu0YwFyWfEivQlLfR7et55Mc/hVlgsllMvT2n/QHHqUSPCy+GJRW/n
	cN6mAH9ocPDRWg5+gXMvD08xnSkNBxRWojzIQwk1kvvUXD0+MaWJe1R3fhDA5U/Z0bN4lQ==
X-Gm-Gg: ATEYQzwr3vssM60nLtAp4BpvM5n/uUmKPqu7PFWCigopp3o1hBmdjiZUCu0Qa7HGXwO
	T/WTpv81AGFunSLUXBuYfxPfuQqOwvdVkMdj1lgEaG/7z+GwSk0TEbs8niIgb/R2Nw3fP+cuwhR
	J5XQhsZ/6DhDHJO9Ab4DuBNmJ9IdZBDEQW/lgN4bqaCB0O7C8hoh7lNH4R2l/+5RYbdwBQuY5KM
	sjOYFik3knAb25Ke2Cj9nxKlKnbAGT2KH+n6QKnBHNvwOppBAsxzPGjuz+I0B/oi9cwFuaJwFev
	W/GZMyk4xE8OD/hsRpAFjWsF8qKDfh44TiIrjavXd4v4atLMfMAEpwq3d5hm5qzUumSPinTznuc
	mDgfugXSaGzElaiLTqXEzkjK/Capbs58jCZt/Z6Ff4P5agmnes8JRgZbqtm/+/xwEzwgCyjBQKV
	+iqhk+9TcgtRuL1GCSqPW9yPVhl8oBQ1EaYxd0bFu13qYSV0ikAwm3UWhv8CHIf28oLSOeVXU/y
	9yTX6ziZzrZtSVMQ2MNDA==
X-Received: by 2002:a05:6000:26c6:b0:43b:97d8:9a3d with SMTP id
	ffacd0b85a97d-43b9eaad57emr6531612f8f.9.1774651131054; 
	Fri, 27 Mar 2026 15:38:51 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.38.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:38:49 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/20] drbd: extend wire protocol definitions for DRBD 9
Date: Fri, 27 Mar 2026 23:38:02 +0100
Message-ID: <20260327223820.2244227-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
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
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.514];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: F2D5934C04B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend drbd_protocol.h with the packet types and structures needed for
multi-peer operation.

Two-phase commit (2PC) messages coordinate distributed state changes
across all peers in a cluster.
Data-generation-tag (dagtag) messages order application writes relative
to resync IO, preventing stale overwrites during concurrent resync.
Peer-acknowledgement packets carry a node bitmask so each primary can
track which peers have persisted a write.

The connection-features handshake now carries sender and receiver node
IDs, establishing peer identity at the wire level.
New feature-flag bits advertise these capabilities during negotiation,
allowing DRBD to remain wire-compatible with 8.4 peers while enabling
the full DRBD 9 feature set when both ends support it.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_protocol.h | 519 ++++++++++++++++++++++-------
 1 file changed, 403 insertions(+), 116 deletions(-)

diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
index 56bbca9d7700..886686f8cd1d 100644
--- a/drivers/block/drbd/drbd_protocol.h
+++ b/drivers/block/drbd/drbd_protocol.h
@@ -2,6 +2,9 @@
 #ifndef __DRBD_PROTOCOL_H
 #define __DRBD_PROTOCOL_H
 
+#include <linux/types.h>
+#include <linux/drbd.h>
+
 enum drbd_packet {
 	/* receiver (data socket) */
 	P_DATA		      = 0x00,
@@ -24,12 +27,12 @@ enum drbd_packet {
 	P_AUTH_RESPONSE	      = 0x11,
 	P_STATE_CHG_REQ	      = 0x12,
 
-	/* (meta socket) */
+	/* asender (meta socket */
 	P_PING		      = 0x13,
 	P_PING_ACK	      = 0x14,
 	P_RECV_ACK	      = 0x15, /* Used in protocol B */
 	P_WRITE_ACK	      = 0x16, /* Used in protocol C */
-	P_RS_WRITE_ACK	      = 0x17, /* Is a P_WRITE_ACK, additionally call set_in_sync(). */
+	P_RS_WRITE_ACK	      = 0x17, /* Write ack for resync reply. */
 	P_SUPERSEDED	      = 0x18, /* Used in proto C, two-primaries conflict detection */
 	P_NEG_ACK	      = 0x19, /* Sent if local disk is unusable */
 	P_NEG_DREPLY	      = 0x1a, /* Local disk is broken... */
@@ -41,7 +44,7 @@ enum drbd_packet {
 
 	P_OV_REQUEST	      = 0x1e, /* data socket */
 	P_OV_REPLY	      = 0x1f,
-	P_OV_RESULT	      = 0x20, /* meta socket */
+	P_OV_RESULT	      = 0x20, /* meta sock: Protocol < 122 version of P_OV_RESULT_ID */
 	P_CSUM_RS_REQUEST     = 0x21, /* data socket */
 	P_RS_IS_IN_SYNC	      = 0x22, /* meta socket */
 	P_SYNC_PARAM89	      = 0x23, /* data socket, protocol version 89 replacement for P_SYNC_PARAM */
@@ -51,32 +54,69 @@ enum drbd_packet {
 	P_DELAY_PROBE         = 0x27, /* is used on BOTH sockets */
 	P_OUT_OF_SYNC         = 0x28, /* Mark as out of sync (Outrunning), data socket */
 	P_RS_CANCEL           = 0x29, /* meta: Used to cancel RS_DATA_REQUEST packet by SyncSource */
-	P_CONN_ST_CHG_REQ     = 0x2a, /* data sock: Connection wide state request */
-	P_CONN_ST_CHG_REPLY   = 0x2b, /* meta sock: Connection side state req reply */
+	P_CONN_ST_CHG_REQ     = 0x2a, /* data sock: state change request */
+	P_CONN_ST_CHG_REPLY   = 0x2b, /* meta sock: state change reply */
 	P_RETRY_WRITE	      = 0x2c, /* Protocol C: retry conflicting write request */
 	P_PROTOCOL_UPDATE     = 0x2d, /* data sock: is used in established connections */
-        /* 0x2e to 0x30 reserved, used in drbd 9 */
+	P_TWOPC_PREPARE       = 0x2e, /* data sock: prepare state change */
+	P_TWOPC_ABORT         = 0x2f, /* data sock: abort state change */
+
+	P_DAGTAG	      = 0x30, /* data sock: set the current dagtag */
 
-	/* REQ_OP_DISCARD. We used "discard" in different contexts before,
+	/* REQ_DISCARD. We used "discard" in different contexts before,
 	 * which is why I chose TRIM here, to disambiguate. */
 	P_TRIM                = 0x31,
 
 	/* Only use these two if both support FF_THIN_RESYNC */
 	P_RS_THIN_REQ         = 0x32, /* Request a block for resync or reply P_RS_DEALLOCATED */
-	P_RS_DEALLOCATED      = 0x33, /* Contains only zeros on sync source node */
+	P_RS_DEALLOCATED      = 0x33, /* Protocol < 122 version of P_RS_DEALLOCATED_ID */
 
 	/* REQ_WRITE_SAME.
 	 * On a receiving side without REQ_WRITE_SAME,
 	 * we may fall back to an opencoded loop instead. */
 	P_WSAME               = 0x34,
-
-	/* 0x35 already claimed in DRBD 9 */
+	P_TWOPC_PREP_RSZ      = 0x35, /* PREPARE a 2PC resize operation*/
 	P_ZEROES              = 0x36, /* data sock: zero-out, WRITE_ZEROES */
 
-	/* 0x40 .. 0x48 already claimed in DRBD 9 */
+	/* place new packets for both 8.4 and 9 here,
+	 * place new packets for 9-only in the next gap. */
+
+	P_PEER_ACK            = 0x40, /* meta sock: tell which nodes have acked a request */
+	P_PEERS_IN_SYNC       = 0x41, /* data sock: Mark area as in sync */
+
+	P_UUIDS110	      = 0x42, /* data socket */
+	P_PEER_DAGTAG         = 0x43, /* data socket, used to trigger reconciliation resync */
+	P_CURRENT_UUID	      = 0x44, /* data socket */
+
+	P_TWOPC_YES           = 0x45, /* meta sock: allow two-phase commit */
+	P_TWOPC_NO            = 0x46, /* meta sock: reject two-phase commit */
+	P_TWOPC_COMMIT        = 0x47, /* data sock: commit state change */
+	P_TWOPC_RETRY         = 0x48, /* meta sock: retry two-phase commit */
+
+	P_CONFIRM_STABLE      = 0x49, /* meta sock: similar to an unsolicited partial barrier ack */
+	P_RS_CANCEL_AHEAD     = 0x4a, /* protocol version 115,
+		 * meta: cancel RS_DATA_REQUEST packet if already Ahead again,
+		 *       tell peer to stop sending resync requests... */
+	P_DISCONNECT          = 0x4b, /* data sock: Disconnect and stop connection attempts */
+
+	P_RS_DAGTAG_REQ       = 0x4c, /* data sock: Request a block for resync, with dagtag dependency */
+	P_RS_CSUM_DAGTAG_REQ  = 0x4d, /* data sock: Request a block for resync if checksum differs, with dagtag dependency */
+	P_RS_THIN_DAGTAG_REQ  = 0x4e, /* data sock: Request a block for resync or reply P_RS_DEALLOCATED, with dagtag dependency */
+	P_OV_DAGTAG_REQ       = 0x4f, /* data sock: Request a checksum for online verify, with dagtag dependency */
+	P_OV_DAGTAG_REPLY     = 0x50, /* data sock: Reply with a checksum for online verify, with dagtag dependency */
+
+	P_WRITE_ACK_IN_SYNC   = 0x51, /* meta sock: Application write ack setting bits in sync. */
+	P_RS_NEG_ACK          = 0x52, /* meta sock: Local disk is unusable writing resync reply. */
+	P_OV_RESULT_ID        = 0x53, /* meta sock: Online verify result with block ID. */
+	P_RS_DEALLOCATED_ID   = 0x54, /* data sock: Contains only zeros on sync source node. */
+
+	P_FLUSH_REQUESTS      = 0x55, /* data sock: Flush prior requests then send ack and/or forward */
+	P_FLUSH_FORWARD       = 0x56, /* meta sock: Send ack after sending P_OUT_OF_SYNC for prior P_PEER_ACK */
+	P_FLUSH_REQUESTS_ACK  = 0x57, /* data sock: Response to initiator of P_FLUSH_REQUESTS */
+	P_ENABLE_REPLICATION_NEXT = 0x58, /* data sock: whether to start replication on next resync start */
+	P_ENABLE_REPLICATION  = 0x59, /* data sock: enable or disable replication during resync */
 
 	P_MAY_IGNORE	      = 0x100, /* Flag to test if (cmd > P_MAY_IGNORE) ... */
-	P_MAX_OPT_CMD	      = 0x101,
 
 	/* special command ids for handshake */
 
@@ -86,9 +126,6 @@ enum drbd_packet {
 	P_CONNECTION_FEATURES = 0xfffe	/* FIXED for the next century! */
 };
 
-#ifndef __packed
-#define __packed __attribute__((packed))
-#endif
 
 /* This is the layout for a packet on the wire.
  * The byteorder is the network byte order.
@@ -101,24 +138,24 @@ enum drbd_packet {
  * regardless of 32 or 64 bit arch!
  */
 struct p_header80 {
-	u32	  magic;
-	u16	  command;
-	u16	  length;	/* bytes of data after this header */
+	uint32_t magic;
+	uint16_t command;
+	uint16_t length;	/* bytes of data after this header */
 } __packed;
 
 /* Header for big packets, Used for data packets exceeding 64kB */
 struct p_header95 {
-	u16	  magic;	/* use DRBD_MAGIC_BIG here */
-	u16	  command;
-	u32	  length;
+	uint16_t magic;	/* use DRBD_MAGIC_BIG here */
+	uint16_t command;
+	uint32_t length;
 } __packed;
 
 struct p_header100 {
-	u32	  magic;
-	u16	  volume;
-	u16	  command;
-	u32	  length;
-	u32	  pad;
+	uint32_t magic;
+	uint16_t volume;
+	uint16_t command;
+	uint32_t length;
+	uint32_t pad;
 } __packed;
 
 /* These defines must not be changed without changing the protocol version.
@@ -128,10 +165,10 @@ struct p_header100 {
 #define DP_HARDBARRIER	      1 /* no longer used */
 #define DP_RW_SYNC	      2 /* equals REQ_SYNC    */
 #define DP_MAY_SET_IN_SYNC    4
-#define DP_UNPLUG             8 /* not used anymore   */
+#define DP_UNPLUG             8 /* equals REQ_UNPLUG (compat) */
 #define DP_FUA               16 /* equals REQ_FUA     */
 #define DP_FLUSH             32 /* equals REQ_PREFLUSH   */
-#define DP_DISCARD           64 /* equals REQ_OP_DISCARD */
+#define DP_DISCARD           64 /* equals REQ_DISCARD */
 #define DP_SEND_RECEIVE_ACK 128 /* This is a proto B write request */
 #define DP_SEND_WRITE_ACK   256 /* This is a proto C write request */
 #define DP_WSAME            512 /* equiv. REQ_WRITE_SAME */
@@ -143,52 +180,103 @@ struct p_header100 {
  */
 
 struct p_data {
-	u64	    sector;    /* 64 bits sector number */
-	u64	    block_id;  /* to identify the request in protocol B&C */
-	u32	    seq_num;
-	u32	    dp_flags;
+	uint64_t sector;    /* 64 bits sector number */
+	uint64_t block_id;  /* to identify the request in protocol B&C */
+	uint32_t seq_num;
+	uint32_t dp_flags;
 } __packed;
 
 struct p_trim {
 	struct p_data p_data;
-	u32	    size;	/* == bio->bi_size */
+	uint32_t size;	/* == bio->bi_size */
 } __packed;
 
 struct p_wsame {
 	struct p_data p_data;
-	u32           size;     /* == bio->bi_size */
+	uint32_t size;     /* == bio->bi_size */
 } __packed;
 
 /*
- * commands which share a struct:
- *  p_block_ack:
- *   P_RECV_ACK (proto B), P_WRITE_ACK (proto C),
+ * struct p_block_ack shared by commands:
+ *   P_RECV_ACK (proto B)
+ *   P_WRITE_ACK (proto C),
+ *   P_WRITE_ACK_IN_SYNC,
  *   P_SUPERSEDED (proto C, two-primaries conflict detection)
- *  p_block_req:
- *   P_DATA_REQUEST, P_RS_DATA_REQUEST
+ *   P_RS_WRITE_ACK
+ *   P_NEG_ACK
+ *   P_NEG_DREPLY
+ *   P_NEG_RS_DREPLY
+ *   P_RS_NEG_ACK
+ *   P_OV_RESULT
+ *   P_RS_IS_IN_SYNC
+ *   P_RS_CANCEL
+ *   P_RS_DEALLOCATED_ID
+ *   P_RS_CANCEL_AHEAD
  */
 struct p_block_ack {
-	u64	    sector;
-	u64	    block_id;
-	u32	    blksize;
-	u32	    seq_num;
+	uint64_t sector;
+	uint64_t block_id;
+	uint32_t blksize;
+	uint32_t seq_num;
+} __packed;
+
+/* For P_OV_RESULT_ID. */
+struct p_ov_result {
+	uint64_t sector;
+	uint64_t block_id;
+	uint32_t blksize;
+	uint32_t seq_num;
+	uint32_t result;
+	uint32_t pad;
+} __packed;
+
+enum ov_result {
+	OV_RESULT_SKIP = 0,
+	OV_RESULT_IN_SYNC = 1,
+	OV_RESULT_OUT_OF_SYNC = 2,
+};
+
+struct p_block_req_common {
+	uint64_t sector;
+	uint64_t block_id;
+	uint32_t blksize;
 } __packed;
 
+/*
+ * struct p_block_req shared by commands:
+ *   P_DATA_REQUEST
+ *   P_RS_DATA_REQUEST
+ *   P_OV_REQUEST
+ *   P_OV_REPLY
+ *   P_CSUM_RS_REQUEST
+ *   P_RS_THIN_REQ
+ */
 struct p_block_req {
-	u64 sector;
-	u64 block_id;
-	u32 blksize;
-	u32 pad;	/* to multiple of 8 Byte */
+	/* Allow fields to be addressed directly or via req_common. */
+	union {
+		struct {
+			uint64_t sector;
+			uint64_t block_id;
+			uint32_t blksize;
+		} __packed;
+		struct p_block_req_common req_common;
+	};
+	uint32_t pad;	/* to multiple of 8 Byte */
 } __packed;
 
 /*
- * commands with their own struct for additional fields:
- *   P_CONNECTION_FEATURES
- *   P_BARRIER
- *   P_BARRIER_ACK
- *   P_SYNC_PARAM
- *   ReportParams
+ * struct p_rs_req shared by commands:
+ *   P_RS_DAGTAG_REQ
+ *   P_RS_CSUM_DAGTAG_REQ
+ *   P_RS_THIN_DAGTAG_REQ
+ *   P_OV_DAGTAG_REQ
+ *   P_OV_DAGTAG_REPLY
  */
+struct p_rs_req {
+	struct p_block_req_common req_common;
+	uint32_t dagtag_node_id;
+	uint64_t dagtag;
+} __packed;
 
 /* supports TRIM/DISCARD on the "wire" protocol */
 #define DRBD_FF_TRIM 1
@@ -243,54 +331,98 @@ struct p_block_req {
  */
 #define DRBD_FF_WZEROES 8
 
+/* Supports synchronization of application and resync IO using data generation
+ * tags (dagtags). See Documentation/application-resync-synchronization.rst for
+ * details.
+ */
+#define DRBD_FF_RESYNC_DAGTAG 16
+
+/* V2 of p_twopc_request has a 32 bit flag field and the two fields for node
+ * Ids are reduced to 8 bit instead of 32 bits.
+ *
+ * The flag TWOPC_HAS_RECHABLE indicates that in the commit phase
+ * (P_TWOPC_COMMIT) the reachable_nodes mask is set.
+ *
+ * The old behavior sends the primary_nodes mask, mask, and val in
+ * phase 2 (P_TWOPC_COMMIT), where mask and val are the same values as
+ * in phase 1 (P_TWOPC_PREPARE).
+ */
+#define DRBD_FF_2PC_V2 32
+
+/* Starting with drbd-9.1.15, a node with a backing disk sends the new
+ * current-uuid also to diskless nodes when the initial resync is
+ * skipped.
+ *
+ * The peer needs to know about this detail to apply the necessary
+ * strictness regarding downgrading its view of the partner's disk
+ * state.
+ */
+#define DRBD_FF_RS_SKIP_UUID 64
+
+/* Support for resync_without_replication.
+ */
+#define DRBD_FF_RESYNC_WITHOUT_REPLICATION 128
+
+/* Support for bitmap block size != 4k. If you connect peers with
+ * different bitmap block sizes, the resync becomes more
+ * interesting, and we need to communicate the bitmap block size.
+ */
+#define DRBD_FF_BM_BLOCK_SHIFT 256
 
 struct p_connection_features {
-	u32 protocol_min;
-	u32 feature_flags;
-	u32 protocol_max;
+	uint32_t protocol_min;
+	uint32_t feature_flags;
+	uint32_t protocol_max;
+	uint32_t sender_node_id;
+	uint32_t receiver_node_id;
 
 	/* should be more than enough for future enhancements
 	 * for now, feature_flags and the reserved array shall be zero.
 	 */
 
-	u32 _pad;
-	u64 reserved[7];
+	uint32_t _pad;
+	uint64_t reserved[6];
 } __packed;
 
 struct p_barrier {
-	u32 barrier;	/* barrier number _handle_ only */
-	u32 pad;	/* to multiple of 8 Byte */
+	uint32_t barrier;	/* barrier number _handle_ only */
+	uint32_t pad;	/* to multiple of 8 Byte */
 } __packed;
 
 struct p_barrier_ack {
-	u32 barrier;
-	u32 set_size;
+	uint32_t barrier;
+	uint32_t set_size;
+} __packed;
+
+struct p_confirm_stable {
+	uint64_t oldest_block_id;
+	uint64_t youngest_block_id;
+	uint32_t set_size;
+	uint32_t pad; /* to multiple of 8 Byte */
 } __packed;
 
 struct p_rs_param {
-	u32 resync_rate;
+	uint32_t resync_rate;
 
-	      /* Since protocol version 88 and higher. */
+	/* Since protocol version 88 and higher. */
 	char verify_alg[];
 } __packed;
 
 struct p_rs_param_89 {
-	u32 resync_rate;
+	uint32_t resync_rate;
 	/* protocol version 89: */
 	char verify_alg[SHARED_SECRET_MAX];
 	char csums_alg[SHARED_SECRET_MAX];
 } __packed;
 
 struct p_rs_param_95 {
-	u32 resync_rate;
-	struct_group(algs,
-		char verify_alg[SHARED_SECRET_MAX];
-		char csums_alg[SHARED_SECRET_MAX];
-	);
-	u32 c_plan_ahead;
-	u32 c_delay_target;
-	u32 c_fill_target;
-	u32 c_max_rate;
+	uint32_t resync_rate;
+	char verify_alg[SHARED_SECRET_MAX];
+	char csums_alg[SHARED_SECRET_MAX];
+	uint32_t c_plan_ahead;
+	uint32_t c_delay_target;
+	uint32_t c_fill_target;
+	uint32_t c_max_rate;
 } __packed;
 
 enum drbd_conn_flags {
@@ -299,35 +431,81 @@ enum drbd_conn_flags {
 };
 
 struct p_protocol {
-	u32 protocol;
-	u32 after_sb_0p;
-	u32 after_sb_1p;
-	u32 after_sb_2p;
-	u32 conn_flags;
-	u32 two_primaries;
+	uint32_t protocol;
+	uint32_t after_sb_0p;
+	uint32_t after_sb_1p;
+	uint32_t after_sb_2p;
+	uint32_t conn_flags;
+	uint32_t two_primaries;
 
 	/* Since protocol version 87 and higher. */
 	char integrity_alg[];
 
 } __packed;
 
+#define UUID_FLAG_DISCARD_MY_DATA     ((u64)1 << 0)
+#define UUID_FLAG_CRASHED_PRIMARY     ((u64)1 << 1)
+#define UUID_FLAG_INCONSISTENT        ((u64)1 << 2)
+#define UUID_FLAG_SKIP_INITIAL_SYNC   ((u64)1 << 3)
+
+#define UUID_FLAG_MASK_COMPAT_84 \
+	(UUID_FLAG_DISCARD_MY_DATA|\
+	 UUID_FLAG_CRASHED_PRIMARY|\
+	 UUID_FLAG_INCONSISTENT|\
+	 UUID_FLAG_SKIP_INITIAL_SYNC)
+
+#define UUID_FLAG_NEW_DATAGEN         ((u64)1 << 4)
+#define UUID_FLAG_STABLE              ((u64)1 << 5)
+#define UUID_FLAG_GOT_STABLE          ((u64)1 << 6) /* send UUIDs */
+#define UUID_FLAG_RESYNC              ((u64)1 << 7) /* compare UUIDs and eventually start resync */
+#define UUID_FLAG_RECONNECT           ((u64)1 << 8)
+#define UUID_FLAG_DISKLESS_PRIMARY    ((u64)1 << 9) /* Use with UUID_FLAG_RESYNC if a diskless primary is the reason */
+#define UUID_FLAG_PRIMARY_LOST_QUORUM ((u64)1 << 10)
+#define UUID_FLAG_SYNC_TARGET         ((u64)1 << 11) /* currently L_SYNC_TARGET to some peer */
+#define UUID_FLAG_HAS_UNALLOC         ((u64)1 << 12) /* highest byte contains index of not allocated bitmap uuid */
+
+#define UUID_FLAG_UNALLOC_SHIFT       56
+#define UUID_FLAG_UNALLOC_MASK        ((u64)0xff << UUID_FLAG_UNALLOC_SHIFT)
+
 struct p_uuids {
-	u64 uuid[UI_EXTENDED_SIZE];
+	uint64_t current_uuid;
+	uint64_t bitmap_uuid;
+	uint64_t history_uuids[HISTORY_UUIDS_V08];
+	uint64_t dirty_bits;
+	uint64_t uuid_flags;
+} __packed;
+
+struct p_uuids110 {
+	uint64_t current_uuid;
+	uint64_t dirty_bits;
+	uint64_t uuid_flags;
+	uint64_t node_mask; /* weak_nodes when UUID_FLAG_NEW_DATAGEN is set ;
+			       authoritative nodes when UUID_FLAG_STABLE not set */
+
+	uint64_t bitmap_uuids_mask; /* non zero bitmap UUIDS for these nodes */
+	uint64_t other_uuids[]; /* the first hweight(bitmap_uuids_mask) slots carry bitmap uuids.
+				    The node with the lowest node_id first.
+				    The remaining slots carry history uuids */
 } __packed;
 
-struct p_rs_uuid {
-	u64	    uuid;
+struct p_current_uuid {
+	uint64_t uuid;
+	uint64_t weak_nodes;
+} __packed;
+
+struct p_uuid {
+	uint64_t uuid;
 } __packed;
 
 /* optional queue_limits if (agreed_features & DRBD_FF_WSAME)
  * see also struct queue_limits, as of late 2015 */
 struct o_qlim {
 	/* we don't need it yet, but we may as well communicate it now */
-	u32 physical_block_size;
+	uint32_t physical_block_size;
 
 	/* so the original in struct queue_limits is unsigned short,
 	 * but I'd have to put in padding anyways. */
-	u32 logical_block_size;
+	uint32_t logical_block_size;
 
 	/* One incoming bio becomes one DRBD request,
 	 * which may be translated to several bio on the receiving side.
@@ -335,9 +513,9 @@ struct o_qlim {
 	 */
 
 	/* various IO hints may be useful with "diskless client" setups */
-	u32 alignment_offset;
-	u32 io_min;
-	u32 io_opt;
+	uint32_t alignment_offset;
+	uint32_t io_min;
+	uint32_t io_opt;
 
 	/* We may need to communicate integrity stuff at some point,
 	 * but let's not get ahead of ourselves. */
@@ -347,51 +525,119 @@ struct o_qlim {
 	 * more specifics.  If the backend cannot do discards, the DRBD peer
 	 * may fall back to blkdev_issue_zeroout().
 	 */
-	u8 discard_enabled;
-	u8 discard_zeroes_data;
-	u8 write_same_capable;
-	u8 _pad;
+	uint8_t discard_enabled;
+	uint8_t discard_zeroes_data;
+	uint8_t write_same_capable;
+
+	/* Bitmap block shift relative to 4k. If peers have differnt bitmap
+	 * granularity, any resync related request needs to be aligned to the
+	 * larger granularity: we can not clear partial bits.
+	 * 0 to 8 to represent 4k to 1M.
+	 * If DRBD_FF_BM_BLOCK_SHIFT is agreed on.
+	 */
+	uint8_t bm_block_shift_minus_12;
 } __packed;
 
 struct p_sizes {
-	u64	    d_size;  /* size of disk */
-	u64	    u_size;  /* user requested size */
-	u64	    c_size;  /* current exported size */
-	u32	    max_bio_size;  /* Maximal size of a BIO */
-	u16	    queue_order_type;  /* not yet implemented in DRBD*/
-	u16	    dds_flags; /* use enum dds_flags here. */
+	uint64_t d_size;  /* size of disk */
+	uint64_t u_size;  /* user requested size */
+	uint64_t c_size;  /* current exported size */
+	uint32_t max_bio_size;  /* Maximal size of a BIO */
+	uint16_t queue_order_type;  /* not yet implemented in DRBD*/
+	uint16_t dds_flags; /* use enum dds_flags here. */
 
 	/* optional queue_limits if (agreed_features & DRBD_FF_WSAME) */
 	struct o_qlim qlim[];
 } __packed;
 
 struct p_state {
-	u32	    state;
+	uint32_t state;
 } __packed;
 
 struct p_req_state {
-	u32	    mask;
-	u32	    val;
+	uint32_t mask;
+	uint32_t val;
 } __packed;
 
 struct p_req_state_reply {
-	u32	    retcode;
+	uint32_t retcode;
+} __packed;
+
+struct p_twopc_request {
+	uint32_t tid;  /* transaction identifier */
+	union {
+		struct { /* when DRBD_FF_2PC_V2 is set */
+			uint32_t flags;
+			uint16_t _pad;
+			int8_t  s8_initiator_node_id;  /* initiator of the transaction */
+			int8_t  s8_target_node_id;  /* target of the transaction (or -1) */
+		};
+		struct { /* original packet version */
+			uint32_t u32_initiator_node_id;  /* initiator of the transaction */
+			uint32_t u32_target_node_id;  /* target of the transaction (or -1) */
+		};
+	};
+	uint64_t nodes_to_reach;
+	union {
+		union { /* TWOPC_STATE_CHANGE */
+			struct {    /* P_TWOPC_PREPARE */
+				uint64_t _compat_pad;
+				uint32_t mask;
+				uint32_t val;
+			};
+			struct { /* P_TWOPC_COMMIT */
+				uint64_t primary_nodes;
+				uint64_t reachable_nodes; /* when TWOPC_HAS_RECHABLE flag is set */
+			};
+		};
+		union {	 /* TWOPC_RESIZE */
+			struct {    /* P_TWOPC_PREP_RSZ */
+				uint64_t user_size;
+				uint16_t dds_flags;
+			};
+			struct {    /* P_TWOPC_COMMIT	*/
+				uint64_t diskful_primary_nodes;
+				uint64_t exposed_size;
+			};
+		};
+	};
+} __packed;
+
+#define TWOPC_HAS_FLAGS     0x80000000 /* For packet dissectors */
+#define TWOPC_HAS_REACHABLE 0x40000000 /* The reachable_nodes field is valid */
+#define TWOPC_PRI_INCAPABLE 0x20000000 /* The primary has no access to data */
+
+struct p_twopc_reply {
+	uint32_t tid;  /* transaction identifier */
+	uint32_t initiator_node_id;  /* initiator of the transaction */
+	uint64_t reachable_nodes;
+
+	union {
+		struct { /* TWOPC_STATE_CHANGE */
+			uint64_t primary_nodes;
+			uint64_t weak_nodes;
+		};
+		struct { /* TWOPC_RESIZE */
+			uint64_t diskful_primary_nodes;
+			uint64_t max_possible_size;
+		};
+	};
 } __packed;
 
 struct p_drbd06_param {
-	u64	  size;
-	u32	  state;
-	u32	  blksize;
-	u32	  protocol;
-	u32	  version;
-	u32	  gen_cnt[5];
-	u32	  bit_map_gen[5];
+	uint64_t size;
+	uint32_t state;
+	uint32_t blksize;
+	uint32_t protocol;
+	uint32_t version;
+	uint32_t gen_cnt[5];
+	uint32_t bit_map_gen[5];
 } __packed;
 
 struct p_block_desc {
-	u64 sector;
-	u32 blksize;
-	u32 pad;	/* to multiple of 8 Byte */
+	uint64_t sector;
+	uint32_t blksize;
+	uint32_t pad;	/* to multiple of 8 Byte */
 } __packed;
 
 /* Valid values for the encoding field.
@@ -409,14 +655,55 @@ struct p_compressed_bm {
 	 * ((encoding >> 4) & 0x07): pad_bits, number of trailing zero bits
 	 * used to pad up to head.length bytes
 	 */
-	u8 encoding;
+	uint8_t encoding;
 
-	u8 code[];
+	uint8_t code[];
 } __packed;
 
 struct p_delay_probe93 {
-	u32     seq_num; /* sequence number to match the two probe packets */
-	u32     offset;  /* usecs the probe got sent after the reference time point */
+	uint32_t seq_num; /* sequence number to match the two probe packets */
+	uint32_t offset;  /* usecs the probe got sent after the reference time point */
+} __packed;
+
+struct p_dagtag {
+	uint64_t dagtag;
+} __packed;
+
+struct p_peer_ack {
+	uint64_t mask;
+	uint64_t dagtag;
+} __packed;
+
+struct p_peer_block_desc {
+	uint64_t sector;
+	uint64_t mask;
+	uint32_t size;
+	uint32_t pad;	/* to multiple of 8 Byte */
+} __packed;
+
+struct p_peer_dagtag {
+	uint64_t dagtag;
+	uint32_t node_id;
+} __packed;
+
+struct p_flush_requests {
+	uint64_t flush_sequence;
+} __packed;
+
+struct p_flush_forward {
+	uint64_t flush_sequence;
+	uint32_t initiator_node_id;
+} __packed;
+
+struct p_flush_ack {
+	uint64_t flush_sequence;
+	uint32_t primary_node_id;
+} __packed;
+
+struct p_enable_replication {
+	uint8_t enable;
+	uint8_t _pad1;
+	uint16_t _pad2;
 } __packed;
 
 /*
-- 
2.53.0

