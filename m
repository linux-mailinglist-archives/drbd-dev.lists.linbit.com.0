Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68F1F825E
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:00:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9814C420446;
	Sat, 13 Jun 2020 12:00:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3746A4203F8
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:43 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id l17so10057152wmj.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=rZ+0Q6w2JhCJ+YHhCDkagX+ViVcqBNbrqtWBcPXjIKM=;
	b=cZm6wDIaHTarksmejPLPrNgEAYcbjmnVyPMLNlHYBlQH7IhqQhU/3lqggztNTf0ONd
	eS2bAJpqxg5y0/nJk9PkhBa0V6fnPAkFDIhCgmCxPABwuQODdV0e7aIHQtv5l8A4pSH+
	vLhigZufZ/Mn+Eah3p93AsNODx++sE8GqtjAYOhIyiJzUm6tWxiRNt4NqOU/PTx/038V
	DxTaHExfGShu+PBFYxcx5Lrdn18ManftkRGkw0yhBtVyBWAQvrDA+VinEcDJBKmPkqq4
	zD3g/2hXELDjzRUYka1dMzoADu/RZNu9CKyNvCTxGJt/yKOZ1o16299pMdL2rOnnAGiP
	CrSA==
X-Gm-Message-State: AOAM531byJeYhyu81HCQIJq2XNHip5uGguV1mZoTIlAtYOZymxc0gXly
	06wdBc0HcJBOYd3g+RaSRkMHyG7LTYNnoaAc
X-Google-Smtp-Source: ABdhPJzotEdllyc6xWlM0Ni0A4QrGI9lyxx6sfZ4VoGKrM4svjvRk3RygR51mvFMIvXIHvU3W7+ynQ==
X-Received: by 2002:a1c:a74b:: with SMTP id q72mr3222714wme.122.1592042202669; 
	Sat, 13 Jun 2020 02:56:42 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	w10sm14272554wrp.16.2020.06.13.02.56.41
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:42 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:40 +0200
Resent-Message-ID: <20200613095640.GL4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 377 seconds by postgrey-1.31 at mail19;
	Wed, 13 May 2020 15:31:04 CEST
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F02584202F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 15:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589376664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=rZ+0Q6w2JhCJ+YHhCDkagX+ViVcqBNbrqtWBcPXjIKM=;
	b=Qm4lj+gqUyLYfA33aP1zpCn9ttw+VptL5iybFtqg8WDqG5j393fpJf3J0V7i76tRPJx1wW
	53XMWJ5f2kRRMn5aNHqK18Y+h8UzgZGoPa9TRYwL9KEqDGBbC3/ExghxKybTYYtn7rWvqd
	Et9X9wXwj9tOsJ9H5YxANkMse3acu8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-DCqVM_IQOQWxrXa72KBQkg-1; Wed, 13 May 2020 09:24:43 -0400
X-MC-Unique: DCqVM_IQOQWxrXa72KBQkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54B0D8015CF;
	Wed, 13 May 2020 13:24:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
	[10.10.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FF671001920;
	Wed, 13 May 2020 13:24:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-21-hch@lst.de>
References: <20200513062649.2100053-21-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <3124488.1589376266.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:24:26 +0100
Message-ID: <3124489.1589376266@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Christoph Hellwig <hch@lst.de> wrote:

> Add a helper to directly set the IP_RECVERR sockopt from kernel space
> without going through a fake uaccess.

It looks like if this is an AF_INET6 socket, it will just pass the message
straight through to AF_INET4, so:

Reviewed-by: David Howells <dhowells@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
