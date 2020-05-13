Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7161F8267
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:03:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D7C89420401;
	Sat, 13 Jun 2020 12:03:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 64C29420401
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:00 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id x14so12294566wrp.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oGExS5qpyhaJE9sRdyvo65rhkDZrEjTLCCqtKDwIC/k=;
	b=ghE7CLdheVvur8k9msq2O/pMKlIh3R9pvAclSFv7eWNRgBWAYQG9GbH0oSgOllulhZ
	1IJV8A0hBnCLhgyWVf7KCG3uASVCJUX+PHbWeMM0AmZk402+GU0suvbRy09I3fINxy9V
	SQ/8TDyvM/EXgRvQ5jNqK2emWFlX4MmdByKAHoDBVUCTGN8Ze/Ov/TeXenZq3Y+RqFNs
	zgdShakPdtCL7v4/PkXi3QQjSYuB//QA4l4+3qr91PW3qm5gMpPE/s5RiQCN+MP7Veuw
	6ZkndO+no4j5Gzdw2gBmeq37mvhWYTezWyW94ulCKZ6GpoYEBQ+cfXp3LJ6d3GvAqZtP
	IvjQ==
X-Gm-Message-State: AOAM533lV8IPW+uMmqRnwdnSIe5umOJQoeqK9I86HikQewAQIwQ8Zw+k
	eIJWHN9wYH9S5MpRL+b8EAqNSHrzsjbfFHB3
X-Google-Smtp-Source: ABdhPJx9bhQOnuUsQ3nrlvu66q94Jhhsdqt/9nFrQvUiNwLoKn4+y29u8bh7clobJSE/Hpl5ygftkQ==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr18553603wrm.93.1592042219840; 
	Sat, 13 Jun 2020 02:56:59 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	w3sm13718270wmg.44.2020.06.13.02.56.59
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:59 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:57 +0200
Resent-Message-ID: <20200613095657.GR4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2C1024202F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 20:46:43 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id z1so143138pfn.3
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 11:46:43 -0700 (PDT)
X-Received: by 2002:a62:7d91:: with SMTP id y139mr631244pfc.172.1589395542971; 
	Wed, 13 May 2020 11:45:42 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:59e0:deac:a73c:5d11?
	([2601:647:4802:9070:59e0:deac:a73c:5d11])
	by smtp.gmail.com with ESMTPSA id
	g10sm238580pfk.103.2020.05.13.11.45.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 13 May 2020 11:45:41 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
References: <20200513062649.2100053-1-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <2c9a28f7-4268-2295-0d64-ada9178a5553@grimberg.me>
Date: Wed, 13 May 2020 11:45:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
Content-Language: en-US
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	ocfs2-devel@oss.oracle.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


> Hi Dave,
> 
> this series removes the kernel_setsockopt and kernel_getsockopt
> functions, and instead switches their users to small functions that
> implement setting (or in one case getting) a sockopt directly using
> a normal kernel function call with type safety and all the other
> benefits of not having a function call.
> 
> In some cases these functions seem pretty heavy handed as they do
> a lock_sock even for just setting a single variable, but this mirrors
> the real setsockopt implementation - counter to that a few kernel
> drivers just set the fields directly already.
> 
> Nevertheless the diffstat looks quite promising:
> 
>   42 files changed, 721 insertions(+), 799 deletions(-)

For the nvme-tcp bits,

Acked-by: Sagi Grimberg <sagi@grimberg.me>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
