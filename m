Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05F1F8261
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:01:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C437142044A;
	Sat, 13 Jun 2020 12:01:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E56624203E7
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:45 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id p5so12261734wrw.9
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=d/0WQiW+co/T0Lh806Aa2CF0lrVFjIjJV8t4w61WLTw=;
	b=NuMQtiRfBtWdIwACwqxpaF0yHdJStxn2Q6XY9RGMZRGOtTskgMTvsf3p0+T2B7zQNl
	AozGAM1ViUCJPq6UwHX/UKbpBFt00bD2SFjBtI7WpSc/nyNEBs4WhtrUwUMh7YvcEQ06
	jrX0Ayj3FkEBjczgKdmXy/q/qOSf+QpS6BqkSrjWcuUDXcL2N+RNe6EIinjrqa8HVZQC
	uAHItvpWrjD1wpHAyWVaR98AipbA11Tml+Cdbo+S68Ux7iFQxsUhwwNu9hp+LqVz9sSj
	PPlzE/RJgl1hNOdWjZ9bJEllf1GXzbiebqIzxCKZLKYfBP3qfzH554hZ0pFBZLeZ+NkF
	Lh1g==
X-Gm-Message-State: AOAM532lgFBsfF+TOwJCDk+Vz5GtfzNcPN/MMxKTeyOj0Y2mv1Q+wMJY
	XGY/ugsZK9NCxT0z/yJomwXtovUbc3j1pY3L
X-Google-Smtp-Source: ABdhPJx+dJTYwiIKwgxJ/VXRtayFRJBW/a8jb+z6SjJD4MF2FEQ8K/ySvlA2Ng7ELnjzRz7tJNH8MA==
X-Received: by 2002:adf:e2c9:: with SMTP id d9mr19064439wrj.227.1592042205416; 
	Sat, 13 Jun 2020 02:56:45 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	l204sm13367907wmf.19.2020.06.13.02.56.44
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:44 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:43 +0200
Resent-Message-ID: <20200613095643.GM4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EAA854202F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 15:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589376721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=d/0WQiW+co/T0Lh806Aa2CF0lrVFjIjJV8t4w61WLTw=;
	b=GlUSbuivpifwGyKK6+0P+NNB8B9FM3mwj/jaEXQ4AT02mcYvoBis6W6rxGf/f/zYHUF3uj
	v2GovZPuD/LL063jbhEsrrs38T8B2CaZuZ5odiuGg7LcJYzYzC2ggV/++hSVoItfTfZvcn
	7gU9h6FI8rUgtG+PPD1mcdhGW7k+mto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-QSRiE1hJM-O7Lq496hJNkw-1; Wed, 13 May 2020 09:25:35 -0400
X-MC-Unique: QSRiE1hJM-O7Lq496hJNkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360CB18FE866;
	Wed, 13 May 2020 13:25:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
	[10.10.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31ED9783B3;
	Wed, 13 May 2020 13:25:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-24-hch@lst.de>
References: <20200513062649.2100053-24-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <3124570.1589376319.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:25:19 +0100
Message-ID: <3124571.1589376319@warthog.procyon.org.uk>
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
Subject: Re: [Drbd-dev] [PATCH 23/33] ipv6: add ip6_sock_set_recverr
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

> Add a helper to directly set the IPV6_RECVERR sockopt from kernel space
> without going through a fake uaccess.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: David Howells <dhowells@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
