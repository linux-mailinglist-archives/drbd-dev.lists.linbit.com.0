Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAE20FBA2
	for <lists+drbd-dev@lfdr.de>; Tue, 30 Jun 2020 20:22:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 378EE4203D7;
	Tue, 30 Jun 2020 20:21:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D7118420347
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 20:21:57 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id h4so2705205plt.9
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9nMjhxRG610D6xAYb4aZ5VRp2i+EwPdQw1qks+ZgrLU=;
	b=hwnoVOlqAmU5zhHyPngbwhlN1yE0Rso1wSEH5Cjpo1eHOGtwX+AR6fF4SKm61iSSaU
	xiq7Si+fCLVLBMD4J7QWGIGpRMN22P7LkDW6XHYnqvsHwEiKJn/e7f4zxe/RH81FYZzf
	6Qah7lhZ47GF32wkEdApitqRosxk7IcYLclUVGOXkeLM+pP0S9zvuPgq8PcNplpKOkyE
	awjP1mt8uhAMtNOYRMd+Y1yvSZf+ZepFpwCbSYGQZlgNrN664rZd2V1H/xVqglgX5aPU
	phGafx1o9DcWQXNw7D5cKE9cBpAhM0fImNVpDBnmceKAdk/tkJjCm50uuW5RXHV8UW9k
	l/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9nMjhxRG610D6xAYb4aZ5VRp2i+EwPdQw1qks+ZgrLU=;
	b=W/abrvZRXj+jZ+qov/Cflz5PZFdy+AxlbYkZGWZ0ImXtzlpCHOvpVfEGXKlEXw4Qic
	7yiTKnf3+dSKMPDYHAlbiGJ5aKnW/jmqZRxbMaV9ZdA8j+I9zv41GsY3cemNLVl990Ln
	fGFahd+3EMMQEExakD2FBPeyRDgJwl1bKaW4InoADfiVG769WPG9IEIw/LhI0QaX0lOo
	cQz1v401FPj+EZYewVtrxjYQEXvp8UqLS8uNmlGFFHlRPWoT4gItggLKdjZCtQh0ALvh
	ygLp9EbEN62Kxu/eq2SLL2zy23HPjbLh1HhD5XRPFjU3F4g9Qm6Zsh2RqUqQtcDYkXLd
	heuA==
X-Gm-Message-State: AOAM532n9vkGTmi8FHpAw1yVflCNaoYw7v4sDmAkTI1pjlVkSxVWPBqJ
	N1+qVbS7ig8tUbT0j26+WMHXpDMbWgbWnw==
X-Google-Smtp-Source: ABdhPJx1eVZzUauHavuDMn/utz58o2Sp76o2c6uyFezmO+u8oFk4qpnRUZKKvG8yetkSCycNIsxDcg==
X-Received: by 2002:a17:90a:7409:: with SMTP id
	a9mr23663497pjg.107.1593541316394; 
	Tue, 30 Jun 2020 11:21:56 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:4113:50ea:3eb3:a39b?
	([2605:e000:100e:8c61:4113:50ea:3eb3:a39b])
	by smtp.gmail.com with ESMTPSA id
	10sm3244047pfx.136.2020.06.30.11.21.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 30 Jun 2020 11:21:55 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
	<6ddbe343-0fc2-58c8-3726-c4ba9952994f@kernel.dk>
	<20200630181928.GA7853@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <f173ab34-53c4-0316-f755-240f00cc7075@kernel.dk>
Date: Tue, 30 Jun 2020 12:21:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630181928.GA7853@lst.de>
Content-Language: en-US
Cc: linux-xtensa@linux-xtensa.org, linux-s390@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvdimm@lists.01.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] rename ->make_request_fn and move it to the
 block_device_operations
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

On 6/30/20 12:19 PM, Christoph Hellwig wrote:
> On Tue, Jun 30, 2020 at 09:43:31AM -0600, Jens Axboe wrote:
>> On 6/30/20 7:57 AM, Jens Axboe wrote:
>>> On 6/29/20 1:39 PM, Christoph Hellwig wrote:
>>>> Hi Jens,
>>>>
>>>> this series moves the make_request_fn method into block_device_operations
>>>> with the much more descriptive ->submit_bio name.  It then also gives
>>>> generic_make_request a more descriptive name, and further optimize the
>>>> path to issue to blk-mq, removing the need for the direct_make_request
>>>> bypass.
>>>
>>> Looks good to me, and it's a nice cleanup as well. Applied.
>>
>> Dropped, insta-crashes with dm:
> 
> Hmm.  Can you send me what is at "submit_bio_noacct+0x1f6" from gdb?
> Or your .config?

I'd have to apply and compile again. But it's a bad RIP, so I'm guessing
it's ->submit_bio == NULL. Let me know if you really need it, and I can
re-generate the OOPS and have the vmlinux too.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
