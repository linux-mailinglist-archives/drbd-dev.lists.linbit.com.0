Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D741F8272
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:09:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4AF3C4203FF;
	Sat, 13 Jun 2020 12:09:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C96B342040C
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:44 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id l11so12300553wru.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:date:message-id:to:cc:subject:from:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sx2vFTE1J+qFeS4XEHWrcAg5fVuo1lfDc1D+9AH2LnE=;
	b=RROFHwplwGs4GKQZ6QRA8jDfxVJGffmp28fkfWrDYIBCuv4Ts+7t/bmJM0CV+LJ8iK
	b97Q/hqITk0Cq4FR7cu5W4bRz0pZFOYaGmpvkQJCRuLnD14t+vbnWYr9zwpac+4JOGls
	v/m6K/ZeIm+sbjkb7PWbIjJA/irUPPosPLjD7918JXj6cZswAnsElk3XutnfrMIumUpb
	BgQoFpPFIgF1t4Yv3vhdMXrYIVcEEqmNWNFdDwjHp6NSHsvrbDjppOKx5qOEmXQZQEpw
	qwLBcFpUURU1HYQOlJdbQp07jNe65gY7FrQbx/Zz0guP/31wVa5HJ1CEId+MHowYQmgy
	XMcg==
X-Gm-Message-State: AOAM5317AjSopkH7pq/uN5YR4UgYTSi0gA2mhqLFdsFAVjewks+2OnrL
	ThDrix73IQa45HK/eCPBGiEoOgeoy0HszVj/
X-Google-Smtp-Source: ABdhPJxHFr0nBnzcA7NwRrodZBJTzJQdxxhC+W8ognuLVdLqtk5Tzk73Kc54Hpxb5wBexjoZWX+0Iw==
X-Received: by 2002:adf:910e:: with SMTP id j14mr18274246wrj.278.1592042264245;
	Sat, 13 Jun 2020 02:57:44 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	f71sm11861805wmf.22.2020.06.13.02.57.43
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:43 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:42 +0200
Resent-Message-ID: <20200613095742.GC4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5430C4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 22:04:00 +0200 (CEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 44DE4128D4959;
	Thu, 14 May 2020 13:03:58 -0700 (PDT)
Date: Thu, 14 May 2020 13:03:57 -0700 (PDT)
Message-Id: <20200514.130357.1683454520750761365.davem@davemloft.net>
To: David.Laight@ACULAB.COM
From: David Miller <davem@davemloft.net>
In-Reply-To: <a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
References: <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
	<20200514101838.GA12548@lst.de>
	<a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Thu, 14 May 2020 13:03:59 -0700 (PDT)
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
Date: Thu, 14 May 2020 10:26:41 +0000

> I doubt we are the one company with out-of-tree drivers
> that use the kernel_socket interface.

Not our problem.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
