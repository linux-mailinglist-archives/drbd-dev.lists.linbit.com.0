Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6081CB37
	for <lists+drbd-dev@lfdr.de>; Fri, 22 Dec 2023 15:18:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C896F42035C;
	Fri, 22 Dec 2023 15:18:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A1D83420150
	for <drbd-dev@lists.linbit.com>; Fri, 22 Dec 2023 15:18:44 +0100 (CET)
Received: by mail-pg1-f173.google.com with SMTP id
	41be03b00d2f7-5cdf90e5cdeso108766a12.1
	for <drbd-dev@lists.linbit.com>; Fri, 22 Dec 2023 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1703254723;
	x=1703859523; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8A1glk9zKLbiBtT4KFCCjRYLUlE9xUXR3enmqVpuLXQ=;
	b=uuLoHUIgRE4Hb42qZDe6B4GNC18VCz7yyIglaIW1pmZ+xTYcEMz2/3WnZ3U7wgmiLU
	+IJ1NjW5GbCtDMfLSkXsRqrdWwaM4xYaIYdxN4/4GSm1PVOOd24YNJ1QXgPbgnGnvkKL
	TS6sRZXnRotF55Rmi0tOn5eHcM5zI2sMXb9HtedkeKrABHLXtgntDU11JadDA9+eS9pu
	KUzK7LLUrZFM17WT1CaCi1nBkcQUmt2RvbtCRz2DocWPk7b30iR9qUpbissSDcSgnBVv
	43Kiq0dEu55QDcPb5NQ+7BkxexHgjEG7UcfcvHfwKERlYrpBmn+ExrUct72EhqwB1E7q
	BENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1703254723; x=1703859523;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=8A1glk9zKLbiBtT4KFCCjRYLUlE9xUXR3enmqVpuLXQ=;
	b=rFIDc8vSuDM+S2u2MwkkOf49n8PCx1ntlPX6tFon2l4f3MUumWBg104R+ECWAbuVGG
	d8pWR5wIYkinMAefXbRJCbRVdNE8qr911bVtF7vKJ2+99tl7OrlAXYiIaxWlJccofh9+
	M0kDr9s0WCrmld0q0Rn4axqu4Ztq9OhxkaY1QxeIiFx0eTZegcqyIMqZvDkBcn1Wj9Xn
	fH8G9vxqEYhOHb0jRIWf3qYcSwDn2Gxv0F5o3DTOEUQHPBEnVhG+1z8EETc/uWV0tyoh
	9ZXSQQtFxbJOFQUlo7UomK1hf3xhp85mO1mK0O3crz/UyIiIoqPEGbyvoG3ZYnpX0HKg
	Bzfw==
X-Gm-Message-State: AOJu0YwKQScOGonKw3MZ7e3RDW3XEFeqI745mTO+pL6ljwUGX1iEPTSd
	XjeXuphX8rh7sgUlPaesxaRcn4TwG1VrkQ==
X-Google-Smtp-Source: AGHT+IEXHhpBdYu7BG4iQynwg6T9KXzttfdwH9ZhmEUK/VNC9mBrZ2I1QMoe3R581uVguT4YpbBIhA==
X-Received: by 2002:a05:6a21:99a6:b0:195:3ad3:b6c3 with SMTP id
	ve38-20020a056a2199a600b001953ad3b6c3mr1632140pzb.5.1703254723215;
	Fri, 22 Dec 2023 06:18:43 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194]) by smtp.gmail.com with ESMTPSA id
	e16-20020aa78c50000000b006d9345189b1sm3498980pfd.36.2023.12.22.06.18.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Dec 2023 06:18:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231222061909.8791-1-rdunlap@infradead.org>
References: <20231222061909.8791-1-rdunlap@infradead.org>
Message-Id: <170325472218.1024948.10134238740797741096.b4-ty@kernel.dk>
Date: Fri, 22 Dec 2023 07:18:42 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-7edf1
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: actlog: fix kernel-doc warnings and
	spelling
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


On Thu, 21 Dec 2023 22:19:08 -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in drbd_actlog.c:
> 
> drbd_actlog.c:963: warning: No description found for return value of 'drbd_rs_begin_io'
> drbd_actlog.c:1015: warning: Function parameter or member 'peer_device' not described in 'drbd_try_rs_begin_io'
> drbd_actlog.c:1015: warning: Excess function parameter 'device' description in 'drbd_try_rs_begin_io'
> drbd_actlog.c:1015: warning: No description found for return value of 'drbd_try_rs_begin_io'
> drbd_actlog.c:1197: warning: No description found for return value of 'drbd_rs_del_all'
> 
> [...]

Applied, thanks!

[1/1] drbd: actlog: fix kernel-doc warnings and spelling
      commit: 8aabc11c8f4e0a57661a07f985ddc8a626ef9148

Best regards,
-- 
Jens Axboe



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
