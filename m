Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A51D2D1D
	for <lists+drbd-dev@lfdr.de>; Thu, 14 May 2020 12:41:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A9F9A4203E2;
	Thu, 14 May 2020 12:41:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE11C4202BF
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 12:41:12 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8A1C268BEB; Thu, 14 May 2020 12:40:40 +0200 (CEST)
Date: Thu, 14 May 2020 12:40:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Message-ID: <20200514104040.GA12979@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513180058.GB2491@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: [Drbd-dev] is it ok to always pull in sctp for dlm,
 was: Re: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

On Wed, May 13, 2020 at 03:00:58PM -0300, Marcelo Ricardo Leitner wrote:
> On Wed, May 13, 2020 at 08:26:42AM +0200, Christoph Hellwig wrote:
> > And call it directly from dlm instead of going through kernel_setsockopt.
> 
> The advantage on using kernel_setsockopt here is that sctp module will
> only be loaded if dlm actually creates a SCTP socket.  With this
> change, sctp will be loaded on setups that may not be actually using
> it. It's a quite big module and might expose the system.
> 
> I'm okay with the SCTP changes, but I'll defer to DLM folks to whether
> that's too bad or what for DLM.

So for ipv6 I could just move the helpers inline as they were trivial
and avoid that issue.  But some of the sctp stuff really is way too
big for that, so the only other option would be to use symbol_get.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
