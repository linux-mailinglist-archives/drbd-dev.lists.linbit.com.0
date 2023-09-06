Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83D793DBA
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Sep 2023 15:33:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56CA842063F;
	Wed,  6 Sep 2023 15:33:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BDE7E42018E
	for <drbd-dev@lists.linbit.com>; Wed,  6 Sep 2023 15:33:20 +0200 (CEST)
Received: by mail-pf1-f176.google.com with SMTP id
	d2e1a72fcca58-68a4dab8172so733469b3a.0
	for <drbd-dev@lists.linbit.com>; Wed, 06 Sep 2023 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694007199;
	x=1694611999; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=+d1AVNOFHn3CVQlqf+iRc3+VoRUq4zvMLJvgQBKxvDg=;
	b=L6dleHtIaDmBW6I+IppFSaSU+A5kcrdrycEVdE2/WWLgSAiB3XLfSMEu10wUpk230y
	qTn4ABXNYLPkkZkXI95kPV+49BCfeSlWUM26281UzJxZ2CbqIQ8xpCFC4s+whQfO9J5N
	GpXiD3Kmq4JQL/Q52MAOxaHN7kOgO6DhsJTvL0Mvz8+/tNz+DWxYn0S3Csf5i1r9B6K8
	TX6+lc0fcQaMXhz9kGSQBzhcE6Rib8H9cDk63EaY6uRy7HtEBx+zdjmmQmjQVK9A3tvQ
	Seut7heHnaFUvFVwiOsatTTV5PSGgMIcpCi13gKo31HDrA/LSiYsZFpBv5/ete4uCpr9
	CNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1694007199; x=1694611999;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=+d1AVNOFHn3CVQlqf+iRc3+VoRUq4zvMLJvgQBKxvDg=;
	b=LSk3WA/UFSdQ215BoGPy1ZPgfaWMhvppxHinST23LJAsfy964KTjdghg5loDI1Dl09
	ytbfYBbd+a2Q2thxszIsP2X4pMHXkRu1EYb9E6EvYo5kRjw84HgV/xLDNOjVQNIawmLT
	MrewtKf9KWJnxQj8wTlUI8FNf0CEMyi+iNuoXD0hLfbu696wAwEf74/G7jDyAziZfuq+
	CFaczGwukkiTfqjuMmhGyHmHNQ5xV3Dya8fnWyWcAdny/PqXVlBj3+ibUS4SW67e5yBG
	3Lz247EiWNaD3/wKSknfSLJZq4P6MIk68+ZZtr4F1eAU0UHFDOKunq4tLlUnajhaw7TH
	YdGQ==
X-Gm-Message-State: AOJu0YxDeiT4O0FUj4ILfiUw2x8JgZzg7gYxG1C+9wa8HYi05Cge20NV
	PmrYlsQnm9nu/J4U5sgg8ezSfQ==
X-Google-Smtp-Source: AGHT+IGi5OBROtUZu1lj7ctF+BKO/WjvIApR6wS2hhjSxwyTHuQMfAXh945M7deKizfytAdi93Ewcw==
X-Received: by 2002:a05:6a20:8f15:b0:13d:7aa3:aa6c with SMTP id
	b21-20020a056a208f1500b0013d7aa3aa6cmr21240577pzk.0.1694007199312;
	Wed, 06 Sep 2023 06:33:19 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	b22-20020aa78116000000b0068c10187dc3sm10726107pfi.168.2023.09.06.06.33.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Sep 2023 06:33:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230906133034.948817-1-christoph.boehmwalder@linbit.com>
References: <20230906133034.948817-1-christoph.boehmwalder@linbit.com>
Message-Id: <169400719806.700937.1715411703006180940.b4-ty@kernel.dk>
Date: Wed, 06 Sep 2023 07:33:18 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-034f2
Cc: David Howells <dhowells@redhat.com>,
	Serguei Ivantsov <manowar@gsc-game.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	Linux regression tracking <regressions@leemhuis.info>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: swap bvec_set_page len and offset
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

Ck9uIFdlZCwgMDYgU2VwIDIwMjMgMTU6MzA6MzQgKzAyMDAsIENocmlzdG9waCBCw7ZobXdhbGRl
ciB3cm90ZToKPiBidmVjX3NldF9wYWdlIGhhcyB0aGUgZm9sbG93aW5nIHNpZ25hdHVyZToKPiAK
PiBzdGF0aWMgaW5saW5lIHZvaWQgYnZlY19zZXRfcGFnZShzdHJ1Y3QgYmlvX3ZlYyAqYnYsIHN0
cnVjdCBwYWdlICpwYWdlLAo+IAkJdW5zaWduZWQgaW50IGxlbiwgdW5zaWduZWQgaW50IG9mZnNl
dCkKPiAKPiBIb3dldmVyLCB0aGUgdXNhZ2UgaW4gRFJCRCBzd2FwcyB0aGUgbGVuIGFuZCBvZmZz
ZXQgcGFyYW1ldGVycy4gVGhpcwo+IGxlYWRzIHRvIGEgYnZlYyB3aXRoIGxlbmd0aD0wIGluc3Rl
YWQgb2YgdGhlIGludGVuZGVkIGxlbmd0aD00MDk2LCB3aGljaAo+IGNhdXNlcyBzb2NrX3NlbmRt
c2cgdG8gcmV0dXJuIC1FSU8uCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGRy
YmQ6IHN3YXAgYnZlY19zZXRfcGFnZSBsZW4gYW5kIG9mZnNldAogICAgICBjb21taXQ6IDRiOWMy
ZWRhZjcyODJkNjBlMDY5NTUxYjRiMjhhYmMyOTMyY2QzZTMKCkJlc3QgcmVnYXJkcywKLS0gCkpl
bnMgQXhib2UKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6
Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
