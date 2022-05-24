Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C411532B7C
	for <lists+drbd-dev@lfdr.de>; Tue, 24 May 2022 15:43:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4E3F5420625;
	Tue, 24 May 2022 15:43:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 329B34203CF
	for <drbd-dev@lists.linbit.com>; Tue, 24 May 2022 15:43:23 +0200 (CEST)
Received: by mail-ej1-f44.google.com with SMTP id ck4so31162451ejb.8
	for <drbd-dev@lists.linbit.com>; Tue, 24 May 2022 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lNqz9V02Yoi7ZgUH3R75K4NXvHXKu7qv+DKfYX36l5k=;
	b=JOdCqiL0xHG3Tq+6PW565azQUL6M9SDJ2uGmHLWa9Nfiht4w6lavrT45PyMq5jQWUG
	70a3xkqjxYHOUWVAI8bT4MAEQuyM1ZwvX+8huCTJ6zR1e7nb+qy9RUGWaFy3hT8M4tPS
	YKz1iI/ZcPB8aiK2XE9Zj7hMIZ6/viqlFuDk2DVIz+PfbPeqdwL4CYKcyy2Y4g/pLGFX
	FFdbLTuVobph1t+X4j9moGpcy/JiRlxh5muxVt9s2pkBLWTlfIMNlDQu/HiQJgjcmFSU
	gIRX9iWuORLn14UpFvVEMB1LJWVsi50EIXhVmhanmd/5yByaoU9mIFRepwQImq7YtZvC
	rFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lNqz9V02Yoi7ZgUH3R75K4NXvHXKu7qv+DKfYX36l5k=;
	b=Xrg663Oc80fE7YU6S9vgEYv+KWmfiMR8ZIwdFEw8ZcBu3ij7OLp8M620ehKpksa0Q1
	dkw60UzJtWnXZ4DGdI+SEN2EUQRGDX+FaTBAvTgmymSc0pTiYCxn23hl71E/pq2uPpKl
	CxVuPUPCqQLSig9QNuVRRmDrazSE/YoIyy32tuYfTacdx07R83kM1x5woBEsp5IpJ7iC
	tKjPJedAxUiIYGMY8HmCICRHHhkJMlmWeKi7f3XC0a0KImpZApxlN7bugNfUhfbqjoM/
	rlK7JLbdpYtMUr8a9tDjaMNkmUDIeaOnSZLymVAej2pYNUZCslswlJZOFYR+iOFnm9U/
	psNQ==
X-Gm-Message-State: AOAM531EWF2HMvfyI5pRU142cP5n8zzO2pbpxa7yRXaN0FKk14aUkjyT
	zAPykXu9vWWAS4AJHfzKRZDUlylYuVnWCULkIOjh/UYvztGbuJlT
X-Google-Smtp-Source: ABdhPJwCDaSb+KaMh8czFh4yqSxamfYh9F8rDRzQom5QxQUTbC7jfJjh9GESquwzTipTTkixXGolIqAkHV4Ri+Q8PaA=
X-Received: by 2002:a17:907:60d3:b0:6f9:6ac6:2335 with SMTP id
	hv19-20020a17090760d300b006f96ac62335mr24041225ejc.628.1653399803671;
	Tue, 24 May 2022 06:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220519100508.3143-1-kunyu@nfschina.com>
In-Reply-To: <20220519100508.3143-1-kunyu@nfschina.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 24 May 2022 15:43:13 +0200
Message-ID: <CAGNP_+WSAwSzfp7sX+6dK_+skrVA6oXkpq6Jbwvf59bW3qkV4A@mail.gmail.com>
To: Li kunyu <kunyu@nfschina.com>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: The process_twopc() function does not
 use a return val and could be changed to void
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

Applied as
https://github.com/LINBIT/drbd/commit/a0cd0ae02fb5c125a6f87284e162decc0965b176

Thanks!
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
