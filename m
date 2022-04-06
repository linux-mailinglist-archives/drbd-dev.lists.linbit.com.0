Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9524F6DDE
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 00:38:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9701420FE7;
	Thu,  7 Apr 2022 00:38:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 49EE6420FE2
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 00:37:58 +0200 (CEST)
Received: by mail-pg1-f181.google.com with SMTP id 32so1262636pgl.4
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 15:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=898oZtU49x5Qm0CpxcvXo6MY6Axk2cKRFpUrygV+kwg=;
	b=fhhF+bMKOUw5/3ZHEoqCk4xhqBwNaSvetO+uQiDdsAeAZQMBiD+4OY4KxkT5haQLNB
	/Ogeh1aOjDihjBKWPX2lcBHCt2nkMUiAoe3s8+7SS9eCNZenDe37QliCuPQH4Yhv9adb
	t3zuvRDLyETvBNk97Ezip2jDBlP635hW4vPh2GJwA5H5zGGpVMA/Ytfrfaf+11vYacoZ
	AZ1PWidNLUNAwgYNK8GwcljRyEWi9NvciX9j6WpakbEnTsPgDVObFsOAtdluUzgBabO3
	s29iDlWPQdsb8wKAp1V8aHWI3N1l+kMyEwRbU9OSPXcs/QCzASpTIk0mGsdulQ4NsSd5
	5iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=898oZtU49x5Qm0CpxcvXo6MY6Axk2cKRFpUrygV+kwg=;
	b=UOg7HOKsbbYS+5NFEvLxjXq0XhBMO+oOMmtP0D4oPVhb/b/L9werbdNvM6BRsRLUR1
	3FJ1iXo1du4VKiwNcK4sOQzJx3esYDdFLYE4eb3PzQr3Oo+K5r3HmrLkCPVYc9xuVtFO
	/ki9a415BSkgCHLiszq+urI12c77WuumzqQS/u8qx32PKWNK3ZNbEby/YuYKon8W9Z/y
	oCYXJHdk3Fx6UnD+KpNt0U1qZtHHsgwF1YWkv+0MQsNotdhdd9EX15xuyt1zNcpXFVhL
	mFD30bI/IK16P80wcORutp9j9J4cVhQ9691dJJk5JfVmGQ7l5YN35EfCAX5XOjdauNPx
	8tmg==
X-Gm-Message-State: AOAM530dtRIfqezH1qjUbn8GiEaM6dY+kamGa/nOwRI5gUefkMzflMh+
	kTL2naOYC43dmlxlOCXec7cp4ACUXbHmFw==
X-Google-Smtp-Source: ABdhPJxdFqHBRBIOp+Psd59OAmPDwQRlB8FtqtHsCvhe+79VLNJ1TnP7c1Kbd6L8u+McnjLHXs/lHw==
X-Received: by 2002:a63:1f55:0:b0:382:65eb:3073 with SMTP id
	q21-20020a631f55000000b0038265eb3073mr9073795pgm.624.1649284677698;
	Wed, 06 Apr 2022 15:37:57 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	y12-20020a17090a784c00b001c6bdafc995sm5586089pjl.3.2022.04.06.15.37.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 15:37:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: christoph.boehmwalder@linbit.com
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
Message-Id: <164928467657.11110.6351742208734304925.b4-ty@kernel.dk>
Date: Wed, 06 Apr 2022 16:37:56 -0600
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	lars.ellenberg@linbit.com, philipp.reisner@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 0/7] DRBD updates for 5.19
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gV2VkLCA2IEFwciAyMDIyIDIxOjA3OjA4ICswMjAwLCBDaHJpc3RvcGggQsO2aG13YWxkZXIg
d3JvdGU6Cj4gTW9zdGx5IGNvc21ldGljIGNoYW5nZXMsIGJvdW5kIGZvciA1LjE5Lgo+IAo+IEFy
bmQgQmVyZ21hbm4gKDIpOgo+ICAgZHJiZDogZml4IGR1cGxpY2F0ZSBhcnJheSBpbml0aWFsaXpl
cgo+ICAgZHJiZDogYWRkcmVzcyBlbnVtIG1pc21hdGNoIHdhcm5pbmdzCj4gCj4gQ2FpIEh1b3Fp
bmcgKDIpOgo+ICAgZHJiZDogTWFrZSB1c2Ugb2YgUEZOX1VQIGhlbHBlciBtYWNybwo+ICAgZHJi
ZDogUmVwbGFjZSAidW5zaWduZWQiIHdpdGggInVuc2lnbmVkIGludCIKPiAKPiBbLi4uXQoKQXBw
bGllZCwgdGhhbmtzIQoKWzEvN10gZHJiZDogZml4IGR1cGxpY2F0ZSBhcnJheSBpbml0aWFsaXpl
cgogICAgICBjb21taXQ6IGFkZmYzNTVhNmQ2NjAyZDZiZTdiZTRjOThlMzlkMWQ5NTdhN2U1M2YK
WzIvN10gZHJiZDogYWRkcmVzcyBlbnVtIG1pc21hdGNoIHdhcm5pbmdzCiAgICAgIGNvbW1pdDog
YTljYjUwNjBmYWJiNDYxODdjOGIwMGFjNzQwYmMzMGYwNDViYWE4ZQpbMy83XSBibG9jazogZHJi
ZDogZHJiZF9yZWNlaXZlcjogUmVtb3ZlIHJlZHVuZGFudCBhc3NpZ25tZW50IHRvIGVycgogICAg
ICBjb21taXQ6IGM4MDU3YTFlYzU0MWY5NzJkMGNhMmFiMTRhNzdiZDBmNmExOTE5ZTMKWzQvN10g
ZHJiZDogTWFrZSB1c2Ugb2YgUEZOX1VQIGhlbHBlciBtYWNybwogICAgICBjb21taXQ6IDI1ZGRk
ZDc3NzEwNjFjMGQ3MTc2ZDM5NjExNzI0NGUxOWNlMzA4NTgKWzUvN10gZHJiZDogUmVwbGFjZSAi
dW5zaWduZWQiIHdpdGggInVuc2lnbmVkIGludCIKICAgICAgY29tbWl0OiBhZDk0ZTkwODA2YWM5
MzVjOTFkYzZmMDQ4Y2VjNmM2ZWM0MDY5Y2VjCls2LzddIGRyZGI6IFN3aXRjaCB0byBrdmZyZWVf
cmN1KCkgQVBJCiAgICAgIGNvbW1pdDogNDBkYWQ5MmQ2OGFhYjUyOTE5ZDk4NTI0ZWI4YWE4N2Vk
MjM1OTZjOApbNy83XSBkcmJkOiBSZXR1cm4gdHJ1ZS9mYWxzZSAobm90IDEvMCkgZnJvbSBib29s
IGZ1bmN0aW9ucwogICAgICBjb21taXQ6IGMwYmY3YTRjMjMxM2M0NmYyYmExNGI3OGE2MjJhN2Uz
MmJiYmIyYWMKCkJlc3QgcmVnYXJkcywKLS0gCkplbnMgQXhib2UKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJi
ZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kcmJkLWRldgo=
