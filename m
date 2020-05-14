Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FD1D2ED2
	for <lists+drbd-dev@lfdr.de>; Thu, 14 May 2020 13:52:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 41A1E4203E7;
	Thu, 14 May 2020 13:52:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtprelay.hostedemail.com (smtprelay0200.hostedemail.com
	[216.40.44.200])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3561420229
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 13:52:02 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id 82BDA2C1F;
	Thu, 14 May 2020 11:51:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3872:3874:4321:5007:6742:6743:10004:10400:10848:11232:11658:11914:12296:12297:12740:12760:12895:13069:13160:13229:13311:13357:13439:14659:21080:21611:21627:30054:30090:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: soup46_cc3a3aa2090a
X-Filterd-Recvd-Size: 2294
Received: from XPS-9350.home (unknown [47.151.136.130])
	(Authenticated sender: joe@perches.com)
	by omf01.hostedemail.com (Postfix) with ESMTPA;
	Thu, 14 May 2020 11:51:27 +0000 (UTC)
Message-ID: <9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 14 May 2020 04:51:26 -0700
In-Reply-To: <20200514103025.GB12680@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-21-hch@lst.de>
	<0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
	<20200514103025.GB12680@lst.de>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, Vlad@linbit.com, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-cifs@vger.kernel.org,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
	Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
	Jon Maloy <jmaloy@redhat.com>, linux-sctp@vger.kernel.org,
	Ying Xue <ying.xue@windriver.com>,
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

On Thu, 2020-05-14 at 12:30 +0200, Christoph Hellwig wrote:
> On Wed, May 13, 2020 at 02:00:43PM -0700, Joe Perches wrote:
> > On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
> > > Add a helper to directly set the IP_RECVERR sockopt from kernel space
> > > without going through a fake uaccess.
> > 
> > This seems used only with true as the second arg.
> > Is there reason to have that argument at all?
> 
> Mostly to keep it symmetric with the sockopt.  I could probably remove
> a few arguments in the series if we want to be strict.

My preference would use strict and add
arguments only when necessary.


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
