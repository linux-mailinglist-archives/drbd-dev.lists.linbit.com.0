Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D11F825B
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:00:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63998420447;
	Sat, 13 Jun 2020 12:00:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2C0274203F7
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:39 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id e1so12304323wrt.5
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=OH0J8d3K3U+hQmWR8NPajZuhzGmc4mTANodrmCJL8cs=;
	b=kTubjQsUN+C+BNlr9ivjSIo/JpjdR9OPxfEWe0qZBZ6IV1BEwY06RFufF61xwftc3v
	SJEY3GnP69IW2RVT6q8FRjdbxTrQX/paGRKvcaUc0+Cljnib/wlIjqgHiTugLkZIpzMO
	REx+YpxpIxsUbOh3YXXceqnmkJr2syn7xAa2qaLELiwjRAm/syQ8JdnuuPgUKR40qSQl
	sBsyI+fVUUxBAprhaflRDOC+LynEc7x5/GAILsag0x2P4hHea0Gj64H8Wcu8g29D4Gw5
	9p7cH+4shqUOZtxmx+inIlozgRLD0l4xomxNC4CXmAb1ZexTpjBCZcKuZURhucW8LdYD
	oSEg==
X-Gm-Message-State: AOAM5330FNpglGL9KA5tnFwBTRbJ1IqeJilX7C1Nd0twX3k1TuGlYbzg
	8AcIX22illH0Crqo/9iGE9NzqZalgs3UZnq1
X-Google-Smtp-Source: ABdhPJwFSH66mgFpcD0DVBz4dEy7mon5mQ5wJx4tWP08K0KocCsgOhGn0kEpW8VkvloLnycds+5u4A==
X-Received: by 2002:adf:e908:: with SMTP id f8mr19039420wrm.184.1592042199295; 
	Sat, 13 Jun 2020 02:56:39 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	v27sm15301979wrv.81.2020.06.13.02.56.38
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:38 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:37 +0200
Resent-Message-ID: <20200613095637.GK4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C69B3420317
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 15:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589376441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=OH0J8d3K3U+hQmWR8NPajZuhzGmc4mTANodrmCJL8cs=;
	b=W8D3X2FEvV90NYW1xXTRbHOUGvHFuOmM91+lFiFTWjxhYeX5vOwbIZ+IpivEhgcKaOYcuq
	OvgH10YEGzNMMTDQ1/aSpXcNLeZ8IKOWwMHYOnxOEaTspHzwQLYICk7acYiKrV5wo73BaR
	cALbHJSViNleJgksLeim5LhiE3p8uhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-iyWGfh95OW-O_Gj4FkwCgg-1; Wed, 13 May 2020 09:27:19 -0400
X-MC-Unique: iyWGfh95OW-O_Gj4FkwCgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9855835B40;
	Wed, 13 May 2020 13:27:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
	[10.10.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 811E61C92D;
	Wed, 13 May 2020 13:27:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-7-hch@lst.de>
References: <20200513062649.2100053-7-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <3124743.1589376425.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:27:05 +0100
Message-ID: <3124744.1589376425@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: Re: [Drbd-dev] [PATCH 06/33] net: add sock_set_timestamps
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

> Add a helper to directly set the SO_TIMESTAMP* sockopts from kernel space
> without going through a fake uaccess.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: David Howells <dhowells@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
