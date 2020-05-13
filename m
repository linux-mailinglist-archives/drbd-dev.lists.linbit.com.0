Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 347171F8259
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:59:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E89542043C;
	Sat, 13 Jun 2020 11:59:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 14D5C4203F6
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:36 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id r7so12316142wro.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=kC/Pwa8f1gD3R5LYjYmzPSPuGCXjungEBXbTdD/3zMQ=;
	b=EvfJFJ9GxXoRLOWdbTA1HsuF0Ow2hal2PYCDHTD5BteylKvC/CWqmK8aDpaxMlZ3DF
	/LeM1KVlMvfblDi2DJH4UVS2jCVQp6TFKIfjkSUTdImYSSATt/5Dn553tPrPdehy3d9q
	P9jIJE5uFP7dJ3YIXmQaemoKx6dirjb6ceJLxYGQWGgwvpr7saw1tBGE09T3n4poieCX
	hu8tmMZovtVpeXix1HKEGQ45jqhnnRyH6wrdwvgyRbKbiWBXlobx6IKMmMFB53iBFtav
	HWzj6ttozfl2AzW0su4lwozXzrAoSca5vIllCc5ue76Ms+2w9NlUvvzG8BBEm/KT4GRq
	rUsQ==
X-Gm-Message-State: AOAM531yZbVkSEPdrukZZi2gjsl1RaB0aEM/4T3aOSltxghM8OkJwZlk
	pMZGnksnRxljd38yb6fVyqua72b7nbDEsmOh
X-Google-Smtp-Source: ABdhPJzr2Fw6/cW2y/RxCZPIZl7J5SegT4tM2eCcbGt0izV8ZPFKMe51MC7x3dBw7FzENjJVqXuTRQ==
X-Received: by 2002:adf:f389:: with SMTP id m9mr18179841wro.195.1592042196257; 
	Sat, 13 Jun 2020 02:56:36 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	s7sm14103751wrr.60.2020.06.13.02.56.35
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:35 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:34 +0200
Resent-Message-ID: <20200613095634.GJ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 95743420317
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 15:20:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589376004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=kC/Pwa8f1gD3R5LYjYmzPSPuGCXjungEBXbTdD/3zMQ=;
	b=Q25LZBqcyRe3dntzOJcR+oJRpYdZYT0xq4hCuO4DXcfMcVELHftkxZNpPaVj6CU8xtbwBF
	6XiM5TX61YIo4VJGZZcpEfZc1SbTHAW3aZAGt362HdcPvJof/eVpHON97UMfjdCn//vtDW
	Ri+vJUk1G2MWgxGksfZ6G+CAKne5P/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-j5Rv_ovSOqaPeCLkWE73pQ-1; Wed, 13 May 2020 09:13:21 -0400
X-MC-Unique: j5Rv_ovSOqaPeCLkWE73pQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AED3780183C;
	Wed, 13 May 2020 13:13:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
	[10.10.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 800786A960;
	Wed, 13 May 2020 13:13:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-30-hch@lst.de>
References: <20200513062649.2100053-30-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <3123533.1589375587.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:13:07 +0100
Message-ID: <3123534.1589375587@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Subject: Re: [Drbd-dev] [PATCH 29/33] rxrpc_sock_set_min_security_level
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

> +int rxrpc_sock_set_min_security_level(struct sock *sk, unsigned int val);
> +

Looks good - but you do need to add this to Documentation/networking/rxrpc.txt
also, thanks.

David

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
