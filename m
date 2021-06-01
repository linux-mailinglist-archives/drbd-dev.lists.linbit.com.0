Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 59980397491
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Jun 2021 15:48:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CA5974205DD;
	Tue,  1 Jun 2021 15:48:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15C634205C9
	for <drbd-dev@lists.linbit.com>; Tue,  1 Jun 2021 15:48:10 +0200 (CEST)
Received: by mail-oi1-f178.google.com with SMTP id c3so15523482oic.8
	for <drbd-dev@lists.linbit.com>; Tue, 01 Jun 2021 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QlGkt7fWsHM9mcKdq1bDx/YwBl/iUUk0WEjc5rg04fY=;
	b=SJMAgBW5mswAe1ZmlZlRdAFuvYPDEVLqi723Nnx1S4FLz3Yy3Tj3lQWVdZ0F6Qr4eS
	SMIy05Vpx5EU+XswU9cem+w+MzG0a62ahvk23Tf2SUyNvaWPkh1rlmu3OkVCdEssPf8k
	xwwmCV/LazyU6UjgCMJxdw//dP9UOpzUM54yyNCR3QG30hScN/IqdhxGg71hNvOalyX+
	pO6I2f3s4rBYqGHOnzUAspl9mEOwDLA0qywJ9pSLvD5fVKPzw+UNtHhfYY4OA0aw1ASO
	zcdxwDDiGjJD5VEZLuOr0Rlq6ubnYTbGW3SYaGllJ+Xvfy3vmm5YD3DkNvXi1rVEGPqw
	8g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QlGkt7fWsHM9mcKdq1bDx/YwBl/iUUk0WEjc5rg04fY=;
	b=F8z8qT5wxrSf88kNbkshdq8lwxH9nXmMffcnUb24fWL0FaOv5m8VerTBmPflJq8Ilh
	D94PAxX2a29h9MXsUIrTUXvAZq48poYscdR+aH7hBfltwqNHaJNY4VnF2Uke9hqkrDXn
	wqZCSyqd2Hp80ozDkyw5ATbkFfVOtqR44GE67/Id5hmJD1xxgnyBM9FE6zGwMSUUMWGV
	KAoi8YBZML+rlXGbLEdWHxU1RFdUfFkuYw2N25Wrb7ENb3YrgBdgqLg8a5r0gjGXAuxJ
	JKss5H36JriT1gH9ya7bNa2TB2cIb2slQPx+4zagdfPPXhIBcbDb6pjyhmLCAaubVK3j
	Gh+A==
X-Gm-Message-State: AOAM533n5I5P7V2rDs7Yr9xwUix6+L8McREGeRIfxEXYA67OApiTaivU
	3WGjxmzL8zcoEeuwsWEwNgo9cg==
X-Google-Smtp-Source: ABdhPJyRtEOQYxSXItYfv2Xv0el0nwhIYWVK6zfd5YIEz7fo5+/L3t2bxzT7qaz6PyG5RR7CPJmZJA==
X-Received: by 2002:a05:6808:245:: with SMTP id
	m5mr18302900oie.6.1622555290008; 
	Tue, 01 Jun 2021 06:48:10 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
	by smtp.gmail.com with ESMTPSA id i4sm3456045oih.13.2021.06.01.06.48.07
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 01 Jun 2021 06:48:09 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, 
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210521055116.1053587-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a5d7127f-b422-5556-6810-cf4c98c038ac@kernel.dk>
Date: Tue, 1 Jun 2021 07:48:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] simplify gendisk and request_queue allocation for
 bio based drivers
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

On 5/20/21 11:50 PM, Christoph Hellwig wrote:
> Hi all,
> 
> this series is the first part of cleaning up lifetimes and allocation of
> the gendisk and request_queue structure.  It adds a new interface to
> allocate the disk and queue together for bio based drivers, and a helper
> for cleanup/free them when a driver is unloaded or a device is removed.
> 
> Together this removes the need to treat the gendisk and request_queue
> as separate entities for bio based drivers.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
