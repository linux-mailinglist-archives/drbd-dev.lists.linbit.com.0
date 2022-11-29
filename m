Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4463C6C6
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Nov 2022 18:51:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9EC3842095F;
	Tue, 29 Nov 2022 18:51:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 494 seconds by postgrey-1.31 at mail19;
	Tue, 29 Nov 2022 18:51:02 CET
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F132442066E
	for <drbd-dev@lists.linbit.com>; Tue, 29 Nov 2022 18:51:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1BB80CE13C9;
	Tue, 29 Nov 2022 17:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D66C433C1;
	Tue, 29 Nov 2022 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669743759;
	bh=3+jgbqIH2MJTIsVHlcxt6FoqC9JTTWJi5HGZCaZxgug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QUm6mA5J8FMakXMYs9TxR1saaYz2xtuB1WQ4vJJERTQPls5BaIPHVnOKz8jZIo9kT
	XulObDx1A347icJCI3BmL1Pf+V0Y6vDE7c7GJVgCQGxPvlvdctmnzKGaymxCYNMyXQ
	dKw/DfIH615h0CSbluMrGHtANR4WOUzVKajaI/Lk7UG43sRTDV3681zTOgmNB5PA42
	4z8cYl3L4lhD0Mvd0OcboC2hB3hl3nwz3MNA3jwsaSJnlHZe8k2mACwlMT6PMRhQUD
	9V/1JVeknQRJ/G2/votnmVuu78OlhM7g7yW8UlJERa2tg+7VQlKisF3sYHT8GaId68
	G+E9LkyPR/ygQ==
Message-ID: <d0a8f7a5e307e201926ae8e80d629da10c706a91.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Benjamin Coddington <bcodding@redhat.com>
Date: Tue, 29 Nov 2022 12:42:33 -0500
In-Reply-To: <20221129140242.GA15747@lst.de>
References: <cover.1669036433.git.bcodding@redhat.com>
	<c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<20221129140242.GA15747@lst.de>
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Eric Dumazet <edumazet@google.com>, linux-nfs@vger.kernel.org,
	Marc Dionne <marc.dionne@auristor.com>,
	Shuah Khan <shuah@kernel.org>, linux-afs@lists.infradead.org,
	Mike Christie <michael.christie@oracle.com>,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
	Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
	Christine Caulfield <ccaulfie@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Keith@linbit.com,
	Anna Schumaker <anna@kernel.org>, Hensbergen <ericvh@gmail.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Josef Bacik <josef@toxicpanda.com>, David@linbit.com,
	linux-block@vger.kernel.org, nbd@other.debian.org, Greg@linbit.com,
	Teigland <teigland@redhat.com>, Joel Becker <jlbec@evilplan.org>,
	Chuck@linbit.com, v9fs-developer@lists.sourceforge.net,
	Busch <kbusch@kernel.org>, ceph-devel@vger.kernel.org,
	Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Leech <cleech@redhat.com>,
	open-iscsi@googlegroups.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Steve French <sfrench@samba.org>, Lever <chuck.lever@oracle.com>,
	Lee Duncan <lduncan@suse.com>,
	Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Eric@linbit.com,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH v1 2/3] Treewide: Stop corrupting socket's
	task_frag
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

On Tue, 2022-11-29 at 15:02 +0100, Christoph Hellwig wrote:
> Hmm.  Having to set a flag to not accidentally corrupt per-task
> state seems a bit fragile.  Wouldn't it make sense to find a way to opt
> into the feature only for sockets created from the syscall layer?

I agree that that would be cleaner. task_frag should have been an opt-in
thing all along. That change regressed all of the in-kernel users of
sockets.

Where would be the right place to set that flag for only userland
sockets? A lot of the in-kernel socket users hook into the socket API at
a fairly high-level. 9P and CIFS, for instance, call __sock_create.

We could set it in the syscall handlers (and maybe in iouring) I
suppose, but that seems like the wrong thing to do too.

In the absence of a clean place to do this, I think we're going to be
stuck doing it the way Ben has proposed...
-- 
Jeff Layton <jlayton@kernel.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
