Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E041A2F3
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:29:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40E03420950;
	Tue, 28 Sep 2021 00:29:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52CA4420626
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:29:35 +0200 (CEST)
Received: by mail-io1-f46.google.com with SMTP id 134so24786439iou.12
	for <drbd-dev@lists.linbit.com>; Mon, 27 Sep 2021 15:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mqOH7D1ukF9Zx8b0uf7vcP62TIlQ9RE291MOEYFvaPI=;
	b=5v8EI4K57W2nZC6Fz5gZTCvYGpzpLmIVxBdnAzUCwcOELQ+Z50Fvi0F2ewrLtFDHRt
	vtQkQZUUT9draUGadJ6ZaetWUBTobhsNeKmmxnly90D3cPXzYH+dCrqn7mpikqrckWDt
	WHi7wR55Ek303Gg+2dugwLfcDXsRNH1MLrzdZ6XsBnqq5oBHq+hSOTcA57myq7M9AOAa
	aCJaO2UWkm+hsZKGxK0d0D/TNWYEqb0UDgv+4L/taDU3hH3nbprrs7bGRma0s183dv+l
	EPbxyWPCeAI7d/kBAGPUllWTqDWK0UR5PhnZh81ZPhBozZwXA1lGrbmMOWvdwHaSVxRe
	8BZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mqOH7D1ukF9Zx8b0uf7vcP62TIlQ9RE291MOEYFvaPI=;
	b=Zj+g/lY78jbA2YQz8Iq3XRyEnhX9ZSdhzV0xWKBoRBYD8YS1P2yhS9VHG8xmg1gKJM
	CEX9qPblwGQxpKK6FrxdZqBGvWx1Sk+1mSKQPOKc661hpcktAYj3uxotZVSEnNlITsjm
	XBT2vvt9G8QjEB3CW775J/EAozGGaSzQxESSuUI++tMZ2WriOr108ZjtU1GCNYB+tTih
	m64HKAmX5371TKy3wMeB+JQLbfah1DoJnhiL5vfYZZA4fiLV+ozVZtiVFiY+BLYS+lGo
	IXmFog1TAKFVCULZcP/5zCECjy9BOP+9gO+kxLznoVs6k/3Jr0ecqfH7swTQzg8svziM
	gHvg==
X-Gm-Message-State: AOAM533Hu+oW6I6+4YwVAQMFG12G6LglqGgN0Vx2FDoGRi7LfGX9kzaE
	DZ022gYzn6dsQEUcg/gZVGWqmw==
X-Google-Smtp-Source: ABdhPJx4BepmT9sgpk1hyVciVWTm6ec+ZxPGy9AhD/MitW3pGK1ERf8eVfBwoyEV70Tjv8vb1T8inA==
X-Received: by 2002:a05:6638:164c:: with SMTP id
	a12mr1841987jat.62.1632781775194; 
	Mon, 27 Sep 2021 15:29:35 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
	by smtp.gmail.com with ESMTPSA id
	b12sm9902455ilv.46.2021.09.27.15.29.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Sep 2021 15:29:34 -0700 (PDT)
To: Luis Chamberlain <mcgrof@kernel.org>, justin@coraid.com,
	geert@linux-m68k.org, ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org, 
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com, 
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
References: <20210927220110.1066271-1-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <ee2c245d-7190-b708-4c48-cbee28f56f9a@kernel.dk>
Date: Mon, 27 Sep 2021 16:29:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
Content-Language: en-US
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 00/15] block: third batch of add_disk()
 error handling conversions
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

On 9/27/21 4:00 PM, Luis Chamberlain wrote:
> This is the 2nd version of the third batch of driver conversions for the
> add_disk() error handling. This and the entire 7th series of driver
> conversions can be found on my 20210927-for-axboe-add-disk-error-handling
> branch [0].

Applied 2, 4, 7, 8-15.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
