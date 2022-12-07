Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D02ED645FA1
	for <lists+drbd-dev@lfdr.de>; Wed,  7 Dec 2022 18:08:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 270394252BC;
	Wed,  7 Dec 2022 18:08:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 17F0042096D
	for <drbd-dev@lists.linbit.com>; Wed,  7 Dec 2022 18:08:53 +0100 (CET)
Received: by mail-io1-f46.google.com with SMTP id d123so6712375iof.6
	for <drbd-dev@lists.linbit.com>; Wed, 07 Dec 2022 09:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=+r3z2TzChBc0Vs/D1sJ6f4Z6Cq8sqK5Sifftb2ph/uA=;
	b=sqgK4uVgdukFxIDxOvSAAyQFpMopVm99bZ5YD2B/lQFb1XglqtMEdjzv4zSPvnedAj
	PlIMswBqc8UYikh4BdgySLaWBAmwPQLCA+DlUrsRTHy+/Y4trGeyfTrXAjWjIXqmWBgX
	hTw2LZQ0rDXoDM9eo98BrRubaVVwABlt9qLRJHkrq14N5qdMHboXlGZVVHnZrW3foxss
	cYd/kgCu+72av+pycZz+zetKRaKEH7IpVSwk9xgVJsZMOfSPMFagEGeyCzFLMIh9/Jhd
	GCY129UD4jcHF5FgAomHtHxC6KVv+ObkjnkDwWHBHgewjgg/JqQUNZeIdPzgrsE+ubKz
	hDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=+r3z2TzChBc0Vs/D1sJ6f4Z6Cq8sqK5Sifftb2ph/uA=;
	b=LMYYKd7fC77EFFVex0IzklPYlPQn+shUu1xzM2e/oxxr39SL+xOg31rDkzHdlXLyyS
	B0KUF8O4sk9ItITwWNOXTukpfevBvZwCYvUlbCjVYguDAgE7QFzgeHwTS2LoNYad+3pk
	wG3ptW9Yr6YVxTj7+grPMLsdOrPxWpDt6qy3JWeBI6Tk05pmncXhSnXIQFzCU9vMQLD0
	J6COMROBKqdzh+9ih1m2Xpm0RLUUBEv7dzq/CNAHs7PMFAIs7o1u+883IDGvdIi19/Oq
	xNgXvFW0PU0qN+qcsXquBp4h7I3j9sLcFV9Hnw81uhfCCcbxR6ugE0Gy9nQMmjjZOUca
	puVg==
X-Gm-Message-State: ANoB5plBnUSgkhW4FV6bgD5v5Q1hOpBBsfKzRkVfW09NPxjgKKCPjwjP
	268mj7BojH1f8xELfAjZtbFepg==
X-Google-Smtp-Source: AA0mqf7yLejbRNfqMUu3ilEvsYdDj7YhVkPipELjA6VqWKNVXZJlTdAqiTcfQmriCKmlYB7qULxDWg==
X-Received: by 2002:a05:6638:1124:b0:38a:171a:dee with SMTP id
	f4-20020a056638112400b0038a171a0deemr12454949jar.292.1670432932906;
	Wed, 07 Dec 2022 09:08:52 -0800 (PST)
Received: from [192.168.1.94] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	o27-20020a02a1db000000b0038a0c2ae99bsm7327723jah.18.2022.12.07.09.08.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 07 Dec 2022 09:08:52 -0800 (PST)
Message-ID: <eaf4f9a8-dfc6-402e-4a1a-732034d1512d@kernel.dk>
Date: Wed, 7 Dec 2022 10:08:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.5.1
To: Gulam Mohamed <gulam.mohamed@oracle.com>, linux-block@vger.kernel.org
References: <20221206181536.13333-1-gulam.mohamed@oracle.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221206181536.13333-1-gulam.mohamed@oracle.com>
Cc: nvdimm@lists.linux.dev, philipp.reisner@linbit.com, song@kernel.org,
	dm-devel@redhat.com, ira.weiny@intel.com, agk@redhat.com,
	drbd-dev@lists.linbit.com, dave.jiang@intel.com,
	minchan@kernel.org, vishal.l.verma@intel.com,
	kent.overstreet@gmail.com, ngupta@vflare.org, kch@nvidia.com,
	konrad.wilk@oracle.com, snitzer@kernel.org, colyli@suse.de,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	dan.j.williams@intel.com, martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org, junxiao.bi@oracle.com,
	senozhatsky@chromium.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [RFC] block: Change the granularity of io ticks from
	ms to ns
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

On 12/6/22 11:15?AM, Gulam Mohamed wrote:
> Use ktime to change the granularity of IO accounting in block layer from
> milli-seconds to nano-seconds to get the proper latency values for the
> devices whose latency is in micro-seconds. After changing the granularity
> to nano-seconds the iostat command, which was showing incorrect values for
> %util, is now showing correct values.
> 
> We did not work on the patch to drop the logic for
> STAT_PRECISE_TIMESTAMPS yet. Will do it if this patch is ok.
> 
> The iostat command was run after starting the fio with following command
> on an NVME disk. For the same fio command, the iostat %util was showing
> ~100% for the disks whose latencies are in the range of microseconds.
> With the kernel changes (granularity to nano-seconds), the %util was
> showing correct values. Following are the details of the test and their
> output:

As mentioned, this will most likely have a substantial performance
impact. I'd test it, but your patch is nowhere near applying to the
current block tree. Please resend it against for-6.2/block so it can
get tested.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
