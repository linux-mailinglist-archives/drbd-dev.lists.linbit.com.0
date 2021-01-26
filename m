Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D4F3049A8
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 21:11:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B9224205FB;
	Tue, 26 Jan 2021 21:11:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D585420064
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 21:11:48 +0100 (CET)
Received: by mail-pg1-f178.google.com with SMTP id b21so5341968pgk.7
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 12:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gsLi9w0Y4VoM2WEdXfeAxIRmg7gY3vC0ka6QScX9Qk0=;
	b=XOIk8xuZYOGk/IopvkReuEwpWyumM5GT++t/GopcYmkU0uYOfC2hSzooDefPbe8wlE
	wXJJx1/nTw9PjaSNpG7stVspEppnpf6pdG5I02IKDbig10nIDRMdMf0CRT9jsjITc+/T
	T7oUwop9r52hsuKw3QqBbW3IJlaZZD0UOoIr9PUuN3JFpXSsYUj0x4VL4DfE2N2QxxdV
	aKjX8i1Ka5Z8vAuTXBbENglp51l9bBcimoyF9XrJoM8zRnPJTiGxV4yydLebQ76nIiGQ
	DcQfvHvXdGplfDkGTgdgMFupMMGt/Bs0FArgeE2HSOw6i84n2VZlFXpBYJobvnlHJa2m
	KQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gsLi9w0Y4VoM2WEdXfeAxIRmg7gY3vC0ka6QScX9Qk0=;
	b=V2Me6sg10QiZgsskJdZHjfOxvKp+Tvcfr/Qg2mzf3x7qLFfqWHjfrEaYu6zoLAtoLk
	QO8icNjd1qj/eZmP2ZygBX7+77dNg0qF0oYFJmnFjprOLvEwE4ZT4rkbZLOdhfpLAZa8
	yJv0ZL7H92Wn9t4DmVnwGFJoBGH0zjg+QfDwSuFNF/+FHrm8dG+fFwC26kLdUPsBJDLp
	Ibg47T0lgmOmGzUhz6l7TwePhLldKqAi9BqW3oXQXpVBjlg0ZYwu7fVpGoUGAB/mqYJ7
	AnujOb9NYcUrXhAmPcIfXD7eITtB/dtPYakNkF8ovC3yuVLWxE4g4BHqDFSjap10UKX0
	h7Zw==
X-Gm-Message-State: AOAM533w2b6YOQ1y6GCkry3X0Q0DQ67k7fJMjq59b/vMKryxwwawXdV1
	aHX0sxHR58654FNEL0s4nHarrxumwSNN2Q==
X-Google-Smtp-Source: ABdhPJy4tLLL8Pd0yH4ZK3eN7RinUSAZBefkzR4TvYorEsZxkRFNy7ad9p/lZ9JXMvvYLqSqI5pltg==
X-Received: by 2002:a62:9295:0:b029:1b7:b74f:75b1 with SMTP id
	o143-20020a6292950000b02901b7b74f75b1mr6623587pfd.67.1611691907426;
	Tue, 26 Jan 2021 12:11:47 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	gv22sm2912296pjb.56.2021.01.26.12.11.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 26 Jan 2021 12:11:46 -0800 (PST)
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
References: <20210121142150.12998-1-guoqing.jiang@cloud.ionos.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b3880d87-26b8-924d-f674-54c2a671f70f@kernel.dk>
Date: Tue, 26 Jan 2021 13:11:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121142150.12998-1-guoqing.jiang@cloud.ionos.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH RESEND] drbd: remove unused argument from
 drbd_request_prepare and __drbd_make_request
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

On 1/21/21 7:21 AM, Guoqing Jiang wrote:
> We can remove start_jif since it is not used by drbd_request_prepare,
> then remove it from __drbd_make_request further.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
