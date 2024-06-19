Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D3190F03F
	for <lists+drbd-dev@lfdr.de>; Wed, 19 Jun 2024 16:21:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AEC84205A6;
	Wed, 19 Jun 2024 16:21:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A75164202C2
	for <drbd-dev@lists.linbit.com>; Wed, 19 Jun 2024 16:21:19 +0200 (CEST)
Received: by mail-pg1-f169.google.com with SMTP id
	41be03b00d2f7-7119502613bso87125a12.2
	for <drbd-dev@lists.linbit.com>; Wed, 19 Jun 2024 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718806878;
	x=1719411678; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:references
	:cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
	:cc:subject:date:message-id:reply-to;
	bh=TrxAc+Uu30dWHZppC8CN0wQM7I31e2d3aLis3drkvvE=;
	b=WhcSL6BorYI4lp/PaiAph+jnWjHcHzWMEJXVK2Zt/2nb83q4JTKB7zJpoNEBmJPzxB
	tWD0RH2GMb68PxiWEsFf7hAkp+N3VDGgNEBUAsW+Xo71tyjr+9WfFGoEs/S7/Rq0Ugpk
	aWZ9M9cE9rHFJga0E1kBmfSWFX2AMKqBrMH4N/rtMWwW5K+5RYoQ9NNJISHDcHt01RC4
	Afbr5xezYbMunSkeUpIfvCXIr92oZ82FSJwNZsSDmiJRI89xjDoYG/eV+NGSeneGEHbj
	+8UJ8u73xgIw0HGhSBoRaCIpuSCgCI2A+HXVvj20BpthdvIGUkBRx9erGZmkLGDZY90G
	mA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1718806879; x=1719411679;
	h=content-transfer-encoding:in-reply-to:content-language:references
	:cc:to:from:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=TrxAc+Uu30dWHZppC8CN0wQM7I31e2d3aLis3drkvvE=;
	b=VJB4dqtFWcG0Ad646NXfqI9BKiEv7A64yFkMtDf1jqR35twsiaJ02DRVSH5ufHFqn4
	KQXRulvvJf2clGWLpPazS6LJgpBhqKvYFmVLiTiZZkg1dajdCHIdyRBNsyrZ4LoOpXPl
	ZqhynkuHYlSldo94WvbLh1jAQReaJ2EleILNTUedH4v5mBZIgE3C8hj+iHE6RP+UsWVE
	5ExozS5qgmZkrFnVpZ3Z1dWwLsg3xiQj4r+wV66CpBltEysdwMi1frDOfrkKd6dVMwM5
	Ksw251oTAMSkq3EiGPSvxzvWLWSHFP07fXxqbhvQ3sLy0p8WqdQYMvaQxj67HuA3KSdb
	e8EA==
X-Forwarded-Encrypted: i=1;
	AJvYcCUHe9/ehHmYYXjAws5NM0fv5fZpcnJHRnArgqqzJWFQukjM+/tZLEMrqqSsiKtBzmxvwORalko9ZeEDL926pw4R4VUKbzqm+TDm
X-Gm-Message-State: AOJu0YwcCDt0Ma+CzyDZ9DPX0hVWrhqwsI2BSlHU1S2wsSjZkjgyjTLI
	gBlpZAFUJVqeY9oZ6njb1o/3/STVduR8eBpdFnE+QOcCJIoLsqEZs9PIxvx4ZF8=
X-Google-Smtp-Source: AGHT+IGlNYahWungPdY/VG0D2i+/kOzAqG/9vIEbq77BhnEO6pEhdeI5ihGxkaZBKQBmSE54SEc3pA==
X-Received: by 2002:a05:6a21:33a5:b0:1b8:622a:cf7c with SMTP id
	adf61e73a8af0-1bcbb727134mr2697727637.3.1718806878609; 
	Wed, 19 Jun 2024 07:21:18 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-705ccb6b110sm10739431b3a.153.2024.06.19.07.21.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 Jun 2024 07:21:17 -0700 (PDT)
Message-ID: <e8e718ca-7d3a-4bce-b88a-3bcbe1fa32b0@kernel.dk>
Date: Wed, 19 Jun 2024 08:21:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: move features flags into queue_limits v2
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
	<171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Content-Language: en-US
In-Reply-To: <171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 6/19/24 8:18 AM, Jens Axboe wrote:
> 
> On Mon, 17 Jun 2024 08:04:27 +0200, Christoph Hellwig wrote:
>> this is the third and last major series to convert settings to
>> queue_limits for this merge window.  After a bunch of prep patches to
>> get various drivers in shape, it moves all the queue_flags that specify
>> driver controlled features into the queue limits so that they can be
>> set atomically and are separated from the blk-mq internal flags.
>>
>> Note that I've only Cc'ed the maintainers for drivers with non-mechanical
>> changes as the Cc list is already huge.
>>
>> [...]
> 
> Applied, thanks!

Please check for-6.11/block, as I pulled in the changes to the main
block branch and that threw some merge conflicts mostly due to Damien's
changes in for-6.11/block. While fixing those up, I also came across
oddities like:

(limits->features & limits->features & BLK_FEAT_ZONED)) {

which don't make much sense and hence I changed them to

(limits->features & BLK_FEAT_ZONED)) {

-- 
Jens Axboe

