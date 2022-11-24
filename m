Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CF637A18
	for <lists+drbd-dev@lfdr.de>; Thu, 24 Nov 2022 14:42:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A42142095E;
	Thu, 24 Nov 2022 14:42:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1655742095E
	for <drbd-dev@lists.linbit.com>; Thu, 24 Nov 2022 14:42:43 +0100 (CET)
Received: by mail-pj1-f49.google.com with SMTP id
	v3-20020a17090ac90300b00218441ac0f6so5859737pjt.0
	for <drbd-dev@lists.linbit.com>; Thu, 24 Nov 2022 05:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=I1jGmBYO2coIk+YiWgjLEKdQpFEQM8fxdl9zq3nflQ8=;
	b=mZmuA5ykdap1VPPXgdZWkfHcGR1yDXZDK519UlkWAibZe0vMYC/2Ed5ZRP1W8em1xb
	XvmrxJfO87J51qvyC98sgSuWeI+8/QSlkLYgxY4V82loPw1D2lEq1eCAHw1JSfiJ8vJl
	PojrvB5+c1tyQovvUneLF+TgXqx96Hdh0uJhIjscoajXwxPfpnjzJBSa5uL0Z6ecBobC
	MV0m7irDL7HthJwh0T3hSQSOrCABYCeb+ZaqxR3iIHrn03DL8ZCc4rEJYfzShmbxabsk
	M9lc0Y4vjNlqio0FUkHSFdSvfLKSQIw3MoRHh+6R8dB2BKRkvaO6bOrdklI/oGCk9ooT
	iGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=I1jGmBYO2coIk+YiWgjLEKdQpFEQM8fxdl9zq3nflQ8=;
	b=0MxAvmv3xartR9lDtj8ie7+vTN9RVbAi+0uMDXtBFONOEHJpC//0XDq2TlaW+5G6cD
	hzTGx4lBlipKU10KDHToxbUCVOWmF6e7yPvPIR0lIiwW0b1Ek+L7u0dnhnvfjMWwNPgF
	73G788b7RU3P679kb/4tQartZCP6LMyz38cRZxezrKYtjXw780PsQICgIUGQagF2InHM
	6qnNF6g3mfkap0CsKGA7QQ3GY8QvKCwebtdy5nSHjbWZ5rfPgFFb/7kc6zXK50vJHYQH
	M9c/ETTuYre/vgS1vlf2aAXOlWoOncp830E9ctoqULH+G7mF71zAyIAwvDAt8WDHQltp
	lpTQ==
X-Gm-Message-State: ANoB5pkburLlNdcA6+SiEJzw5IPTjNtovMXsGI/noR8SNiaj1RUl6sil
	78A59ccoMhnc4NGB5Xi1P6PzZg==
X-Google-Smtp-Source: AA0mqf5hOVm39dvfhv/TonnoKs+8s/v7Amp1bDadVoB6yXnkfrdiTPgHpIHr1RwzBEljJMxjj31KfQ==
X-Received: by 2002:a17:90a:9bcb:b0:206:f02a:cb4b with SMTP id
	b11-20020a17090a9bcb00b00206f02acb4bmr35694797pjw.159.1669297362019;
	Thu, 24 Nov 2022 05:42:42 -0800 (PST)
Received: from [127.0.0.1] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	t3-20020a6549c3000000b00477bdc1d5d5sm1080592pgs.6.2022.11.24.05.42.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Nov 2022 05:42:41 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
In-Reply-To: <20221124015817.2729789-1-bobo.shaobowang@huawei.com>
References: <20221124015817.2729789-1-bobo.shaobowang@huawei.com>
Message-Id: <166929736095.99094.10688536519822817206.b4-ty@kernel.dk>
Date: Thu, 24 Nov 2022 06:42:40 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-28747
Cc: linux-block@vger.kernel.org, lars.ellenberg@linbit.com, liwei391@huawei.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v4 0/2] drbd bugfix and cleanup.
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

On Thu, 24 Nov 2022 09:58:15 +0800, Wang ShaoBo wrote:
> drbd bugfix and cleanup.
> 
> v4:
>   - solve conflict in applying patch [2/2] to for-6.2/block branch
> 
> v3:
>   - add out_* label for destroy_workqueue().
> 
> [...]

Applied, thanks!

[1/2] drbd: remove call to memset before free device/resource/connection
      commit: 6e7b854e4c1b02dba00760dfa79d8dbf6cce561e
[2/2] drbd: destroy workqueue when drbd device was freed
      commit: 8692814b77ca4228a99da8a005de0acf40af6132

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
