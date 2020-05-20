Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0A1F8281
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:14:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E28904203F3;
	Sat, 13 Jun 2020 12:14:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03BE042041A
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:13 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id r15so10153722wmh.5
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:date:message-id:to:cc:subject:from:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HSeOgSwBSkuGRB1Ybh5Wd6Zbm5UHUgugEYTF7QZ8k14=;
	b=InUN4jSFFYAoe5YuhlH2HZxUD9BjljtDr2jwnFpU3AVRwwQx4awP3Ozjttm6Fs+kCQ
	bW9G9yGcd4tt45xUM7UISc464zKT7Kte5GFIV1AVeD/xHuxVGz44WdtmWaapfd7Y+cy7
	rwMS66OUAgZAp70QOtb6sLOxG4hCqCfRlIn8XwuG6Wf6xpSRMPOxbFsUO2jqepA8XWJh
	mO57WFkyFizs7cAdoeg1C3H+GZ4/Mq86adJSlPzWqmCQAIcG1OtzcmpN+xr1k6DaZMHw
	DODOZZeaEePWw/DOY9Mpti7utlT9zY43HfzwRmTJ6kdWeQ7LEZ1kyzcSBZTLy5lihbRB
	7MPQ==
X-Gm-Message-State: AOAM533sS/Sqo4occD4YyDkcXINccNDFoUG9RuS6MBGH+HsCut0Eli9M
	cZK2LDBpjihJ+ZA45AgBFrLpdCg7YoMHVPVo
X-Google-Smtp-Source: ABdhPJz+4NICbRBZQZZSnkCyXYwvNYptxgm6w5YDRudWlA95fdBCsZNVmb1kCXDOaAd4KUsAq1zwlA==
X-Received: by 2002:a7b:cc08:: with SMTP id f8mr3391504wmh.106.1592042293480; 
	Sat, 13 Jun 2020 02:58:13 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	l17sm14227459wrq.17.2020.06.13.02.58.12
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:13 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:11 +0200
Resent-Message-ID: <20200613095811.GN4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CF3B420427
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 01:24:00 +0200 (CEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477:9e51:a893:b0fe:602a])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 9CDFF12728305;
	Wed, 20 May 2020 16:23:58 -0700 (PDT)
Date: Wed, 20 May 2020 16:23:55 -0700 (PDT)
Message-Id: <20200520.162355.2212209708127373208.davem@davemloft.net>
To: marcelo.leitner@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200520231001.GU2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Wed, 20 May 2020 16:23:59 -0700 (PDT)
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, hch@lst.de, cluster-devel@redhat.com,
	kuznet@ms2.inr.ac.ru, kuba@kernel.org,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	nhorman@tuxdriver.com, yoshfuji@linux-ipv6.org,
	netdev@vger.kernel.org, vyasevich@gmail.com,
	linux-kernel@vger.kernel.org, jmaloy@redhat.com,
	ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 31/33] sctp: add sctp_sock_set_nodelay
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

From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Date: Wed, 20 May 2020 20:10:01 -0300

> The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> API could be a bit more complete than that.

The APIs are being designed based upon what in-tree users actually
make use of.  We can expand things later if necessary.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
