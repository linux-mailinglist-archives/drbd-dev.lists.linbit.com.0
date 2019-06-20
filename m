Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4F4CAF0
	for <lists+drbd-dev@lfdr.de>; Thu, 20 Jun 2019 11:34:02 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D97C91028A70;
	Thu, 20 Jun 2019 11:33:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 316 seconds by postgrey-1.31 at mail09;
	Thu, 20 Jun 2019 11:33:58 CEST
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 734BF1019AC6
	for <drbd-dev@lists.linbit.com>; Thu, 20 Jun 2019 11:33:58 +0200 (CEST)
Received: by mail-yw1-f65.google.com with SMTP id s5so886728ywd.9
	for <drbd-dev@lists.linbit.com>; Thu, 20 Jun 2019 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pkYYzzmuO6qzdnat3h33y3pM8E7kKewEIiEkDUHx7H0=;
	b=j8DZaW9ztu6Ci7J84xTngCASa9iq5ql8O7+dlw8PRxK2mhwM7eHCHPbnnkVqB1kKQJ
	R/LdXjFzJ/8htHnGflXtFGlLba4AMVE4M2EqE0+XlDVnH+MtG4rlqGQAT+ucoFcyJVpE
	PvAfUQ7QA+oNd3a0DpxuP70X+npNTUy/O9Qn3GcDWf2L+TFA/vYHGxbIfRqpWWaA+Z/s
	HleyoEJop6Alk6mq2aSwWoxWiP3YQZuKip1rVQZbz532K32dvocsuIOMklm/0HFQ8C9s
	UIoJWxRC3o+BgRoTb4LcIdMISS3KEoqesFalBIXTpMW6+fonsBwMwCU3JhZNCBFQjjnm
	KweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pkYYzzmuO6qzdnat3h33y3pM8E7kKewEIiEkDUHx7H0=;
	b=fXB/FnV1RpaMll27gztKdX7ofUQwyto/UQ+2ij3IE8zaJlzFaByxTHBQAd5DnlaC+z
	kmPtgdeSEpF4aRgmm8i0zmEPnvodRVpVFZZrH8wZvbVQhX4WIywE9+JjClOItZYJW/fj
	TJO590I6NBv8vyGciScb+4fYcstf/Ov6uYkKduq9UwmZ53j51fnDGCrq+QzBA0SqPsEi
	vH2f/XPxCfWg7XWf8D2EBnXb9YwAk10DSyj4TkZz+ydmEmKcmGx7f6quHbeKumFk5RVZ
	OwPKxxBwUgwylj4xu1LatisbjgHsPRy7DBXWESvEGenIDh3oJhn5NachUDGhSkMoPkq7
	WL0Q==
X-Gm-Message-State: APjAAAWrfLHjc48gpe2jeE8MouDs9lYzDUgYjIaAa7EvIrXE+woWDoEv
	5yuFKHJSnMj43bezGCxpIlmB8TdDiJV8XCwu
X-Google-Smtp-Source: APXvYqz+01oDck7OMjNmDPqRipY55C4f4lin+fTgOLSQDSlJyBbzt16tmLJhJmQGK6bBENzGnuUYyg==
X-Received: by 2002:a0d:d656:: with SMTP id y83mr4167432ywd.79.1561022920799; 
	Thu, 20 Jun 2019 02:28:40 -0700 (PDT)
Received: from ?IPv6:2600:380:5278:90d8:9c74:6b59:c9f5:5bd0?
	([2600:380:5278:90d8:9c74:6b59:c9f5:5bd0])
	by smtp.gmail.com with ESMTPSA id
	v192sm5835108ywv.40.2019.06.20.02.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 02:28:40 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <20190618154549.GA15265@kroah.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <db5d81da-c373-21c2-b213-38e46ceaf722@kernel.dk>
Date: Thu, 20 Jun 2019 03:28:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618154549.GA15265@kroah.com>
Content-Language: en-US
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: drbd: no need to check return value
 of debugfs_create functions
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 6/18/19 9:45 AM, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
