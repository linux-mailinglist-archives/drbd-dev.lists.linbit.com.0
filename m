Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD820F66C
	for <lists+drbd-dev@lfdr.de>; Tue, 30 Jun 2020 15:57:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 013EF4203E1;
	Tue, 30 Jun 2020 15:57:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 732FA420383
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 15:57:33 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id g17so8499654plq.12
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6WoGClip/9lIMADlW96b66URAMpf8agavloV0J0+6z0=;
	b=NpTXHg4eLKIDB3B017yOQCnwb3dBSkBllVoAHChdp1FGoCyQ19eq1VXevMLSrM/lhD
	bQk0yrTpC1Irq2MNTGh49jfpD7zqgiVbJtqJYeruoqyJ31uUsOmkXd433JMWP+NtSVov
	ZzGBWe4xhNJRj47E5aARYY/9uUmyXWiWjg1l6pljN4nXRLoWQN1OJ6HHzWlN6uNS1Lvc
	bcrSTvkHyH7MDnkYvBu1O0JOQIAWVJgUutILN7WG8Di8qKlewR28Ariy+ojttBxfAl/B
	FxzoT9uIuyEQaP+UAHq4/tgN7PJVGPmfXaxyS6AW/qEEAuiLEhHfUD+LyDQfCVGwqwpj
	3wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6WoGClip/9lIMADlW96b66URAMpf8agavloV0J0+6z0=;
	b=eAF6JynF58CJ8r9wPEHJ7x8W+IYoIu4TXxe2jbJtM3QR1P1wUBYfJRqQO3ZxNijHa8
	6HqBmaV/Kr7eIaNgHXjwdiN26wzlMPw43tXwx857+hZVTWsCH1kAi1R7vIaY43EJZJ08
	9pRw841DSEoY0QcG+MjheuVAppB4lcPfktFnxlbrm51jexm490h9r6QZbQ6ZlD4rm0wJ
	+ATdX2FxwhIXw4+v38v+jPYJ6MDQA+EhbXiDBwfBGWBK3MTO5egPZ2kgg7uLE/4wwsV1
	9hD/W1qoxnJBWy3LX51phB2ucKvEErdewFFH7eKnUhu9BJMGh0swNO92wJo0/nTuzbmc
	bmXA==
X-Gm-Message-State: AOAM531FvYeUWyH8FchaZSyVNCq3xmdpC2IRXGAZBR+dci023yypUEAV
	pcTkx+ZHGoVB8iGrsMizpEweoQ==
X-Google-Smtp-Source: ABdhPJxkJrJtaSOyTXzA8zW0V7qLT6cuFQyL+FUGsc5/cLMGVxoMFOJShXuR+F2LWbUj8PAuD022LQ==
X-Received: by 2002:a17:90a:ec13:: with SMTP id
	l19mr20004827pjy.81.1593525452289; 
	Tue, 30 Jun 2020 06:57:32 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:4113:50ea:3eb3:a39b?
	([2605:e000:100e:8c61:4113:50ea:3eb3:a39b])
	by smtp.gmail.com with ESMTPSA id
	m140sm2896019pfd.195.2020.06.30.06.57.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 30 Jun 2020 06:57:31 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
Date: Tue, 30 Jun 2020 07:57:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
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

On 6/29/20 1:39 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series moves the make_request_fn method into block_device_operations
> with the much more descriptive ->submit_bio name.  It then also gives
> generic_make_request a more descriptive name, and further optimize the
> path to issue to blk-mq, removing the need for the direct_make_request
> bypass.

Looks good to me, and it's a nice cleanup as well. Applied.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
