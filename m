Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0D1D27C1
	for <lists+drbd-dev@lfdr.de>; Thu, 14 May 2020 08:27:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D7714203E4;
	Thu, 14 May 2020 08:27:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 439DE4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 08:27:37 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 22C9868BEB; Thu, 14 May 2020 08:27:07 +0200 (CEST)
Date: Thu, 14 May 2020 08:27:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joe Perches <joe@perches.com>
Message-ID: <20200514062706.GB8564@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
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
	linux-sctp@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] remove kernel_setsockopt and kernel_getsockopt
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

On Wed, May 13, 2020 at 10:38:59AM -0700, Joe Perches wrote:
> It might be useful to show overall object size change.
> 
> More EXPORT_SYMBOL uses increase object size a little.
> 
> And not sure it matters much except it reduces overall object
> size, but these patches remove (unnecessary) logging on error
> and that could be mentioned in the cover letter too.

The intent here is not to reduce code size.  The intent is to kill of
set_fs users so that we can eventually remove set_fs entirely.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
