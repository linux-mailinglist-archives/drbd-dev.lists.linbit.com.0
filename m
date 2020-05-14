Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E53471D27AA
	for <lists+drbd-dev@lfdr.de>; Thu, 14 May 2020 08:26:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C25944203C1;
	Thu, 14 May 2020 08:26:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E148B4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 08:26:24 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8B05468B05; Thu, 14 May 2020 08:26:22 +0200 (CEST)
Date: Thu, 14 May 2020 08:26:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200514062622.GA8564@lst.de>
References: <20200513062649.2100053-22-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<3123898.1589375861@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3123898.1589375861@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
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
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 21/33] ipv4: add ip_sock_set_mtu_discover
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

On Wed, May 13, 2020 at 02:17:41PM +0100, David Howells wrote:
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > +		ip_sock_set_mtu_discover(conn->params.local->socket->sk,
> > +				IP_PMTUDISC_DONT);
> 
> Um... The socket in question could be an AF_INET6 socket, not an AF_INET4
> socket - I presume it will work in that case.  If so:

Yes, the implementation of that sockopt, including the inet_sock
structure where these options are set is shared between ipv4 and ipv6.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
