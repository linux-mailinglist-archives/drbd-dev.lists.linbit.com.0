Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2C1DB60D
	for <lists+drbd-dev@lfdr.de>; Wed, 20 May 2020 16:18:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CC014203EB;
	Wed, 20 May 2020 16:18:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DFDCC4203E8
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 16:18:32 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9508368C4E; Wed, 20 May 2020 16:18:30 +0200 (CEST)
Date: Wed, 20 May 2020 16:18:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joe Perches <joe@perches.com>
Message-ID: <20200520141830.GA28867@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-21-hch@lst.de>
	<0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
	<20200514103025.GB12680@lst.de>
	<9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
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
Subject: Re: [Drbd-dev] [PATCH 20/33] ipv4: add ip_sock_set_recverr
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

On Thu, May 14, 2020 at 04:51:26AM -0700, Joe Perches wrote:
> > Mostly to keep it symmetric with the sockopt.  I could probably remove
> > a few arguments in the series if we want to be strict.
> 
> My preference would use strict and add
> arguments only when necessary.

In a few cases that would create confusion as the arguments are rather
overloaded.  But for a lot of the cases where it doesn't and there isn't
really much use for other arguments I've done that now.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
