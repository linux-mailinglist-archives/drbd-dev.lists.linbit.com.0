Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 665081F8283
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:15:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4ADEA4203F2;
	Sat, 13 Jun 2020 12:15:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D42104203EB
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:18 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id x13so12288391wrv.4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:date:message-id;
	bh=E3GyhKojXVNo0Mooki74/Av48EK9IfzgPCl8v5tu8BM=;
	b=NfJfvHGnNBk+Zq270ixKDdojzMCAX0NpQRrOGwlVCfS6LX2U0KoRxyI/uZrFUbLrkC
	XARvT6W8t1nSfnE1VrbzApP8OL9q/upeUsfdNLCAzBC7sZ/Ejp7GBBtqvQgdjhuWUKjF
	ItPPmB6T60Hs3DJ/qdMxLJ2+6YqcVLbOmKrh84khMAJ295quP+/P0tGTPCAkrp8wEEFr
	lDCKlB8K7UJTUqKRRoYYRyCFxWcHppU593cK7NePPk8sdl7H82Lp41zfrkSGL6WcOjIh
	ynsKHG9U2V4nbhhWPc2xeuvljhdi90sSJToiPnXwNE2/wy4C0cBSiLMej0kQN1fEDG+U
	NeNw==
X-Gm-Message-State: AOAM533phFiIoJiV54/7miM4vDi5/lxvbImRBWXwZ9SkNJDcDSDO5rHk
	xvz+oVr7fvYJugZ3bU7TOeemu8WbidnxB5zl
X-Google-Smtp-Source: ABdhPJyYagmVcQEC0dclf/GDI54HA6/5jOlEwCkB9120wkForVuQ/XON73XqV4TEpKG2TtmYXm4PrA==
X-Received: by 2002:a5d:4ec3:: with SMTP id s3mr20499509wrv.103.1592042298350; 
	Sat, 13 Jun 2020 02:58:18 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	o18sm12950915wme.19.2020.06.13.02.58.17
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:17 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:16 +0200
Resent-Message-ID: <20200613095816.GP4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB3C84203D6
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 09:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590047068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=E3GyhKojXVNo0Mooki74/Av48EK9IfzgPCl8v5tu8BM=;
	b=cZ+tiaDt2SKjgkJKzVGaJpahOhaB2+9+m8AvgTpIys60nCSEPq011FK1Ik6rsBxau9IfEG
	4YFpSVruaTCTTsHiqZ1vPZ7+/8bLWUuDQMvO5466oY0G2eSOO7A6hKW/LPUw/V0JFtq62M
	U1FlTHCRFbujDth6rBK+PLPlzIVSJqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-M92JCxb1Oi-ciaPgtC3hqA-1; Thu, 21 May 2020 03:44:24 -0400
X-MC-Unique: M92JCxb1Oi-ciaPgtC3hqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D59A835B42;
	Thu, 21 May 2020 07:44:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
	[10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7135C1B0;
	Thu, 21 May 2020 07:44:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200520195509.2215098-30-hch@lst.de>
References: <20200520195509.2215098-30-hch@lst.de>
	<20200520195509.2215098-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <71190.1590047051.1@warthog.procyon.org.uk>
Date: Thu, 21 May 2020 08:44:11 +0100
Message-ID: <71191.1590047051@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	dhowells@redhat.com, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Jakub Kicinski <kuba@kernel.org>, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 29/33] rxrpc: add
	rxrpc_sock_set_min_security_level
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

> Add a helper to directly set the RXRPC_MIN_SECURITY_LEVEL sockopt from
> kernel space without going through a fake uaccess.
> 
> Thanks to David Howells for the documentation updates.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David Howells <dhowells@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
