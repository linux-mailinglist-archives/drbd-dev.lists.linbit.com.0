Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE12629CAC
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Nov 2022 15:53:48 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F0618420968;
	Tue, 15 Nov 2022 15:53:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5E5E542066F
	for <drbd-dev@lists.linbit.com>; Tue, 15 Nov 2022 15:53:46 +0100 (CET)
Received: by mail-pj1-f42.google.com with SMTP id b11so13543645pjp.2
	for <drbd-dev@lists.linbit.com>; Tue, 15 Nov 2022 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=WqjcdjpLsoL1Sqz9oJDZoMzkh39Xnz2DBWZewDQM7Sc=;
	b=7tIDnYTLtfv0L5ZjlthYlIwVOoHtVajWXmO9gHo+vkjmbCv1IREY3v2ZkBYi2slEBA
	0KlALE7BNWXa5LRUXApTqtKE9fFKuN7iau0BkcIUN4I0JFdW7re69sC6E/3YYymbtAlL
	bo3rwP4Oa43y7KGpUVxLN2edMbSsTO9U/fU6GLdP70tofJkjTdbKrhz1FacMS0vE99dp
	Y0pLrOMApffiRVGGjUbG0FVjFZlbRVescHldzb7UUfsFrBLtbSKjkv1WoXDwrOYaFTdh
	Sb2pRJMvsKXreySJaGv8QKGVgUi73htPvSqOBu6RPckeQrcnB/cXECcoOyfkZpS1SsRQ
	y+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=WqjcdjpLsoL1Sqz9oJDZoMzkh39Xnz2DBWZewDQM7Sc=;
	b=gH/vQ5XoYyN1tKwjYIrdH74ltTKSOvumArHZqctF2I9mk4lHeWyM4H65Fs4BeRD6+3
	UWFDIzGJ9HEMhZ/GekgKEogIC+obFCysIdfS8oLg5NCDFpaTvmS7xSSMQOPVeny+iutD
	N5/0In8QUrjJI5IFTt+W/TB76eB50H3fiNpLtS/iNFVxV4fg+YTUkZ9phpHgk9/SUo/r
	uj1b1B//ZRQ6vdgzBCHD74wWMXPTGxJ30Ny9WNbL1jMVaX0T+5UnxchznyDrW/Asw+sN
	QlD4cWs/arlKSeDc5VhNACO03BdwW4sTeGgN1mpfGnA6xydvdTrsxFJn694XtGrc6gRV
	BGxw==
X-Gm-Message-State: ANoB5pl3csBt/QyvO0qCRt6Zg7+oJIv+FBpiUlet9Ko7KT7S63yh2DlL
	mtaN48BRX0XIJ7XawD+8V0w3Iw==
X-Google-Smtp-Source: AA0mqf7+NkyZyIW84lcZoHs630G1Ja5ItM2JG9NhebZZrHQ9N6P9XMR7R7WmU9LPsJy3Cii3kohVRQ==
X-Received: by 2002:a17:902:74cc:b0:17c:5b01:f227 with SMTP id
	f12-20020a17090274cc00b0017c5b01f227mr4463180plt.3.1668524025037;
	Tue, 15 Nov 2022 06:53:45 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	q39-20020a17090a17aa00b0020d67a726easm11751158pja.10.2022.11.15.06.53.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Nov 2022 06:53:44 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Dan Carpenter <error27@gmail.com>
In-Reply-To: <Y3Jd5iZRbNQ9w6gm@kili>
References: <Y3Jd5iZRbNQ9w6gm@kili>
Message-Id: <166852402392.12848.9236710140570124289.b4-ty@kernel.dk>
Date: Tue, 15 Nov 2022 07:53:43 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-d9ed3
Cc: Andreas Gruenbacher <agruen@linbit.com>, kernel-janitors@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: use after free in drbd_create_device()
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

On Tue, 15 Nov 2022 16:16:43 +0300, Dan Carpenter wrote:
> The drbd_destroy_connection() frees the "connection" so use the _safe()
> iterator to prevent a use after free.
> 
> 

Applied, thanks!

[1/1] drbd: use after free in drbd_create_device()
      commit: a7a1598189228b5007369a9622ccdf587be0730f

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
