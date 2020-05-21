Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F511DC97D
	for <lists+drbd-dev@lfdr.de>; Thu, 21 May 2020 11:11:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7DAB54203E8;
	Thu, 21 May 2020 11:11:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C85964203D6
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 11:11:54 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id DBA5368C4E; Thu, 21 May 2020 11:11:50 +0200 (CEST)
Date: Thu, 21 May 2020 11:11:50 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200521091150.GA8401@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
	<138a17dfff244c089b95f129e4ea2f66@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <138a17dfff244c089b95f129e4ea2f66@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	'Christoph Hellwig' <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Jakub Kicinski <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] remove kernel_setsockopt and kernel_getsockopt v2
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

On Thu, May 21, 2020 at 08:01:33AM +0000, David Laight wrote:
> How much does this increase the kernel code by?

 44 files changed, 660 insertions(+), 843 deletions(-)


> You are also replicating a lot of code making it more
> difficult to maintain.

No, I specifically don't.

> I don't think the performance of an socket option code
> really matters - it is usually done once when a socket
> is initialised and the other costs of establishing a
> connection will dominate.
> 
> Pulling the user copies outside the [gs]etsocksopt switch
> statement not only reduces the code size (source and object)
> and trivially allows kernel_[sg]sockopt() to me added to
> the list of socket calls.
> 
> It probably isn't possible to pull the usercopies right
> out into the syscall wrapper because of some broken
> requests.

Please read through the previous discussion of the rationale and the
options.  We've been there before.

> I worried about whether getsockopt() should read the entire
> user buffer first. SCTP needs the some of it often (including a
> sockaddr_storage in one case), TCP needs it once.
> However the cost of reading a few words is small, and a big
> buffer probably needs setting to avoid leaking kernel
> memory if the structure has holes or fields that don't get set.
> Reading from userspace solves both issues.

As mention in the thread on the last series:  That was my first idea, but
we have way to many sockopts, especially in obscure protocols that just
hard code the size.  The chance of breaking userspace in a way that can't
be fixed without going back to passing user pointers to get/setsockopt
is way to high to commit to such a change unfortunately.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
