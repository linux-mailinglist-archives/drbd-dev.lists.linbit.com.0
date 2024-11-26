Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5D9D910A
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Nov 2024 05:32:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D89CF420663;
	Tue, 26 Nov 2024 05:32:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 247584202D7
	for <drbd-dev@lists.linbit.com>; Tue, 26 Nov 2024 05:32:40 +0100 (CET)
Received: by mail-pf1-f174.google.com with SMTP id
	d2e1a72fcca58-724f41d520cso1717590b3a.1
	for <drbd-dev@lists.linbit.com>; Mon, 25 Nov 2024 20:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1732595560; x=1733200360;
	darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=Dj9qgfhpew+joz5eAIS43G7ysXnxDcyXL0gGD9SLu88=;
	b=XA3hBc1CvodVN3cSImA+goe1yyC8DAEqm13eb+6+/jeNnzALbu2Fwe1BROeGqw19W1
	KqDOitSu53MHy2XArK5495vNAdsaSi97sSjdWYhM3XLppny/2qAgS9p+mV9tlJjQoW9g
	hGUtVmnpBH3TCQGIWc4wYtnQIrTR2LrzAVCFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1732595560; x=1733200360;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Dj9qgfhpew+joz5eAIS43G7ysXnxDcyXL0gGD9SLu88=;
	b=Aa29gn33IZK+2FUk+02hs7kfJP0jStlAw2YkgWyVmdUTXsW0QQqPmaeupwNzMvTusM
	zcpA3TfECMAZft65Ozs1JTm7BYk6gBlDRAAVeTyek40I9o7mz97p5+A90we0P3jNAeSW
	6IFkyN6SBvw88aZdPBbuVoK6dUVTlXnczA6o++ad2NIb/nimYhqZWZwQNOC+7jzjDPqW
	hc6mat/gLVpwrq4IjDqDzaXo/69FeDlaOTvVLoGbjH+TzLKEex/3eGyVzwR8YoWh1nog
	eSFqUF7Ekc4eE9Cq/0dIm/4hMJXOdTcKCS5y1yHXRH61UDwX1bHeATqrkh/WFYdtLPPN
	UQOw==
X-Forwarded-Encrypted: i=1;
	AJvYcCVX299hqpslkcnNJeqP3cGLL4sSrNrjizRgVziLTopBgAgwwm3JVlmFq6v6gPm7KVRU7soC3mWx0Q==@lists.linbit.com
X-Gm-Message-State: AOJu0YyUXRT+mLU4RswdSYN0PVL/kTKZAjsGUEbYKGMkeYqvmZoYk/LA
	XvcYjLduvJlfAqJqFl+sryHVx8Pp4ycpXPFtmRpOATmRR6B9Hq7EnCrPDn8yw9E/ly11jtm32Qo
	=
X-Gm-Gg: ASbGncuOY5iHpLQT1WzkaoTFZ9IhLB6Ig9KL/l7Rb+rKS1bJBrlf54HDxzKoKXkV4iW
	/YDRlfNJOTV9wRygit4rQ0f+XyjA7y/OoT1YONbaqVKfYpv2zHcDeNPm/q722j9QXrFx0OSt40X
	6DD2re9QfR/x3zUCdpmXeoVluid0wlyJ7+mQa5eFJ1qfQCa895kMITTgii8h57nUkKlaWbvAtRT
	B5a4ag7mdoCojd0ofqRLJEmhJp+bcWcX9urag+uiU6RB8IQGPHO
X-Google-Smtp-Source: AGHT+IE6782zuODFee99BheWhco6CMCToJMqye6QDHvuZHHJs8+0En7RLAL1hfPEuaUYRDTNmCBDDA==
X-Received: by 2002:a17:90b:1d81:b0:2e2:e31a:220e with SMTP id
	98e67ed59e1d1-2eb0e1256f9mr20707685a91.8.1732595559907; 
	Mon, 25 Nov 2024 20:32:39 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:7631:203f:1b91:cbb])
	by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-2eb0d0451afsm7641478a91.32.2024.11.25.20.32.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2024 20:32:39 -0800 (PST)
Date: Tue, 26 Nov 2024 13:32:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Saru2003 <sarvesh20123@gmail.com>
Subject: Re: [PATCH v2] Documentation: zram: fix dictionary spelling
Message-ID: <20241126043234.GB440697@google.com>
References: <20241125024927.GA440697@google.com>
	<20241125165122.17521-1-sarvesh20123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125165122.17521-1-sarvesh20123@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	terrelln@fb.com, lars.ellenberg@linbit.com,
	senozhatsky@chromium.org, drbd-dev@lists.linbit.com
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

On (24/11/25 22:21), Saru2003 wrote:
> 
> Fixes a typo in the ZRAM documentation where 'dictioary' was
> misspelled. Corrected it to 'dictionary' in the example usage
> of 'algorithm_params'.
> 
> Signed-off-by: Sarveshwaar SS <sarvesh20123@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
