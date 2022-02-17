Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC24B9659
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Feb 2022 04:08:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1505742177E;
	Thu, 17 Feb 2022 04:08:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD15F42177B
	for <drbd-dev@lists.linbit.com>; Thu, 17 Feb 2022 04:08:00 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id
	h14-20020a17090a130e00b001b88991a305so8202266pja.3
	for <drbd-dev@lists.linbit.com>; Wed, 16 Feb 2022 19:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=m0P9N0WVb6AAY2j7DvviRpPpziBTQrcj2AKsHwgmWuw=;
	b=MXrMezWjXbcndPIug7qJGx/KHFAQ7CSHaswSmR9MRANlQU9yJCNBptTPJazM8l/YCk
	mqAxPoN1u3ukSKF6AZDJQUqb/ILcTsmm6odOPcNe+AecyCA6qkVUDjo2VMVuqzKHNs4v
	1BvU4cBk2ewB20ZLqR9BXLWfclLCTn/j5n+vya9PD7VgV4uAfHaosnxKv5YylxkqkbJP
	Ho8xLE0N7fAh/qK0Kkmy6ySJtwCLcyM2EmOOvxYa1X5/mFmuwFYaNotlT5W4Kk0zq2oM
	OBsmIxWQbbP+Fxvvwx8eeEcAZMg3ZwmKFevlXqa6T5omJ5uYlILM7KsI3b8t7lDKfRU0
	xGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=m0P9N0WVb6AAY2j7DvviRpPpziBTQrcj2AKsHwgmWuw=;
	b=btMcaf0j90o86GtVrY2UIwh9O8mvZ18774WYSJ5wmiy1sCWBo6+ODgbesqDXU68jjB
	f82NSaooVOL1akjbDFyvrLWWO132RLotkmBIIrZmDjq5hs4ecSbvpfKB/NBy70sgpnUN
	yPcys1SkH7uMgobGyfEtHqVeNEFvw5qEHR8wxdMN66mxGV6ypyNi7/3YF7r3Bml5+NLU
	GbUm4C5R8NuaSOOJB4IGxh8cVAPmfofD2PE4tIuWm6RrHtn6zruyvRE+krDL1e/QIWQn
	+wX2D9aHtTc79GT7NCFIrDB7hIbSV5OjxEvCX+lGseGaoqHtMoRionIs+iPpdYmn9XvI
	1fzA==
X-Gm-Message-State: AOAM533NxH5MDswoS0FXgApDflrY4GAe+cJjMMBJRNEVS3TbITAprlN/
	jyXMV/6jAS2YjhRQy6iHWOcJHA==
X-Google-Smtp-Source: ABdhPJz0asluo8iIS9RrrQHu2lUE14mBYhmmL4kxvHAkUj2TEWV/p8/NhGuQnU8TsBWnkNPOevvXaQ==
X-Received: by 2002:a17:902:f787:b0:14f:43ba:55fc with SMTP id
	q7-20020a170902f78700b0014f43ba55fcmr979111pln.3.1645067279683; 
	Wed, 16 Feb 2022 19:07:59 -0800 (PST)
Received: from [192.168.1.100] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	lb18sm407819pjb.42.2022.02.16.19.07.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 16 Feb 2022 19:07:59 -0800 (PST)
Message-ID: <2f3f1c98-e013-ee03-2ffb-3a14730b13b9@kernel.dk>
Date: Wed, 16 Feb 2022 20:07:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.5.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<yq1wni3sz4k.fsf@ca-mkp.ca.oracle.com> <20220210055151.GA3491@lst.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220210055151.GA3491@lst.de>
Cc: ukrishn@linux.ibm.com, target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	manoj@linux.ibm.com, haris.iqbal@ionos.com,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com,
	jinpu.wang@ionos.com, mrochs@linux.ibm.com
Subject: Re: [Drbd-dev] remove REQ_OP_WRITE_SAME v2
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

On 2/9/22 10:51 PM, Christoph Hellwig wrote:
> On Wed, Feb 09, 2022 at 01:00:26PM -0500, Martin K. Petersen wrote:
>>
>> Christoph,
>>
>>> Now that we are using REQ_OP_WRITE_ZEROES for all zeroing needs in the
>>> kernel there is very little use left for REQ_OP_WRITE_SAME.  We only
>>> have two callers left, and both just export optional protocol features
>>> to remote systems: DRBD and the target code.
>>
>> No particular objections from me. I had a half-baked series to do the
>> same thing.
>>
>> One thing I would like is to either pull this series through SCSI or do
>> the block pieces in a post merge branch because I'm about to post my
>> discard/zeroing rework and that's going to clash with your changes.
> 
> I'd be fine with taking this through the SCSI tree.  Or we can wait
> another merge window to make your life easier.

Let's just use the SCSI tree - I didn't check if it throws any conflicts
right now, so probably something to check upfront...

If things pan out, you can add my Acked-by to the series.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
