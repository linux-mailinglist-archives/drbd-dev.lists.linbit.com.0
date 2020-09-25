Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC24278ABB
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Sep 2020 16:19:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B3AF420F59;
	Fri, 25 Sep 2020 16:19:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D494D420F52
	for <drbd-dev@lists.linbit.com>; Fri, 25 Sep 2020 16:19:11 +0200 (CEST)
Received: by mail-pg1-f172.google.com with SMTP id 197so2700124pge.8
	for <drbd-dev@lists.linbit.com>; Fri, 25 Sep 2020 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Izvn14aXCOd8rlHi8gt8/prckjwG/92/E8+p6vMMqzM=;
	b=QZx7q7gI1poaxI+iNpfTHOEPysawBMN6ILpWj8VDRHvig1MWbXDH9Q/Ejh/VGdMY6V
	XhsSRSgLJ3vyBUW4G6v5lGczlnBrfrfGUTY6Io4kTHSOwwPeeq67+GUlO0pvSbpcSc8G
	UQSaYijRBt6BeZMDv8AdtAKiNqO1VevLatKGi1HCrNW5g8jU/dNWe2se7vKcQ5smC1Kh
	pE6mdkVNLv/zO4pT+cJM9rz/VL4qgjegnLWF0CSvnNA3YX8nzt9KdJQrxarNDFpNgyxb
	mdM7GAKDG1dsnTN8AV+yDCM9QF/vXMl36U6209JvGiLAPdEQelB4a/A4/bJ7gb2XykBg
	PFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Izvn14aXCOd8rlHi8gt8/prckjwG/92/E8+p6vMMqzM=;
	b=O6uiPonjTSbbG7EQA/+HjYGd/JvuTIy+LHQ949CWZ4NNbJgoohK395PHNclqkoaHMT
	fGIq8qooNquUEZlTHYDCqOVDf6c63Kx/hYRqdrWfwWRmbmHUKWKsKavMtx5iqg4+QYOJ
	z54nvaqRuKqprqHX2t9gf0YmtbxKgsQNYtOVYB7ZSG8Tr6tu13WBTC/Nf+tqidbU+5Mz
	wvTDtWXXQa6rcyBkotQgTy64lr2crT8oA8MgaiWgwTvo8TglzUn20d3wXIxwu526vxkf
	andhRygRAqhNCrjnmJKbn8gBzVFmsJYGm1Vpqtp/sS/K4hhah0aG5sIxIMnH0V4cXC04
	xEHQ==
X-Gm-Message-State: AOAM5323J3ThS1UcATbYK9mdu7u7Dz4IS0+q12YKB4iIJRCXFEHwcyC4
	XfKL7riWlumo4RlWSX78oAvexA==
X-Google-Smtp-Source: ABdhPJwRr/FwQpe7dKk8pmg8H/cUjDmWIFuRPHGSosKhPuxMlj+z/HBIhpQTLB9cSGSc+hfMahv5og==
X-Received: by 2002:a63:e057:: with SMTP id n23mr213338pgj.87.1601043550492;
	Fri, 25 Sep 2020 07:19:10 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id
	j19sm2930829pfe.108.2020.09.25.07.19.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 25 Sep 2020 07:19:09 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <7a0600d8-d886-c546-378c-5298a16e979c@kernel.dk>
Date: Fri, 25 Sep 2020 08:19:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
Content-Language: en-US
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] clean up is partition checks
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

On 9/2/20 11:40 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series add a new helepr to check if a struct block_device represents
> a parition, and removes most direct access to ->bd_contained from
> drivers.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
