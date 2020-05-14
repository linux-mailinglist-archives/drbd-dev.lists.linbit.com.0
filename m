Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649D1F8270
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:08:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E29124203FD;
	Sat, 13 Jun 2020 12:08:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88B3042040A
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:39 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id x14so12295581wrp.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:date:message-id:to:cc:subject:from:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aMN+VirALPxKFbiV3tfKGToi8yQP3OvC2+aZJZCj1Lg=;
	b=I9l6t6BUzWGHUy7oT5VzGbqXMsyn+ZDiQnaTEyrfI6ZyBamHYKAsimK9grcXoeGUqL
	9SeOKf0KyZ18FJTQIrhYV8c8WnY56SPP2UmTtAiZwD5BcMhLFLsa8pKumapbK42SDvNB
	0B+Hy9A+L2xmDM7CysJu85Z+mhmMZbkY0T48dly+G3VObenKW7ZTREMYmoeoPV55fU1s
	lix1wbbtWB4t6H4K12Mk/DZHiQ2eZOp+LewIba4F24vZpnlsolnmlLqgPiQwfFjlcbKR
	nM2zKw0SBMZz0tbnUPkmmhsLrOQ+Rum8iyyEykFRBbjQXqlf3Wurtj00Tr4bPv7ygkO8
	UPVQ==
X-Gm-Message-State: AOAM532IeaAmcqvRff7aFjxDTgcCmQG+VsPOSGGkbivg//KLyvC3spNA
	t0e9lYvj55sjpCK9w3jHr05vcWKteGlnHuVY
X-Google-Smtp-Source: ABdhPJxtLVp2jZ1wAeMwTGUXlS+0BRkfOmod6pw26/8cDsjzO8nuopGhe+EZVlZ8pgrzmnsJ/VS1ZQ==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr20675599wro.271.1592042259073; 
	Sat, 13 Jun 2020 02:57:39 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214])
	by smtp.gmail.com with ESMTPSA id r5sm14061980wrq.0.2020.06.13.02.57.38
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:38 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:36 +0200
Resent-Message-ID: <20200613095736.GA4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4169A4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 21:58:28 +0200 (CEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 7E265128D325E;
	Thu, 14 May 2020 12:57:52 -0700 (PDT)
Date: Thu, 14 May 2020 12:57:51 -0700 (PDT)
Message-Id: <20200514.125751.2175402701800030395.davem@davemloft.net>
To: David.Laight@ACULAB.COM
From: David Miller <davem@davemloft.net>
In-Reply-To: <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
	<756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Thu, 14 May 2020 12:57:53 -0700 (PDT)
Cc: marcelo.leitner@gmail.com, linux-nvme@lists.infradead.org,
	edumazet@google.com, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, hch@lst.de, cluster-devel@redhat.com,
	kuznet@ms2.inr.ac.ru, linux-block@vger.kernel.org,
	joe@perches.com, kuba@kernel.org, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
	yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	jmaloy@redhat.com, linux-sctp@vger.kernel.org,
	ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] remove kernel_setsockopt and kernel_getsockopt
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

From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 14 May 2020 08:29:30 +0000

> You need to export functions that do most of the socket options
> for all protocols.

If all in-tree users of this stuff are converted, there is no argument
for keeping these routines.

You seemed to be concerned about out of tree stuff.  If so, that's not
of our concern.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
