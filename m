Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59D1F8277
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:10:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 028B1420405;
	Sat, 13 Jun 2020 12:10:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2BA4420409
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:52 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id j198so10588304wmj.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=JreAY7MKMl9fHBBX1SskPW+QiLkeoSeDm7rQFvd/Pn4=;
	b=LHqo4j/INSz1HLbtZPhvn4opgsgk0PthVUlX1h0ayGxqjso0cMSm5xelgAGEF3V5q7
	eTBeRydIn/w0ZreTO7Kt0RKSMk/6WBzgUz24NlLoTeznZvAU0r+kK+aF7IDcF8Nx7Oa0
	eek4UwAKm66ZDyXtc96P63Eqal7lY/do1Mmj/69E6tT5r4I6Te3MWTvZBnWSzbo2plkj
	MBGQlZfI2WA9aSrGPxDmGI2WR5Y0DiSmBD6O08sneOjQSNy/ERJFj7H5rSfVkMjbVOyg
	WG+b0mKXzFGuU8OzX2EWd0+s0kt+5h4BbSQe6dEZo3i3M+uNgWsuBrY3y9BIYm5AMraN
	Tmog==
X-Gm-Message-State: AOAM533t38w+WCFknysR3uXxaBLmi/aISYBlTN6bJuBMSukpk5li0lha
	+YoEgQJVOmSoYMv6oCi8LkZ9iI1Ei/z433tk
X-Google-Smtp-Source: ABdhPJxJNAIZ34wOSBXWC5BUAZaJtloDxW/hA3MGKGkTjC0h7G74HRo4f19k3vu9AuYVU6RJxSsvIA==
X-Received: by 2002:a05:600c:21c2:: with SMTP id
	x2mr3278762wmj.33.1592042271844; 
	Sat, 13 Jun 2020 02:57:51 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	j18sm14892937wrn.59.2020.06.13.02.57.51
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:51 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:49 +0200
Resent-Message-ID: <20200613095749.GF4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70725420105
	for <drbd-dev@lists.linbit.com>; Fri, 15 May 2020 17:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589555739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=JreAY7MKMl9fHBBX1SskPW+QiLkeoSeDm7rQFvd/Pn4=;
	b=aLTMg8Tbdu6nCFlS3ZMY1KUIuBS8S+H3M9NWHXvnUJt2E4g9GyAGj9tRwMzqDpH1HufW2E
	9rPwa4ljUvoolMlWtDW82IBD4//msuWl/7JTO8drVUwjXrQwlLoO+ASuO4i9do5+ij9+QV
	k5khCXcPT4PxZ/E5f2ntjdAjkDC60C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-205-szRU-cO-O-uHE_tEFGhqcw-1; Fri, 15 May 2020 11:15:35 -0400
X-MC-Unique: szRU-cO-O-uHE_tEFGhqcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 619438005AD;
	Fri, 15 May 2020 15:15:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
	[10.10.112.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE21960C84;
	Fri, 15 May 2020 15:15:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200514062622.GA8564@lst.de>
References: <20200514062622.GA8564@lst.de>
	<20200513062649.2100053-22-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<3123898.1589375861@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <128699.1589555724.1@warthog.procyon.org.uk>
Date: Fri, 15 May 2020 16:15:24 +0100
Message-ID: <128700.1589555724@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	dhowells@redhat.com, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
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

Christoph Hellwig <hch@lst.de> wrote:

> > > +		ip_sock_set_mtu_discover(conn->params.local->socket->sk,
> > > +				IP_PMTUDISC_DONT);
> > 
> > Um... The socket in question could be an AF_INET6 socket, not an AF_INET4
> > socket - I presume it will work in that case.  If so:
> 
> Yes, the implementation of that sockopt, including the inet_sock
> structure where these options are set is shared between ipv4 and ipv6.

Great!  Could you note that either in the patch description or in the
kerneldoc attached to the function?

Thanks,
David

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
