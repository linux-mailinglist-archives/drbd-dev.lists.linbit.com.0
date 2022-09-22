Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E415E5837
	for <lists+drbd-dev@lfdr.de>; Thu, 22 Sep 2022 03:45:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 936E74210DC;
	Thu, 22 Sep 2022 03:45:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BC754210D5
	for <drbd-dev@lists.linbit.com>; Thu, 22 Sep 2022 03:45:25 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id
	x1-20020a17090ab00100b001fda21bbc90so662969pjq.3
	for <drbd-dev@lists.linbit.com>; Wed, 21 Sep 2022 18:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date;
	bh=Dq0iQh4qToxlEKhzB+z+PfOSTbjBSMMKmR3O23n0bhM=;
	b=n4WWiZqxOq49svpEqVTNbGrjn58Du2tA7d/uK14LhX1nJuD4aTP4xJbUhppRvCryuf
	hW+7FGatWhDmIlM64A7HkDuKafK3hUyoovgbAFRDMIlciQ8NScx+53eoofYzfT+LG03m
	1WExdnaFXLqIHShlYLLGs+t9gPwMxJgvhCsRjyzh/cRc1TLwx3mXBM4TrSxm7MzgQ/pP
	KlMYx/mBcS7Td3e5rtpV4maW5Z1fJ8fodDuumMw14Z4kmE3c/wKIK1gzL5wcQH/Gdwy3
	rh6JQr10HatJn/oXjwdiVrwBcKetmeAFHm1xSd6sHS75hNYlpIec0ghkh2F6UrBjmSBY
	jLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date;
	bh=Dq0iQh4qToxlEKhzB+z+PfOSTbjBSMMKmR3O23n0bhM=;
	b=5Ip6kEcnC/CBjbjB8dFnhCslClO6LLdf2aaxaxCqmG78uMGx/QLxe+Aw2FtKhE8hw7
	TG7XObySb0vJfRL5r+x1lwekDTxH82HAeaoFzT03cZlRa21ApGOqSRGIksOXIQI3tO/b
	V01CP0eU1v2VwiQHe1dS2eBOGVwsFK9AskzbR1pYfPPXLBRrANsSVxVjo+PZfcvkr+Bz
	frekMqGFryJRxBizEX1irwmFsvLz/ZdLs1V4NvAwJuPoxFlnQLWif72xlmIK7RM8l21x
	8vI+h76vtOOwSBJT0UNPIHS+oJ0cU9ToDrEGxQan3m2SpjOuaB5TUjBWxKWEK8VIMhsI
	QMRQ==
X-Gm-Message-State: ACrzQf2b5Kfr6u4VVHxBiGUsKQAtpImIi+g74SHGj3/ym4fUzKggjdKY
	avukYIsM+ZC5rsduA2a/8gMUvw==
X-Google-Smtp-Source: AMsMyM4VAl+/+KpX8+5ttib4ZAieIJ9DxuiypuHbg/a0eTSNiKc7Gzv1wr7VEggzUaUBrndVNstZaQ==
X-Received: by 2002:a17:902:d34a:b0:176:b8ad:ba76 with SMTP id
	l10-20020a170902d34a00b00176b8adba76mr907555plk.139.1663811124880;
	Wed, 21 Sep 2022 18:45:24 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	n8-20020a170902e54800b0016c0b0fe1c6sm2701763plf.73.2022.09.21.18.45.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Sep 2022 18:45:24 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
	Gaosheng Cui <cuigaosheng1@huawei.com>, philipp.reisner@linbit.com
In-Reply-To: <20220920015216.782190-1-cuigaosheng1@huawei.com>
References: <20220920015216.782190-1-cuigaosheng1@huawei.com>
Message-Id: <166381112404.39678.3870348207045502610.b4-ty@kernel.dk>
Date: Wed, 21 Sep 2022 19:45:24 -0600
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-355bd
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 0/2] Remove orphan declarations for drbd
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

On Tue, 20 Sep 2022 09:52:14 +0800, Gaosheng Cui wrote:
> This series contains a few cleanup patches, to remove a orphan
> declaration which has been removed and some useless comments. Thanks!
> 
> Gaosheng Cui (2):
>   drbd: remove orphan _req_may_be_done() declaration
>   block/drbd: remove useless comments in receive_DataReply()
> 
> [...]

Applied, thanks!

[1/2] drbd: remove orphan _req_may_be_done() declaration
      commit: a437df5f8bbc6b52231bbeaef8b4052698c9007a
[2/2] block/drbd: remove useless comments in receive_DataReply()
      commit: 7f0c1afeacfcb4c32173b5a120ec0a362b79bd71

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
