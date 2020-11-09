Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C72AD391
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7AC1C4207E6;
	Tue, 10 Nov 2020 11:23:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3CFA420666
	for <drbd-dev@lists.linbit.com>; Mon,  9 Nov 2020 19:07:56 +0100 (CET)
Received: by mail-qt1-f181.google.com with SMTP id i7so6635660qti.6
	for <drbd-dev@lists.linbit.com>; Mon, 09 Nov 2020 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7NGOsjZERbiE5w2MHC1mFU2jxp4Wb+n3njEEiJYjdrs=;
	b=O4/l9OEaWnaVVx9mA/+hODfmoKgGQIEUNKB0HmUGrD+LhRciIQAcMV79vjoQi/4L15
	CDVLebLFqwtrXUj2MValkzQKsvuvZ+bIj/HDHunVOXdD5rmqC2zDcm6G2ntA+MvXnqhC
	vTEl8uxCxkWixlkEepU/54lrdZYMGD0U3koL7aiUg0SUzZXfN7ZexvE/u58j8exqrb0L
	/O1jcvVnjraSt/kGOG4mDP8TkZHx3MoMGZRLY1X+es3rUicc6WotFmSs08rTBby/Yuep
	Z7z6vRhPWjHEqJ+TL+UexVhcPZExA43AO0zs4xR+XnsHWVoRk8SDKKD+pe0DirmCEgT1
	wWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7NGOsjZERbiE5w2MHC1mFU2jxp4Wb+n3njEEiJYjdrs=;
	b=plQqfBoa1Imd2cvBNnXw9vuf8aF8fgbq+TX6Y/7pLt+dWbkVT0+ur4guhk3FglkiDC
	I7GlfS0t24ZDsJsejxyf3zv2Qop45Ct8xuqz4SM7m/tIuDzRAaPLA1eHh9Lq5NdbPLX0
	55zdnxJGeIkAqwPAMHIbAjjJFQxmub4eaT17Orq70e7h5kzYK2TgXFynY1qq8IF6sQa0
	/AtsfxGzw7+2pOz1uI1hxRKfFDYEX0WBA+uSeeEF2jZbssRe18/+Lssw9wzSmc/mmOoI
	Iketk9O73+FFlmMwe94YEcqaEw3q1CFIP8jWeskItJNuKLkV8vtXi08aehDw7fsJC8k4
	XnVg==
X-Gm-Message-State: AOAM532lwa3qrknt/0bwAlYugwDtLuug8AF274WBbubc2frEKlKPaRsO
	okwUoE+2AH30gM/mUIYUZExm5g==
X-Google-Smtp-Source: ABdhPJz1XdtisV/lRv5ASDEyKBu7yVqtI15E3NOcCNcW+bkgomAeHWz+gX9FyFOWQktTiYmlqxOYiw==
X-Received: by 2002:aed:3147:: with SMTP id 65mr14719130qtg.295.1604945276157; 
	Mon, 09 Nov 2020 10:07:56 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
	[174.109.172.136])
	by smtp.gmail.com with ESMTPSA id z2sm6588768qkl.22.2020.11.09.10.07.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Nov 2020 10:07:55 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201106190337.1973127-1-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <7ddd60ce-f588-028f-7e47-2df4d52e22d5@toxicpanda.com>
Date: Mon, 9 Nov 2020 13:07:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:23:02 +0100
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	nbd@other.debian.org, linux-raid@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] cleanup updating the size of block devices
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 11/6/20 2:03 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series builds on top of the work that went into the last merge window,
> and make sure we have a single coherent interfac for updating the size of a
> block device.
> 

You can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

for the nbd bits, thanks,

Josef
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
