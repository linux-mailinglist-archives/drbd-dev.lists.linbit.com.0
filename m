Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE871F8278
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:11:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 396FA420406;
	Sat, 13 Jun 2020 12:11:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4F3E42040E
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:54 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id x6so12243856wrm.13
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=GvjsS3e29gHaCC17oqlDDJSWYTuyGY6h8lvDFd/vxIw=;
	b=bY0noRljOHQcJ6ZdGvfdtKPUtqVEvZ0dMF2wBhBM27jN6c6v1EQG/Ozf4yFVd7y+LW
	1jiopRZAFPSdZqj3jMpzu+ml9Brcdn4jOZCrXOVHgJNGntqn3MPM18DhiehvzrBkEEho
	7n1ASatXJqYS0I0iLXewOWqu0d3oLoSFZlndA2FgSIx+G19gtQCbVTMNs6Tv6DAzRw43
	4yd7AEADFX6d/pUZ3FyDZXzG3E5G0YWebbLBE5J7ZDIMNGtF+B05bR0WfOqJvhz/aqK1
	lmlf+6eKI1nQOvjqZRlfuomQpCpSDnjMUm9xZSn3Dlpb0TUicXI/Jt1GABq94g68LrEt
	uF+g==
X-Gm-Message-State: AOAM533KsezYTdlBNgatv/Xj4j36CEKZQYuLOlFRW1XLNT4qi4rRW/BR
	D6bMJ4z5IUx6OHluTDGHd31fDjUI4kpPj2B+
X-Google-Smtp-Source: ABdhPJx4KjGR6YpiDnyggA6gWc77xn08dfY9O058+2uv3R5WGMkZ2cW9ai1WS8QULVwVCFwdlsOp+g==
X-Received: by 2002:adf:df03:: with SMTP id y3mr18350833wrl.376.1592042274375; 
	Sat, 13 Jun 2020 02:57:54 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	z8sm14076058wru.33.2020.06.13.02.57.53
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:53 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:52 +0200
Resent-Message-ID: <20200613095752.GG4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18AA5420105
	for <drbd-dev@lists.linbit.com>; Fri, 15 May 2020 17:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589556017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=GvjsS3e29gHaCC17oqlDDJSWYTuyGY6h8lvDFd/vxIw=;
	b=JQx63mMpD2UnUZ9uOSqFpHYK2G53z8u6YEsAcii/QnRVCv0jsjcm1lkPH+sIY6MoDN+0hv
	F9v/rrwFfe83LDsS2IGcjyb8Z6QG6OuKHUL7no1/qhqsKcjFs1W2WCP/ol5MSGDFiddQzj
	684KlY3ca5DRx9DsOb7tCYZ1jwtn39w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-155-r5WCTqEIO1eiQ3eNdBeffQ-1; Fri, 15 May 2020 11:20:15 -0400
X-MC-Unique: r5WCTqEIO1eiQ3eNdBeffQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5FB6189952E;
	Fri, 15 May 2020 15:20:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
	[10.10.112.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05F396AD10;
	Fri, 15 May 2020 15:20:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200514062820.GC8564@lst.de>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <129069.1589556002.1@warthog.procyon.org.uk>
Date: Fri, 15 May 2020 16:20:02 +0100
Message-ID: <129070.1589556002@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	dhowells@redhat.com, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Jakub Kicinski <kuba@kernel.org>,
	linux-block@vger.kernel.org, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

> > The advantage on using kernel_setsockopt here is that sctp module will
> > only be loaded if dlm actually creates a SCTP socket.  With this
> > change, sctp will be loaded on setups that may not be actually using
> > it. It's a quite big module and might expose the system.
> 
> True.  Not that the intent is to kill kernel space callers of setsockopt,
> as I plan to remove the set_fs address space override used for it.

For getsockopt, does it make sense to have the core kernel load optval/optlen
into a buffer before calling the protocol driver?  Then the driver need not
see the userspace pointer at all.

Similar could be done for setsockopt - allocate a buffer of the size requested
by the user inside the kernel and pass it into the driver, then copy the data
back afterwards.

David

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
