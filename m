Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62B1D546C
	for <lists+drbd-dev@lfdr.de>; Fri, 15 May 2020 17:25:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 68E194203E3;
	Fri, 15 May 2020 17:25:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A7FC5420105
	for <drbd-dev@lists.linbit.com>; Fri, 15 May 2020 17:25:32 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id DCFD868C65; Fri, 15 May 2020 17:24:59 +0200 (CEST)
Date: Fri, 15 May 2020 17:24:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200515152459.GA28995@lst.de>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<129070.1589556002@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <129070.1589556002@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	cluster-devel@redhat.com, Jakub Kicinski <kuba@kernel.org>,
	linux-block@vger.kernel.org, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

On Fri, May 15, 2020 at 04:20:02PM +0100, David Howells wrote:
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > > The advantage on using kernel_setsockopt here is that sctp module will
> > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > change, sctp will be loaded on setups that may not be actually using
> > > it. It's a quite big module and might expose the system.
> > 
> > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > as I plan to remove the set_fs address space override used for it.
> 
> For getsockopt, does it make sense to have the core kernel load optval/optlen
> into a buffer before calling the protocol driver?  Then the driver need not
> see the userspace pointer at all.
> 
> Similar could be done for setsockopt - allocate a buffer of the size requested
> by the user inside the kernel and pass it into the driver, then copy the data
> back afterwards.

I did look into that initially.  The problem is that tons of sockopts
entirely ignore optlen and just use a fixed size.  So I fear that there
could be tons of breakage if we suddently respect it.  Otherwise that
would be a pretty nice way to handle the situation.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
