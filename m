Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0241A3CA
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 01:24:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CCD3D42038D;
	Tue, 28 Sep 2021 01:24:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C05C42038D
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 01:24:01 +0200 (CEST)
Received: by mail-io1-f50.google.com with SMTP id r75so24994356iod.7
	for <drbd-dev@lists.linbit.com>; Mon, 27 Sep 2021 16:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aiFGagUTxQBnltkSEFIoIU5oY0RjA6yVWSQ2liMMneI=;
	b=j4l4cerZxmvRBFo9+l9BQYL6AkzAopJsl20GWDSIrISjgLNhwhyUQDgcFLI87OvTcL
	t/He9yZhqI/cPodGu+OkbgGmH1S7L95w9IwBPy2eDb5ZhrO4OA22DQ6orSLthPUp8xVZ
	oIIr58M8MAbD2pjlXaHNHESM9fKnM1zfg80Mb2N1pp9d9BpGhpxkwS7as7y454k+B0ye
	LufmIqZDO3GmPh+zxBgitFrPpt5gouRgTIBta571rDslFpm75wmx5PtMFvZKfisPb48N
	6e4Pw3KgnWYPremFqKZ5Zf2mk39T9srpZap80F9Oudy/lbsB3AgEF4sONU54MRun0xf/
	Kvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aiFGagUTxQBnltkSEFIoIU5oY0RjA6yVWSQ2liMMneI=;
	b=UR2rwEhluoK0VHwzgb8AXGx0DbqYQ7Gy+mJXEWyofwXivxcGDCvT+6ZINK3S3NVKkv
	NNyR/gXxZcWMB6Y62XhE/vdzKKJH6seonCK1FmgHKNQYixGnD3PHKynrxIKo+eFDTO/t
	rq8IzlC8bP6elZgG7YChJhaYHuBe0m1KwKb0Udop+we3p5FubplQdt/4xZInZ/82lM4X
	NIlprVOChwkUGzDfXZbfSEtbMJ0aoyf+nWPNBqYMaier6/5Q7jGf6kuV0XM7tgKfCaA2
	viRqxv2aWiuXg4nfJvvhF9mA3PDZiawYDiM5hVdn3uXQa2lO/fJHIkwBO3Ycoy8k9qHk
	0S/Q==
X-Gm-Message-State: AOAM532B0SEn+h3khyzHmfEFw2dyIu+NZg5nAMjLNHgB0MPrKy1uOSu5
	xWCNoi/VVf2ioXfQJSlLmG1vRw==
X-Google-Smtp-Source: ABdhPJzcHoH9jP9w7ZB7Bz7huhMzmKrPerS4qwZbTDMWfRTFVmKbhCBMUPsYmvpBiIoTu14VNW/P4w==
X-Received: by 2002:a6b:6f0a:: with SMTP id k10mr1611488ioc.101.1632785041193; 
	Mon, 27 Sep 2021 16:24:01 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
	by smtp.gmail.com with ESMTPSA id o7sm10361931ilm.9.2021.09.27.16.23.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Sep 2021 16:24:00 -0700 (PDT)
To: Max Filippov <jcmvbkbc@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
	<20210927220110.1066271-7-mcgrof@kernel.org>
	<CAMo8BfLX84HBuVe=FyqWkVU5Ek-aKFk++omnqsmf9wO6fdVpMQ@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <7889116c-c01a-a041-89f3-4390b16c6ac0@kernel.dk>
Date: Mon, 27 Sep 2021 17:24:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMo8BfLX84HBuVe=FyqWkVU5Ek-aKFk++omnqsmf9wO6fdVpMQ@mail.gmail.com>
Content-Language: en-US
Cc: Ulf Hansson <ulf.hansson@linaro.org>, justin@coraid.com,
	LKML <linux-kernel@vger.kernel.org>, krisman@collabora.com,
	tim@cyberelk.net, drbd-dev@lists.linbit.com,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>, johannes.berg@intel.com,
	Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	"open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
	hare@suse.de, Chris Zankel <chris@zankel.net>,
	philipp.reisner@linbit.com, chris.obbard@collabora.com,
	Tejun Heo <tj@kernel.org>, lars.ellenberg@linbit.com,
	thehajime@gmail.com, zhuyifei1999@gmail.com
Subject: Re: [Drbd-dev] [PATCH v2 06/15] xtensa/platforms/iss/simdisk: add
 error handling support for add_disk()
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

On 9/27/21 4:50 PM, Max Filippov wrote:
> On Mon, Sep 27, 2021 at 3:01 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>>
>> We never checked for errors on add_disk() as this function
>> returned void. Now that this is fixed, use the shiny new
>> error handling.
>>
>> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
>> ---
>>  arch/xtensa/platforms/iss/simdisk.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
