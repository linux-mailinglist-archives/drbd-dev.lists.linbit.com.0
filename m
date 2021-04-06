Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 942483557E4
	for <lists+drbd-dev@lfdr.de>; Tue,  6 Apr 2021 17:31:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76E484205F5;
	Tue,  6 Apr 2021 17:31:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C19274205D5
	for <drbd-dev@lists.linbit.com>; Tue,  6 Apr 2021 17:31:50 +0200 (CEST)
Received: by mail-pl1-f174.google.com with SMTP id g10so7700030plt.8
	for <drbd-dev@lists.linbit.com>; Tue, 06 Apr 2021 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=j3dRVrLu7qIv3P8UBHPR313VlF+LiIc+YzexWIOo+jA=;
	b=xvfI3tMHBOUKWbT3HGs6k0QWo2mbJDk0YnfB0GtmnE170zRikaVpuA82WQtQRsJ+sC
	nDFbQI+3x397l82kInN1VXcbvmUdDwCG4281wbvzD1PWaiIGOWxBzhYA4lgANDq3Hv+o
	B/hyYNhC5/HVBqPpf1vb0F6mC5/yy3lp2fYHIhtEqksRiwGxBi02e0gNqDKbOSwDUd0t
	C48r53/pk3OqGAsLKxGFkz+RWlKcp4Ye79+/vjcS0Q1VlWxTzYMlPI7cSa9CUU9z+Lje
	CWw6I2I9cJyezy/a7+bWbzvgHQwvHYDNsxZy2PjUm4x5FWSHta+Z/kTl2Q8YZm3kbtti
	zj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j3dRVrLu7qIv3P8UBHPR313VlF+LiIc+YzexWIOo+jA=;
	b=aozs/YzMH/WyfzSkbzXuI+dnh1VjHp3UF16CLxjbtj8M9xOj/q1HR/Ss71Q9IPvVn8
	DT4ao22zG9GJGOwQcscczbNZnrWOJIB2+bNv5unp/dVsxRN8Cnvwww+sUdJfrRgwoUHe
	aD4+xXElfl0QlkT+DRHkKk6TxPMthiIc8UPP8vjsuNHz2alGzaG14h4CAYu+8PcJIeqo
	MstlL34FCVIg9ivtBOX5lJZeHvAd2Whz1Enfq1ElFFKoJq8PTdHXE8akmdNfHQwlvK0V
	saNIkCKp4zlm8sA1TdjgCjRKFF5/PqV+/Jab+y9qJwXrSbrIIVqhKBLqAMOYf2e6dgvZ
	+x5w==
X-Gm-Message-State: AOAM533QrNwEwuMNxViDS8r8uRvZch/qiT/fzPsXT4FGLhC0u5alPYoH
	XPwkh4UpaE4RkFOqBp1gT51xzQ==
X-Google-Smtp-Source: ABdhPJyttuu4g+gBCQFXDzvOY9EJF/stHkijoW0HxraDZFdEkkHPoaefvV+uh6P+eRaiQzLyAXpq3Q==
X-Received: by 2002:a17:90a:ff07:: with SMTP id
	ce7mr4768927pjb.0.1617723109587; 
	Tue, 06 Apr 2021 08:31:49 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	e68sm2816213pfa.78.2021.04.06.08.31.48
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 06 Apr 2021 08:31:49 -0700 (PDT)
To: Huang Guobin <huangguobin4@huawei.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <1617710988-49205-1-git-send-email-huangguobin4@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <55e93aa0-cf16-51b0-ae0a-c561fc36a550@kernel.dk>
Date: Tue, 6 Apr 2021 09:31:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617710988-49205-1-git-send-email-huangguobin4@huawei.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH -next] drbd: use DEFINE_SPINLOCK() for
	spinlock
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

On 4/6/21 6:09 AM, Huang Guobin wrote:
> From: Guobin Huang <huangguobin4@huawei.com>
> 
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
