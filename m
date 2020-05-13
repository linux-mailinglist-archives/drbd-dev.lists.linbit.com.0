Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E861F8257
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:59:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2B304203F5;
	Sat, 13 Jun 2020 11:59:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 249A84203F5
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:33 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id l17so10056971wmj.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=uvCkRI/K32PIBqaQ7LcOfghe4diMRxEm5e5JsVQlwss=;
	b=dnr/LQnjwNfz0pex7y3BXnHTpUsVopbBhayBAINRnDxHFGJf0y+Dq+N+eHkitmeZuU
	aR1vj3hv2e++OEuJGKCjaG0c+gZwoTvMddivZvZQ4SAY/ljv49RKpSXgluVab8mualPy
	7t+iHX/csKYlLUmS7DbPgTapGr+CNKB05EaUHAKVK0yynY1Hy0f9jk4L+fXGi9KRrj7R
	IU2ZLA0Amurn6KPmkE6IDlBI5WuKrmaQd4+6bcQdbGr1vT6SstExCPFmVT5eCREZ/1Rm
	7Wx/vMW9Gryt4y8OWf7kdiXN2qChBd1n0+Thp+ITldd6juuv5ut+4ividoEiuRlr6x1e
	mcxw==
X-Gm-Message-State: AOAM533knsGHnJomBjW1HeEFCXOMzD7/7mSwAiPWmwsUcd9YZogE122h
	FM5DPO2Guav2Y8TXui+X9cZNKlb9TCftaa5p
X-Google-Smtp-Source: ABdhPJzBGIhD9RvVpNcReup6GIcAXbfcA1od38ibB1IoYjZUN28QvPFl7QQSqrZ2HyUEJSZQ/fxc4A==
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr3095462wmj.159.1592042193344; 
	Sat, 13 Jun 2020 02:56:33 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	o20sm14861230wra.29.2020.06.13.02.56.32
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:32 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:31 +0200
Resent-Message-ID: <20200613095631.GI4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 331 seconds by postgrey-1.31 at mail19;
	Wed, 13 May 2020 15:18:58 CEST
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61277420317
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 15:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589375937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=uvCkRI/K32PIBqaQ7LcOfghe4diMRxEm5e5JsVQlwss=;
	b=IhNm+k7PVQk1sHCfQ4mVHQrO/3uwBSm2SWWE2NOaoIPiWExjnyRa4bJFdNJm3efc9kgjb7
	O2XOvzJn8BzOF2RPPKXZvT4IOc27m9AomIX/bhLJgnSG5yxdAqOeRztqcGi3llqN/O2VYE
	GwDGM0sOfCPMoSiREwpOigfznaRKBZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-133-9T7X1SL4M7u16KqBfljjIQ-1; Wed, 13 May 2020 09:17:52 -0400
X-MC-Unique: 9T7X1SL4M7u16KqBfljjIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C148014C0;
	Wed, 13 May 2020 13:17:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
	[10.10.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8A53610F2;
	Wed, 13 May 2020 13:17:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-22-hch@lst.de>
References: <20200513062649.2100053-22-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <3123897.1589375861.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:17:41 +0100
Message-ID: <3123898.1589375861@warthog.procyon.org.uk>
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

> +		ip_sock_set_mtu_discover(conn->params.local->socket->sk,
> +				IP_PMTUDISC_DONT);

Um... The socket in question could be an AF_INET6 socket, not an AF_INET4
socket - I presume it will work in that case.  If so:

Reviewed-by: David Howells <dhowells@redhat.com> [rxrpc bits]

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
