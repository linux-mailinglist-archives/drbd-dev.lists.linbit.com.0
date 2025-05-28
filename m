Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5FAC6399
	for <lists+drbd-dev@lfdr.de>; Wed, 28 May 2025 10:04:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C50C3160962;
	Wed, 28 May 2025 10:03:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 779DB160650
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 10:03:39 +0200 (CEST)
Received: by mail-lf1-f46.google.com with SMTP id
	2adb3069b0e04-55324587a53so793631e87.0
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 01:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1748419419;
	x=1749024219; darn=lists.linbit.com; 
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:from:to:cc:subject:date:message-id
	:reply-to; bh=Xp9m6Oq0NLoxM75xP9wtRF/K2SdwcV9z/zX5gG5GgA8=;
	b=F0q3nzL0KmnkVXgS4O7Q9wp5i4LE0xpXWcdtUn9HLqUq8QtJr0WS44mj+JCop6Tsva
	/VvkfBpm3x3T7VJ0fJ/rUunRoK2h1Fxm/uBZvHkCMFuYSTgGS10a3yyqazK36L2RruVy
	mRErIr+SdKj/G9bmx1m5SI2Edj4OXdA+EpAJNJy/F8zcPWr/Nlk2d6OBglPc0bH4oact
	chCAc0A4I9EZhyDTG7BMTqkQek89/OMHhsrWUNsH93ahLko5WboyLN567E3ZFjxqC+Yt
	Ejaby6GVjOm/QpgRl7aOwbDBrlPKX67byai7yWCEuy0rrmDOlZUyhVyPHoHI+Ulmcerk
	0MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1748419419; x=1749024219;
	h=user-agent:in-reply-to:content-disposition:mime-version:references
	:message-id:subject:to:from:date:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Xp9m6Oq0NLoxM75xP9wtRF/K2SdwcV9z/zX5gG5GgA8=;
	b=Oht+lRqZ8WQklVmkRCucNvKryAuDi2DZZC3Hkew/sBXHtid+itubJjBUD6foJK8ekW
	Y2pxDiQ/t5yk7Ds/2c9V9rr+WqLPAtqzJ0vI2QTcsu5wTCzxPl9XXqcUyoP9y2VGapSD
	SqIcHr6uMp1b7BSoudpYLuvS6SFDXDbK+Os3Bwr1jKUM0/1RiYsTZQi2a+bDBBdn+seh
	jrB7NEj0WPGqOACKzwf+LvpELBDSYdayF4qu1Es5MUvEXH2PBvHaOg2/087B7XqSIeGm
	3LMt+9MuuiI/WGbhNtZJwgy10qZ4XYfQ7VzRqKXKh/FcLQg4rUtiFIEhirQXJ12v0ZVu
	aong==
X-Gm-Message-State: AOJu0YyP7Gwklr7jtTYNbBAgh4SCf0lJMh4ximgMjTORHb/DzX5HNO5R
	TzFhXHTtf0oWsNy0mMBmTaKUuLARamXCAm0ekTwWdLIn/kissSbxgLqJBozsnV0zPuoR4CVeYxu
	DqKNYGj7psA==
X-Gm-Gg: ASbGncsmIZ/XIgzOg8/BVmMXPeulPCp3dc0o/btsJNf1EadX6As0RH5xOLpqRA+1PO4
	SpkpYV0GNbyUQ5wOSVD6T9jVyOgXwrXl7slYwpylUSaaUxRlsMK19/NaQbXRga2Gk3Y/QgzCvFw
	Bq/8ryzbNC+0M4NWXDxfqH4Nt5c5cAGohWBoCUo8RAKPq8T10IYtUCrlPHR8ENijm4nHXEReIQs
	St3re3fLIu52ZgXBchkZOFVTdaLYlUMV8IgPPLsEiLBB98jYLzYACBTyQGjIP5xUaQYW4UBA/FE
	x7Lpx/7Z6NxQnnEj73m+kp8HxpExCKIRYD7mHM9EUZrEcKY8c4BUKJDLZOA7se7lqcKfEv9C4aF
	vsdJdZ07104r2qBsnr4ilWqC9V2s9sw==
X-Google-Smtp-Source: AGHT+IHHqC1q4WWPITZ2gh4jNb8NBx9+NWbCq8SYFUEr933Q33+XeO7bDg0uU/0/10yXXHaFo4jznA==
X-Received: by 2002:a05:6512:1408:b0:553:2782:ac6d with SMTP id
	2adb3069b0e04-5532cdd222emr939891e87.15.1748419418923; 
	Wed, 28 May 2025 01:03:38 -0700 (PDT)
Received: from localhost (static.57.82.181.135.clients.your-server.de.
	[135.181.82.57]) by smtp.gmail.com with ESMTPSA id
	2adb3069b0e04-5532f61ca4asm170486e87.52.2025.05.28.01.03.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 May 2025 01:03:38 -0700 (PDT)
Date: Wed, 28 May 2025 10:03:37 +0200
From: Roland Kammerer <roland.kammerer@linbit.com>
To: drbd-dev@lists.linbit.com
Subject: Re: [PATCH v2 1/2] build: changing SUSE release file
Message-ID: <aDbDWc6dB05icJgO@arm64>
References: <20250515024817.25717-1-heming.zhao@suse.com>
	<20250515024817.25717-2-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515024817.25717-2-heming.zhao@suse.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
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

On Thu, May 15, 2025 at 10:48:14AM +0800, Heming Zhao wrote:
> This commit changes /etc/SuSe-release to /etc/os-release.
> The SuSe-release file disappeared a long time ago.
> 
> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  configure.ac | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 282fdf1584e3..883fe3e5cdb3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -402,7 +402,7 @@ else
>     if test -z $DISTRO; then
>        AC_CHECK_FILE(/etc/redhat-release, [DISTRO="redhat"])
>        AC_CHECK_FILE(/etc/debian_version, [DISTRO="debian"])
> -      AC_CHECK_FILE(/etc/SuSE-release, [DISTRO="suse"])
> +      AC_CHECK_FILE(/etc/os-release, [DISTRO="suse"])

Hi,

everything that has a /etc/os-release (which by now is basically every
distribution on this planet) is suse? No.

This (not only this) part of the automagic in drbd-utils is a mess and
I'm currently in the process of cleaning that up a bit. I will not take
this patch as is, IMO it is just wrong, please just wait, this should
improve in a week or two.

Regards, rck
