Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3647E1DC969
	for <lists+drbd-dev@lfdr.de>; Thu, 21 May 2020 11:08:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 137544203E4;
	Thu, 21 May 2020 11:08:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3135F4203D6
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 11:08:14 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B08C668BEB; Thu, 21 May 2020 11:08:12 +0200 (CEST)
Date: Thu, 21 May 2020 11:08:12 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200521090812.GA8330@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
	<20200520233913.GV2491@localhost.localdomain>
	<20200521083442.GA7771@lst.de>
	<0a6839ab0ba04fcf9b9c92784c9564aa@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a6839ab0ba04fcf9b9c92784c9564aa@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"edumazet@google.com" <edumazet@google.com>,
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
	"kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"nhorman@tuxdriver.com" <nhorman@tuxdriver.com>,
	"yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"vyasevich@gmail.com" <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jmaloy@redhat.com" <jmaloy@redhat.com>,
	"ying.xue@windriver.com" <ying.xue@windriver.com>,
	David Miller <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] [PATCH 31/33] sctp: add sctp_sock_set_nodelay
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

On Thu, May 21, 2020 at 09:06:19AM +0000, David Laight wrote:
> > > The comment still applies, though. (re the duplication)
> > 
> > Where do you see duplication?
> 
> The whole thing just doesn't scale.
> 
> As soon as you get to the slightly more complex requests
> like SCTP_INITMSG (which should probably be called to
> set the required number of data streams) you've either
> got replicated code or nested wrappers.

None of that is relevant to setting the nodelay option.  If you actually
read through the series you'd say that whenever there was non-trivial
logic it is shared with getopt.  However sharing just for purpose of
sharing doesn't make sense, so where the kernel API ended up just
setting a flag after taking the sock lock I did not opt for it.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
