Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A87923F1
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Sep 2023 17:30:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8721042018E;
	Tue,  5 Sep 2023 17:30:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 398 seconds by postgrey-1.31 at mail19;
	Tue, 05 Sep 2023 17:30:02 CEST
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 170744203B2
	for <drbd-dev@lists.linbit.com>; Tue,  5 Sep 2023 17:30:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 83970CE10AF;
	Tue,  5 Sep 2023 15:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F205C433C7;
	Tue,  5 Sep 2023 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693927400;
	bh=b8FXi5LVOEJ45GJEfo/UiUAsAx/HMkBVqH0nN5nHXFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K1tYCEHexNxmxcgaemhfzAVT3mDlnxjFMCMW6GUUaaXkN0XjAhRopDkITbvKnZvF+
	B6qGzEzg96qIZVfJumcDs9i9kPw+yM+pcpLGIHkelti9ZdW+ljVE9O/SCmQSfKjEQu
	+6mNh57PspluAWn5LIyG4LpbnR1yGBKETlmX3Fh4i7ug4hvgwWMDa4rtxnrb+bwMnM
	mMhkucq8nbGhSSik1WAeQ5IB5yHn3vPQcJBhrPvd88aCFfCbPyXVzq0Daj/T8eUkjY
	FPycfq0xhgoHAxarkV/ixuSL+K4Zc0OCW/RJGyB/qP/EtZvfAvXSo0LMggRGSBDXpj
	n+iYuOZgryU6A==
Date: Tue, 5 Sep 2023 08:23:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Serguei Ivantsov <manowar@gsc-game.com>
Message-ID: <20230905082319.74537cdd@kernel.org>
In-Reply-To: <CAKH+VT2PQc3NoMZ0Lj13-mRu=kqSHJx_OSQtURB=xvo18jXq1g@mail.gmail.com>
References: <CAKH+VT2PQc3NoMZ0Lj13-mRu=kqSHJx_OSQtURB=xvo18jXq1g@mail.gmail.com>
MIME-Version: 1.0
Cc: David Howells <dhowells@redhat.com>, regressions@lists.linux.dev,
	stable@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] DRBD broken in kernel 6.5 and 6.5.1
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

CC: David

On Sat, 2 Sep 2023 22:31:06 +0200 Serguei Ivantsov wrote:
> Hello,
> 
> After upgrading the kernel to 6.5 the system can't connect to the peer
> (6.4.11) anymore.
> I checked 6.5.1 - same issue.
> All previous kernels including 6.4.14 are working just fine.
> Checking the 6.5 changelog, I found commit
> 9ae440b8fdd6772b6c007fa3d3766530a09c9045 which mentioned some changes to
> DRBD.

I don't see anything obviously wrong here, maybe David has better
ideas. Can you try this?

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 79ab532aabaf..c607d4304608 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -1539,8 +1539,6 @@ static int _drbd_send_page(struct drbd_peer_device *peer_device, struct page *pa
 		    int offset, size_t size, unsigned msg_flags)
 {
 	struct socket *socket = peer_device->connection->data.socket;
-	struct msghdr msg = { .msg_flags = msg_flags, };
-	struct bio_vec bvec;
 	int len = size;
 	int err = -EIO;
 
@@ -1551,10 +1549,13 @@ static int _drbd_send_page(struct drbd_peer_device *peer_device, struct page *pa
 	 * __page_cache_release a page that would actually still be referenced
 	 * by someone, leading to some obscure delayed Oops somewhere else. */
 	if (!drbd_disable_sendpage && sendpage_ok(page))
-		msg.msg_flags |= MSG_NOSIGNAL | MSG_SPLICE_PAGES;
+		msg_flags |= MSG_SPLICE_PAGES;
 
+	msg_flags |= MSG_NOSIGNAL;
 	drbd_update_congested(peer_device->connection);
 	do {
+		struct msghdr msg = { .msg_flags = msg_flags, };
+		struct bio_vec bvec;
 		int sent;
 
 		bvec_set_page(&bvec, page, offset, len);


> On the 6.5.X system I have the following in the kernel log (drbd_send_block()
> failed):
> 
> [    2.473497] drbd: initialized. Version: 8.4.11 (api:1/proto:86-101)
> 
> [    2.475394] drbd: built-in
> 
> [    2.477254] drbd: registered as block device major 147
> 
> [    7.421400] drbd drbd0: Starting worker thread (from drbdsetup-84 [3844])
> 
> [    7.421509] drbd drbd0/0 drbd0: disk( Diskless -> Attaching )
> 
> [    7.421552] drbd drbd0: Method to ensure write ordering: flush
> 
> [    7.421554] drbd drbd0/0 drbd0: max BIO size = 131072
> 
> [    7.421557] drbd drbd0/0 drbd0: drbd_bm_resize called with capacity ==
> 1845173184
> 
> [    7.428017] drbd drbd0/0 drbd0: resync bitmap: bits=230646648
> words=3603854 pages=7039
> 
> [    7.467370] drbd0: detected capacity change from 0 to 1845173184
> 
> [    7.467372] drbd drbd0/0 drbd0: size = 880 GB (922586592 KB)
> 
> [    7.486005] drbd drbd0/0 drbd0: recounting of set bits took additional 0
> jiffies
> 
> [    7.486010] drbd drbd0/0 drbd0: 0 KB (0 bits) marked out-of-sync by on
> disk bit-map.
> 
> [    7.486017] drbd drbd0/0 drbd0: disk( Attaching -> UpToDate )
> 
> [    7.486021] drbd drbd0/0 drbd0: attached to UUIDs
> 32DDB2019708F68A:0000000000000000:7D97648599B446DD:7D96648599B446DD
> 
> [    7.486863] drbd drbd0: conn( StandAlone -> Unconnected )
> 
> [    7.486871] drbd drbd0: Starting receiver thread (from drbd_w_drbd0
> [3847])
> 
> [    7.486918] drbd drbd0: receiver (re)started
> 
> [    7.486929] drbd drbd0: conn( Unconnected -> WFConnection )
> 
> [   12.340212] drbd drbd0: initial packet S crossed
> 
> [   22.310856] drbd drbd0: Handshake successful: Agreed network protocol
> version 101
> 
> [   22.311087] drbd drbd0: Feature flags enabled on protocol level: 0xf
> TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
> 
> [   22.311425] drbd drbd0: conn( WFConnection -> WFReportParams )
> 
> [   22.311621] drbd drbd0: Starting ack_recv thread (from drbd_r_drbd0
> [4071])
> 
> [   22.400702] drbd drbd0/0 drbd0: drbd_sync_handshake:
> 
> [   22.400869] drbd drbd0/0 drbd0: self
> 32DDB2019708F68A:0000000000000000:7D97648599B446DD:7D96648599B446DD bits:0
> flags:0
> 
> [   22.401205] drbd drbd0/0 drbd0: peer
> 32DDB2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD bits:0
> flags:0
> 
> [   22.401538] drbd drbd0/0 drbd0: uuid_compare()=0 by rule 40
> 
> [   22.401709] drbd drbd0/0 drbd0: peer( Unknown -> Secondary ) conn(
> WFReportParams -> Connected ) pdsk( DUnknown -> UpToDate )
> 
> [   22.415394] drbd drbd0/0 drbd0: role( Secondary -> Primary )
> 
> [   22.506540] drbd drbd0/0 drbd0: _drbd_send_page: size=4096 len=4096
> sent=-5
> 
> [   22.506773] drbd drbd0: peer( Secondary -> Unknown ) conn( Connected ->
> NetworkFailure ) pdsk( UpToDate -> DUnknown )
> 
> [   22.507109] drbd drbd0/0 drbd0: new current UUID
> 7F8B15C04AF49C4D:32DDB2019708F68B:7D97648599B446DD:7D96648599B446DD
> 
> [   22.507451] drbd drbd0: ack_receiver terminated
> 
> [   22.507588] drbd drbd0: Terminating drbd_a_drbd0
> 
> [   22.600693] drbd drbd0: Connection closed
> 
> [   22.600937] drbd drbd0: conn( NetworkFailure -> Unconnected )
> 
> [   22.601115] drbd drbd0: receiver terminated
> 
> [   22.601238] drbd drbd0: Restarting receiver thread
> 
> [   22.601378] drbd drbd0: receiver (re)started
> 
> [   22.601508] drbd drbd0: conn( Unconnected -> WFConnection )
> 
> [   23.260624] drbd drbd0: Handshake successful: Agreed network protocol
> version 101
> 
> [   23.260859] drbd drbd0: Feature flags enabled on protocol level: 0xf
> TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
> 
> [   23.261187] drbd drbd0: conn( WFConnection -> WFReportParams )
> 
> [   23.261367] drbd drbd0: Starting ack_recv thread (from drbd_r_drbd0
> [4071])
> 
> [   23.340593] drbd drbd0/0 drbd0: drbd_sync_handshake:
> 
> [   23.340771] drbd drbd0/0 drbd0: self
> 7F8B15C04AF49C4D:32DDB2019708F68B:7D97648599B446DD:7D96648599B446DD bits:1
> flags:0
> 
> [   23.341192] drbd drbd0/0 drbd0: peer
> 32DDB2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD bits:0
> flags:0
> 
> [   23.341649] drbd drbd0/0 drbd0: uuid_compare()=1 by rule 70
> 
> [   23.341824] drbd drbd0/0 drbd0: peer( Unknown -> Secondary ) conn(
> WFReportParams -> WFBitMapS ) pdsk( DUnknown -> Consistent )
> 
> [   23.344911] drbd drbd0/0 drbd0: send bitmap stats [Bytes(packets)]:
> plain 0(0), RLE 23(1), total 23; compression: 100.0%
> 
> [   23.396792] drbd drbd0/0 drbd0: receive bitmap stats [Bytes(packets)]:
> plain 0(0), RLE 23(1), total 23; compression: 100.0%
> 
> [   23.397210] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
> before-resync-source minor-0
> 
> [   23.407965] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
> before-resync-source minor-0 exit code 0 (0x0)
> 
> [   23.417547] drbd drbd0/0 drbd0: conn( WFBitMapS -> SyncSource ) pdsk(
> Consistent -> Inconsistent )
> 
> [   23.426697] drbd drbd0/0 drbd0: Began resync as SyncSource (will sync 4
> KB [1 bits set]).
> 
> [   23.435638] drbd drbd0/0 drbd0: updated sync UUID
> 7F8B15C04AF49C4D:32DEB2019708F68B:32DDB2019708F68B:7D97648599B446DD
> 
> [   23.488608] drbd drbd0/0 drbd0: _drbd_send_page: size=4096 len=4096
> sent=-5
> 
> [   23.498182] drbd drbd0/0 drbd0: drbd_send_block() failed
> 
> [   23.508498] drbd drbd0: peer( Secondary -> Unknown ) conn( SyncSource ->
> NetworkFailure )
> 
> [   23.517597] drbd drbd0: ack_receiver terminated
> 
> [   23.527513] drbd drbd0: Terminating drbd_a_drbd0
> 
> [   23.690598] drbd drbd0: Connection closed
> 
> [   23.701857] drbd drbd0: conn( NetworkFailure -> Unconnected )
> 
> [   23.712017] drbd drbd0: receiver terminated
> 
> [   23.721597] drbd drbd0: Restarting receiver thread
> 
> 
> 
> On the peer:
> 
> 
> [349071.038278] drbd drbd0: conn( Unconnected -> WFConnection )
> 
> [349071.558245] drbd drbd0: Handshake successful: Agreed network protocol
> version 101
> 
> [349071.562105] drbd drbd0: Feature flags enabled on protocol level: 0xf
> TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
> 
> [349071.569889] drbd drbd0: conn( WFConnection -> WFReportParams )
> 
> [349071.573802] drbd drbd0: Starting ack_recv thread (from drbd_r_drbd0
> [2660])
> 
> [349071.688547] drbd drbd0/0 drbd0: drbd_sync_handshake:
> 
> [349071.692323] drbd drbd0/0 drbd0: self
> 3375B2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD bits:1
> flags:0
> 
> [349071.699871] drbd drbd0/0 drbd0: peer
> 7F8B15C04AF49C4D:3375B2019708F68B:3374B2019708F68B:3373B2019708F68B bits:1
> flags:0
> 
> [349071.707687] drbd drbd0/0 drbd0: uuid_compare()=-1 by rule 50
> 
> [349071.711563] drbd drbd0/0 drbd0: Becoming sync target due to disk states.
> 
> [349071.715381] drbd drbd0/0 drbd0: peer( Unknown -> Primary ) conn(
> WFReportParams -> WFBitMapT ) pdsk( DUnknown -> UpToDate )
> 
> [349071.723039] drbd drbd0/0 drbd0: receive bitmap stats [Bytes(packets)]:
> plain 0(0), RLE 23(1), total 23; compression: 100.0%
> 
> [349071.732489] drbd drbd0/0 drbd0: send bitmap stats [Bytes(packets)]:
> plain 0(0), RLE 23(1), total 23; compression: 100.0%
> 
> [349071.740178] drbd drbd0/0 drbd0: conn( WFBitMapT -> WFSyncUUID )
> 
> [349071.787113] drbd drbd0/0 drbd0: updated sync uuid
> 3376B2019708F68A:0000000000000000:7D97648599B446DC:7D96648599B446DD
> 
> [349071.794907] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
> before-resync-target minor-0
> 
> [349071.800006] drbd drbd0/0 drbd0: helper command: /sbin/drbdadm
> before-resync-target minor-0 exit code 0 (0x0)
> 
> [349071.807737] drbd drbd0/0 drbd0: conn( WFSyncUUID -> SyncTarget )
> 
> [349071.811639] drbd drbd0/0 drbd0: Began resync as SyncTarget (will sync 4
> KB [1 bits set]).
> 
> [349071.916117] drbd drbd0: sock was shut down by peer
> 
> [349071.919955] drbd drbd0: peer( Primary -> Unknown ) conn( SyncTarget ->
> BrokenPipe ) pdsk( UpToDate -> DUnknown )
> 
> [349071.927796] drbd drbd0: short read (expected size 4096)
> 
> [349071.931812] drbd drbd0: error receiving RSDataReply, e: -5 l: 4096!
> 
> [349071.935864] drbd drbd0: ack_receiver terminated
> 
> [349071.939906] drbd drbd0: Terminating drbd_a_drbd0
> 
> [349072.088385] drbd drbd0: Connection closed
> 
> [349072.092398] drbd drbd0: conn( BrokenPipe -> Unconnected )
> 
> [349072.096436] drbd drbd0: receiver terminated
> 
> [349072.100469] drbd drbd0: Restarting receiver thread
> 
> [349072.104454] drbd drbd0: receiver (re)started
> 
> [349072.108373] drbd drbd0: conn( Unconnected -> WFConnection )
> 
> 
> --
> 
>  Best Regards,
> 
>  Serguei

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
