Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC455023B6
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Apr 2022 07:15:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DCA1E4207B8;
	Fri, 15 Apr 2022 07:15:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 429 seconds by postgrey-1.31 at mail19;
	Fri, 15 Apr 2022 07:15:37 CEST
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9B99B420634
	for <drbd-dev@lists.linbit.com>; Fri, 15 Apr 2022 07:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1649999737; x=1681535737;
	h=message-id:date:mime-version:subject:to:cc:references:
	from:in-reply-to:content-transfer-encoding;
	bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6js5zQuBI=;
	b=loqbFfE8BMbfF4fF7QXpY01TCJryDIWaMHiY8hpeTTD5cvG5TbPbanzh
	Pz/NFcihcarPn2PNR7BCz4PBvTk61GO4CRw0LKoMh0wQPWCrLSDPCcAdL
	T+CbhmCu8/And4f3W+XSu5Zmqx92ROHB0nl01bZuchn+oOaLtHtaaCTKR
	WZVmz89x8YYLyPDcNw1ETH3cPK74FOJfdsObLAI4v5rU7rWoh1jld+aD+
	9l2yEdU7v+yhxW2WvlT4Q4xJPIwcNaLzDZlXkhPeZUR5wR95JpJ8qS1cE
	YsqT8Acmbf0RWk37ki/I14T1DhnD3jw3dfEOBw+UR+6e/2+BK0rMtTQVJ g==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="197970054"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 13:08:27 +0800
IronPort-SDR: eCuasUPgfwIwxfAjk6ye6O/4vHbOG1zJfJ/ClGG+Enq23D2TBXJHofKYjiH4zJuUW5bLrS5OZw
	6MKSfuAq++s9OHnFrTNOSrGh+/jOH1/JHBCrOgnGqJ165tdGxTRyv03WYiBcHJiBzaXCAI+uVa
	/tsUsUyI0Kd6nsmbVhv/9EwBiIokWWJsakuiw5dn1jxSkfsCJKodFfLBA2jsVLm5r4/iXn6HCE
	yolkFOCEpnR4+2Tyh3+nDLTkKXnsMy0886/RN2nKzduMtV2cHqTp7p/RAQ+VZi111f8br+fvH6
	zWUrBKihI33A6WVRjkByyxy+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	14 Apr 2022 21:39:38 -0700
IronPort-SDR: /NKhE96fyOzaARIdrNUVilkLjdbOHvLsssoN0f2vhctMVsDNn+XJ1O64tenHEXCL60NjkYNCDe
	UqJJsP+n+wkC6DPGYl3f6hwkoABj56aZnwm8w2nQYCX7ZEBN2jC7jujiYbyVgN1fpJCRRmcJnu
	xe2YHWAn5j+vA4fO839TkfmpoPXCES09rD9poCueMVU3io8M/u6DdgFGPlJQzkoQVlGOyv/MZF
	LJOj1LQ1CEUkuXl3VkZp/WqhHn57fC2n+CXxdNTmLNv9yCFKj9ax4wBc1IbtZilZSUQSgPn2YS
	QYs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
	by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	14 Apr 2022 22:08:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kfkqt3RRBz1Rwrw
	for <drbd-dev@lists.linbit.com>; Thu, 14 Apr 2022 22:08:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649999306; x=1652591307; bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6
	js5zQuBI=; b=ImgmXK0ljefxmjcwwGCZe/P1ZAiYRfxiStEm0q2wFeKQMvkTL85
	MoEiv1WWngR6yiDdywhy6m6c7CHetStsP2KPL7aGmRBSEDoQ0BBkWf7uSl7GctxX
	seFLiVHTqharLpAbcplk3yzDBSQpNNHnyTWqCGnT6SDEQPGGz4njOldB2JpZjV0c
	Fn1jBi13ZsAeHMQyLgImvLHIeNwH3xSreGo+kohOYlio/FQU9mPmWWTRsJd3G6Vg
	s7uGQ1kCv0yoS1gOWClHM7ArPs0jj6m4kJVcJWYcgsITqalXpkzGP3XvQ+R3owbL
	r+qmM2ogk4tvzMNidepDhru5fT38QuGd/Yg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	(amavisd-new, port 10026)
	with ESMTP id 3jbjI_oPeAXB for <drbd-dev@lists.linbit.com>;
	Thu, 14 Apr 2022 22:08:26 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfkqn6sCZz1Rvlx;
	Thu, 14 Apr 2022 22:08:21 -0700 (PDT)
Message-ID: <d7a39cfc-9b28-f0d6-bf62-4351c55daec2@opensource.wdc.com>
Date: Fri, 15 Apr 2022 14:08:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20220415045258.199825-1-hch@lst.de>
	<20220415045258.199825-28-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220415045258.199825-28-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 27/27] direct-io: remove random prefetches
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

On 4/15/22 13:52, Christoph Hellwig wrote:
> Randomly poking into block device internals for manual prefetches isn't
> exactly a very maintainable thing to do.  And none of the performance
> criticil direct I/O implementations still use this library function

s/criticil/critical

> anyway, so just drop it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
