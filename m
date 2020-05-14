Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D26451F826F
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:07:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B98E44203FD;
	Sat, 13 Jun 2020 12:07:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BDE0420406
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:27 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id l10so12262088wrr.10
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fGWHZrRoLExAS3mHwk8ufZ/s4MYBxFdJolCaEnLqA8M=;
	b=JdoAeQuVEQO3cR/6nvk8BByTpbnrApRjLaC3R5oIxtouFGJorQq5uEk6UA6yzRCGYZ
	4n5mPhVSd6VdlEgl7DYKKKrZmBLV3uYNWIvYclfhNAEloMVFWoq0mtVSZ7ROhd4sC6vx
	/D6VrCUMk0TyJ8XQj4NSApy73X6QidMJQCWbPMBRI4u5/0IBe0cmWA6lveVvhFyjthvH
	OWhfEkCpjTeY2Eaz+BIx6CZ2a0r8TLqRPuF7BVcQBtsg/0bgWwinkvAQYHDn/w5aQ82S
	ugnj+i3YTbddA3Aykp6H8xUdIxuR8hvuOwIQ74Sfhf+pcwgeuNWePQAWDdZaU9ceoKff
	A3tw==
X-Gm-Message-State: AOAM533cTuJ9zGlPgO4XiVqu19mJFx74WQ+iyarXoNRcRJX3TNUP/axN
	5isZG2L1nJkh+j1tuTTL6bVU//vnCj2bnKkq
X-Google-Smtp-Source: ABdhPJwO1p+ueAGuq+Z4ENPFaSdRVjNUOaBDjWqFppQWM1Py9gDcV1j89+EL3J9+dOj3IwKsrZ1o0Q==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr18225982wro.145.1592042246666; 
	Sat, 13 Jun 2020 02:57:26 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	v6sm14728948wrf.61.2020.06.13.02.57.25
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:26 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:24 +0200
Resent-Message-ID: <20200613095724.GZ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 366 seconds by postgrey-1.31 at mail19;
	Thu, 14 May 2020 16:30:28 CEST
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6EE14203C1
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 16:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589466628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=fGWHZrRoLExAS3mHwk8ufZ/s4MYBxFdJolCaEnLqA8M=;
	b=f3OgtN3d2M2W/7yU67hRg+O2LkH5TXfUUuIsSj5vcktYnO9CUtrqhmXkvYRcUkINpxPPDj
	TEpgDRJIDXHMM9fC8AyNFvPeS8ciSYezgLQT1ECKPhu5iitmSnPNMWq3bqIvxrA2ctmfLj
	B1VU/SavEFinIvbdJMpUjLEPqVXvXlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-gDkumX-iOmOMry4mSLa6sw-1; Thu, 14 May 2020 10:24:17 -0400
X-MC-Unique: gDkumX-iOmOMry4mSLa6sw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B5F8800053;
	Thu, 14 May 2020 14:24:13 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E42045D9CA;
	Thu, 14 May 2020 14:24:04 +0000 (UTC)
Date: Thu, 14 May 2020 09:24:03 -0500
From: David Teigland <teigland@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200514142403.GA1447@redhat.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<20200514104040.GA12979@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514104040.GA12979@lst.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Christine Caulfield <ccaulfie@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	linux-sctp@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] is it ok to always pull in sctp for dlm,
 was: Re: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

On Thu, May 14, 2020 at 12:40:40PM +0200, Christoph Hellwig wrote:
> On Wed, May 13, 2020 at 03:00:58PM -0300, Marcelo Ricardo Leitner wrote:
> > On Wed, May 13, 2020 at 08:26:42AM +0200, Christoph Hellwig wrote:
> > > And call it directly from dlm instead of going through kernel_setsockopt.
> > 
> > The advantage on using kernel_setsockopt here is that sctp module will
> > only be loaded if dlm actually creates a SCTP socket.  With this
> > change, sctp will be loaded on setups that may not be actually using
> > it. It's a quite big module and might expose the system.
> > 
> > I'm okay with the SCTP changes, but I'll defer to DLM folks to whether
> > that's too bad or what for DLM.
> 
> So for ipv6 I could just move the helpers inline as they were trivial
> and avoid that issue.  But some of the sctp stuff really is way too
> big for that, so the only other option would be to use symbol_get.

Let's try symbol_get, having the sctp module always loaded caused problems
last time it happened (almost nobody uses dlm with it.)
Dave 

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
