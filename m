Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 18926646747
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Dec 2022 03:55:38 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6AF2C4252C8;
	Thu,  8 Dec 2022 03:55:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6002842177D
	for <drbd-dev@lists.linbit.com>; Thu,  8 Dec 2022 03:55:34 +0100 (CET)
Received: by mail-pf1-f172.google.com with SMTP id c7so196696pfc.12
	for <drbd-dev@lists.linbit.com>; Wed, 07 Dec 2022 18:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=+YnwWLbC1k13FDuBmbkgFl4RERtAqz8Hk2l0zfW6u80=;
	b=fU4y3lEGFEK3oscBjLkN1vxfgNM/FZidlQ+rI70OHvgxD0rXJh0EwSK3e2bczFqMkA
	tO2LwtPOEAYZtGQjimEXQ8aStoM+oHrRCZpJNDNOrJTKI/JHeBOK30eol6bW+IR4iBg5
	6bvbpaQVxY9TyhU2N+c7QQA9h+c23vE28pNce8JLnQVD9Bz7KVFAZVNBp+U4WY4PzC6f
	oXQvkaSCLJVDYLe3bcQFvuvQN3QZ2UfyLUBGJaQmSeDW96IREZIk3AzUiqppD7zsYIqk
	Vd2qy53kRGJVHi8kjxDmOkqm8yZRn4/hLIi6OYpVIqVtAFlNgX78uWUxSxkcznrsySrQ
	SZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=+YnwWLbC1k13FDuBmbkgFl4RERtAqz8Hk2l0zfW6u80=;
	b=Xd6gksY6AMwMkH8+o8ejaj7q8kAjMR1wF5FCGbp/wXxo//GCFSzlw/QH/UdD3pQW7D
	j6640RID5Yp+e0XQPNdMlnvfpysd50PjbHdIpmmki14gy6kaW87aW8N4tDrm7jZa2HCt
	8KLNz7OyphFfLSbjfcrmm+NfCCv1SwRSxaEsHSQGhL0PeGJU5aIdyAEeMEgVYMZXv8wB
	Xa/qyRE2RpMNlmYg1uVfxcFGxvffJN0JkadVmgEaOUHgkyR/T9rpqQ8H+gmUcq3NoAsb
	VZbucgLau2HgFb91vGUTAESwUTypMZ9fi7f10CRaw5WdoVx7caj5/HvwqyDe68MroJQf
	nTJg==
X-Gm-Message-State: ANoB5pm4WllvpgueGVfNepuyClk9GwVqULxo6MmN0Yi3ZhDXYL0aFwGL
	RaHWkeHwk9FLxYN1OiGumOQghA==
X-Google-Smtp-Source: AA0mqf4GKdTwpvzKHdR+jWKD59yHhtQiQj6o4bMAawT3TKX0knE/TZzrpzeE/R5qCEqb2PjMIqK3qA==
X-Received: by 2002:a63:d151:0:b0:478:c28a:2f36 with SMTP id
	c17-20020a63d151000000b00478c28a2f36mr13058187pgj.182.1670468133285;
	Wed, 07 Dec 2022 18:55:33 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	n13-20020a170903404d00b0016d773aae60sm15211981pla.19.2022.12.07.18.55.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 07 Dec 2022 18:55:32 -0800 (PST)
Message-ID: <4d118f20-9006-0af9-8d97-0d28d85a3585@kernel.dk>
Date: Wed, 7 Dec 2022 19:55:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.5.1
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Chaitanya Kulkarni <chaitanyak@nvidia.com>
References: <20221207223204.22459-1-gulam.mohamed@oracle.com>
	<abaa2003-4ddf-5ef9-d62c-1708a214609d@kernel.dk>
	<09be5cbe-9251-d28c-e91a-3f2e5e9e99f2@nvidia.com>
	<Y5Exa1TV/2VLcEWR@kbusch-mbp>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Y5Exa1TV/2VLcEWR@kbusch-mbp>
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"song@kernel.org" <song@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"agk@redhat.com" <agk@redhat.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"joe.jin@oracle.com" <joe.jin@oracle.com>,
	"kent.overstreet@gmail.com" <kent.overstreet@gmail.com>,
	"ngupta@vflare.org" <ngupta@vflare.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Gulam Mohamed <gulam.mohamed@oracle.com>,
	"snitzer@kernel.org" <snitzer@kernel.org>,
	"colyli@suse.de" <colyli@suse.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"junxiao.bi@oracle.com" <junxiao.bi@oracle.com>,
	"minchan@kernel.org" <minchan@kernel.org>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>
Subject: Re: [Drbd-dev] [RFC for-6.2/block V2] block: Change the granularity
 of io ticks from ms to ns
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

On 12/7/22 5:35?PM, Keith Busch wrote:
> On Wed, Dec 07, 2022 at 11:17:12PM +0000, Chaitanya Kulkarni wrote:
>> On 12/7/22 15:08, Jens Axboe wrote:
>>>
>>> My default peak testing runs at 122M IOPS. That's also the peak IOPS of
>>> the devices combined, and with iostats disabled. If I enabled iostats,
>>> then the performance drops to 112M IOPS. It's no longer device limited,
>>> that's a drop of about 8.2%.
>>>
>>
>> Wow, clearly not acceptable that's exactly I asked for perf
>> numbers :).
> 
> For the record, we did say per-io ktime_get() has a measurable
> performance harm and should be aggregated.
> 
>   https://www.spinics.net/lists/linux-block/msg89937.html

Yes, I iterated that in the v1 posting as well, and mentioned it was the
reason the time batching was done. From the results I posted, if you
look at a profile of the run, here are the time related additions:

+   27.22%  io_uring  [kernel.vmlinux]  [k] read_tsc
+    4.37%  io_uring  [kernel.vmlinux]  [k] ktime_get

which are #1 and $4, respectively. That's a LOT of added overhead. Not
sure why people think time keeping is free, particularly high
granularity time keeping. It's definitely not, and adding 2-3 per IO is
very noticeable.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
