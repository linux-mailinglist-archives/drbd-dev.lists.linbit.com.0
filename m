Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FB72110CE
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Jul 2020 18:38:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 611EA4203ED;
	Wed,  1 Jul 2020 18:38:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
	[209.85.219.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BBD724203EA
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 18:38:16 +0200 (CEST)
Received: by mail-qv1-f42.google.com with SMTP id p7so11286170qvl.4
	for <drbd-dev@lists.linbit.com>; Wed, 01 Jul 2020 09:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=tnWfjqu9qwTdD4KnQK/3+SjWTBx9SJibvmRRCZ2MKpw=;
	b=U026WByv7++7/w1+Nu+RBzmT42CWmL089oP2jZPE4GfX8trhuMpatdvHRasGwxl1tp
	esIRMJhHnW5uCzGbrrP5CE9k4nW7c65rE4KRI9NkWii4E6mEPbKGBXdTFeEP0b5/X8j1
	RKDZhhs7eEWkZ9yrTYjSzyRQuzgfxSGkKewuCj72VWynBsVS+2Ska24TaCYNSUtYNx0h
	tkr380dMygtpbEq4afb+a4dCf6bAwClROx8TUXDVt1XYAVILF8ZQdXine5RK1wrhdCLx
	lurHJt08cKi6hQMnrm0IC1VIZZ5Da6Y0NgMH3p1I2KbSxRTE3WPzEilFi6RtD7avMeW2
	+K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=tnWfjqu9qwTdD4KnQK/3+SjWTBx9SJibvmRRCZ2MKpw=;
	b=L4Uu6uocieJEvUB8o2yKXnNRb2j3dDY7rgUP8j6MvvEPmHn+7U4jNdhxcnPZyrRunq
	a0Bxcr/ztAlU60NGvr/0DPBnqmAxKAXnOqgWMAVy04XMrZpQbMV42DdwpUHLMh7VYiIW
	68RSlmaXJyl4ZCEzfgUFpC8C7dfQDnBQ00OaGcgMZKamH7i3ZeKxB9clM4mjzlLmqSGb
	PYM6HcaFGgEPkYoj2eho0xbEJKeT3kV32t6u2OgZpiezCawIE4wmbMZWGrvo+rsGqw/j
	RraZhK+a1FpkIqEzeJvIyuhpmNYaGuNk/jpMK+E1YH5hOSu1FFZTkW1unJ+9aqhRG3AL
	g7Cg==
X-Gm-Message-State: AOAM531AR8sdE/iZ04njX2vFkYRXqZo5kgw+JoE0OVvK2JIu9T5ixUIZ
	MZGYEjA/N7ILp53hT8FaZIw=
X-Google-Smtp-Source: ABdhPJzfqJE8PIES5DnR2PTCVTamwJmruYSeMWZpKr4HJeNZUuy5RzchyjxSpfzGXXbaj1X8ONNd6g==
X-Received: by 2002:a05:6214:10e1:: with SMTP id
	q1mr24708355qvt.78.1593621495518; 
	Wed, 01 Jul 2020 09:38:15 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:f839])
	by smtp.gmail.com with ESMTPSA id u1sm5792798qkf.49.2020.07.01.09.38.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jul 2020 09:38:14 -0700 (PDT)
Date: Wed, 1 Jul 2020 12:38:13 -0400
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200701163813.GA5046@mtj.thefacebook.com>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, cgroups@vger.kernel.org,
	linux-btrfs@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove dead bdi congestion leftovers
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

On Wed, Jul 01, 2020 at 11:06:18AM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> we have a lot of bdi congestion related code that is left around without
> any use.  This series removes it in preparation of sorting out the bdi
> lifetime rules properly.

Acked-by: Tejun Heo <tj@kernel.org>

Thanks a lot for killing the dead code.

-- 
tejun
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
