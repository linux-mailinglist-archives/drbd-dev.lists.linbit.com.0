Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5728BBD8
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:28:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 397234203AD;
	Mon, 12 Oct 2020 17:28:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C8A494202B6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:27:25 +0200 (CEST)
Received: by mail-ej1-f66.google.com with SMTP id dt13so23761020ejb.12
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6q68v5u7vwVCnIb0VZgVxQoqfUXQGG1Lby2jaq6VkqQ=;
	b=Da2mficK+qUJ8FqI2MSXRI+0aWwmKjLMfIL9n4hGvIIAnrxf+CT0oRvaGjwusl9/Yx
	0ADwUWxoTPGiPmFz6/AURqzSGDxWjO844yaJPnwjvE3hJFNsqdwKu3EiLlz1ux7eLB8T
	ZAOT2KJneFw3Qbvz3QyAqrg0Psp9IWpAB2hZ+xAgEq2wFPmShxiuAPueu16vMuRrBR4r
	1KEojTrIwAFOHHlv56lsFn0EKAaa93goA2MuzKqn25/vl7YjfRhXEO88gGQLysK0UEKS
	oZNNLilW8TjiIkAOc1hp9HJkoK79WZ48B9HeJdc3miYJzElgMKhGXJx/JaO4NkNMrF5e
	aTVA==
X-Gm-Message-State: AOAM531ubvUmdgsSj+A77Xp4xrWqVTdDf371nTcIASKJZds1s7rICnoW
	Q3cljHZTTfq+mWZnJQt3RvBCMI2tDPtSg/fZ
X-Google-Smtp-Source: ABdhPJzf0XIWUDOF9Cf9huaLu+Zc3wckA9BkB/emUAPBcMe4EuWGCn6MXNEIRfoGB8tRzWInu4x2AA==
X-Received: by 2002:a17:906:c7d9:: with SMTP id
	dc25mr28128621ejb.482.1602516385348; 
	Mon, 12 Oct 2020 08:26:25 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	p15sm5145557eji.40.2020.10.12.08.26.24
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:25 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:23 +0200
Resent-Message-ID: <20201012152623.GE2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 478 seconds by postgrey-1.31 at mail19;
	Sun, 11 Oct 2020 21:03:44 CEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
	[83.223.95.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D9ACD42022A
	for <drbd-dev@lists.linbit.com>; Sun, 11 Oct 2020 21:03:44 +0200 (CEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 683C230000F41;
	Sun, 11 Oct 2020 20:55:45 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4F51F67C2C; Sun, 11 Oct 2020 20:55:45 +0200 (CEST)
Date: Sun, 11 Oct 2020 20:55:45 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Elimar Riesebieter <riesebie@lxtec.de>
Message-ID: <20201011185545.GB18543@wunner.de>
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
	<20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
	<20201011184741.c766frixh5v7xgyb@toy.home.lxtec.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201011184741.c766frixh5v7xgyb@toy.home.lxtec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument
 was removed in v5.8
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

On Sun, Oct 11, 2020 at 08:47:41PM +0200, Elimar Riesebieter wrote:
> * Elimar Riesebieter <riesebie@lxtec.de> [2020-10-11 20:39 +0200]:
> > /var/lib/dkms/drbd/9.0.25-1hsh2/build/src/drbd/drbd_bitmap.c: In function "bm_realloc_pages":
> > /var/lib/dkms/drbd/9.0.25-1hsh2/build/src/drbd/drbd_bitmap.c:368:15: error: too few arguments to function "__vmalloc"
> 
> This was on 4.19. I think the changes must depend on KVERS as the
> modules should build from 4.19 upwards. Will try your patch against
> 5.8 tomorrow.

The patch tests whether __vmalloc() expects 2 arguments and applies
the coccinelle patch if not.  The coccinelle patch adds the third
argument to the __vmalloc() invocation.  This works independently
of the specific kernel version.

Thanks,

Lukas
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
