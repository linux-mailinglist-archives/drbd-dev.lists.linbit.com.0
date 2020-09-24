Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 794742779A0
	for <lists+drbd-dev@lfdr.de>; Thu, 24 Sep 2020 21:45:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48F474209B6;
	Thu, 24 Sep 2020 21:45:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9105C420110
	for <drbd-dev@lists.linbit.com>; Thu, 24 Sep 2020 21:44:58 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id x22so401983pfo.12
	for <drbd-dev@lists.linbit.com>; Thu, 24 Sep 2020 12:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ADwlTn9rnJzlHv/xfLefERCgTh/zOY3+dj+IP5LMhIo=;
	b=L2Wx7FlLw8QHVp62Ne3mt4GV7+MUCO/WLUazgDqXAmYbUX1Et5GwKUZRbOhKWcg1pJ
	h3F8YG2QH8T53HlhbxkOnKDq7rYr7VYQSpBZ/SrGKbAAN0q9gjlZztvIvkLYWYD2H5p5
	D5jWhUDJxNaNV9x10hDsgdYsv3+GqUJuih92RXGRYnyEyog4jlWpFA8o+B+sqtqEeysu
	zXsVFR5QGsEI7lJZ39JHqx1JjZyubGP7QEwNsybW+JHQWulohPcvjDgNlPxNi7sQOhp+
	YLXR3ph4QhgGStegDp9ue2849D7tWES5wOYPeY73GujeWcYMaP3DsMTgcgakPfQ8C4Iw
	pmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ADwlTn9rnJzlHv/xfLefERCgTh/zOY3+dj+IP5LMhIo=;
	b=unvVK/tKib3l0xlOz9Ru1YUykV7uqbUt6VVwP9JGrbklvsUUB/0+pqlPBqpeSgLGxR
	uk7de4pLW1s3dnrrKdK/RKH12NEhmEga3ElxyAU7df8OTAk6pq6YIOvFP8gHq0HjDikv
	tsPCX/FDsqWiDCm02sX9eapCq4cIHqL83N1wSQx7St/It/MBPYeRbLKqX6sSEMxS+awT
	WLeMkw8ec1QReqQD3YA9mhHo+XGYCYvtLxrVBsu8Naf8FCbwqbX+fZxOEpvE722aIAI3
	WA0LHandQWNVeUkfECjz3ZP0XgBnWjoa2OmGbpuOPli7mIJLCM7Clh2KlHxP+5aBtwgX
	Abog==
X-Gm-Message-State: AOAM5318aNqXtb2rFG0Bn005Ltf6UQesfb9VIrn72Noyo4eSGlRXH32G
	r/0zdwJ3Jie06pfctEAf6QHdPw==
X-Google-Smtp-Source: ABdhPJyn7jUbiC3AGiO/dBfKmKGpcA3VV/JE4LzjEmCUjGJIbrcL8/kmgANM72e+JonEfnG9EJ77rg==
X-Received: by 2002:a17:902:854b:b029:d1:cbf4:bb43 with SMTP id
	d11-20020a170902854bb02900d1cbf4bb43mr778274plo.13.1600976697336;
	Thu, 24 Sep 2020 12:44:57 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21d6::1911? ([2620:10d:c090:400::5:d63d])
	by smtp.gmail.com with ESMTPSA id
	u10sm267612pfn.122.2020.09.24.12.44.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 24 Sep 2020 12:44:56 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a9235ba9-95a0-4251-ee7d-e4012775346e@kernel.dk>
Date: Thu, 24 Sep 2020 13:44:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
Content-Language: en-US
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] bdi cleanups v7
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

On 9/24/20 12:51 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series contains a bunch of different BDI cleanups.  The biggest item
> is to isolate block drivers from the BDI in preparation of changing the
> lifetime of the block device BDI in a follow up series.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
