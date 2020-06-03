Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22C1ED953
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 01:36:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 39B9D420403;
	Thu,  4 Jun 2020 01:36:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CED7D4203F0
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 01:32:21 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id bg4so1381564plb.3
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 16:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AV3zPGZvUQ01fJNeRdN9RcESkWzhMr4mEDUODLN9pLA=;
	b=BLpfxw/6wXWpxKYLlCAZ21WRkm9IiS+h8QcGOpAouQszh1iMLWmw9T4KLc9TZj8hYc
	dx6tovtKtkGDVrQF1aoFfpozdX8eHpFDTKu0YVHCTw220bEnL7QHVusBdzlPQyI7mtxq
	CBiuNg7P/T3Joe2o1yRIOs+RMoUmvb0p/GaJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AV3zPGZvUQ01fJNeRdN9RcESkWzhMr4mEDUODLN9pLA=;
	b=pA4xim/y7JzSKzwzu4uGm/DUS7k/GQ28yESiKnhJMbOH1uhCY9FjdM8cHyGh5tiZII
	7WB5zjbl6bq9UYJvvfNCy3Vgi+4QHUhcMOPwKWVVHtwHoT2WFvxzIzNZAzVEpKrcnaMA
	80n6Eq2aozd7vZcXzyHmr70SZJwwW/yJzI3iYu9b7rE86is7YVZd2MDRjetoMdQPucQn
	ILB7Fvst/LFOk0Oapp4shO/1g49XE7iwSsys6RWHR0olLj0W8weRagLc40c17TqH0+Ts
	XT4nXLLex69KPaSgvCGXIOyMx9gsGXicpy7ALhWDHg3gHGCYpC/K+z81wu1GdOwfx4SZ
	zIrQ==
X-Gm-Message-State: AOAM530sQptpa8zlDNxcE3XgI01qr2ox68LJvMTuRcQnjpkeX/3rLZen
	YUNXNik76m3sc1dxuOnEDSHRgA==
X-Google-Smtp-Source: ABdhPJwKQWXIp6h2GXr8CdJrjHWBz+VhwNoB6SucfRbGarsMlcrgSptDV/HFlzDMl3tG4M3PfRVvsQ==
X-Received: by 2002:a17:90a:36aa:: with SMTP id
	t39mr2389819pjb.185.1591227140733; 
	Wed, 03 Jun 2020 16:32:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	c123sm2738945pfb.102.2020.06.03.16.32.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 16:32:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 16:32:00 -0700
Message-Id: <20200603233203.1695403-8-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603233203.1695403-1-keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, clang-built-linux@googlegroups.com,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 07/10] spi: davinci: Remove uninitialized_var()
	usage
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

VXNpbmcgdW5pbml0aWFsaXplZF92YXIoKSBpcyBkYW5nZXJvdXMgYXMgaXQgcGFwZXJzIG92ZXIg
cmVhbCBidWdzWzFdCihvciBjYW4gaW4gdGhlIGZ1dHVyZSksIGFuZCBzdXBwcmVzc2VzIHVucmVs
YXRlZCBjb21waWxlciB3YXJuaW5ncyAoZS5nLgoidW51c2VkIHZhcmlhYmxlIikuIElmIHRoZSBj
b21waWxlciB0aGlua3MgaXQgaXMgdW5pbml0aWFsaXplZCwgZWl0aGVyCnNpbXBseSBpbml0aWFs
aXplIHRoZSB2YXJpYWJsZSBvciBtYWtlIGNvbXBpbGVyIGNoYW5nZXMuIEFzIGEgcHJlY3Vyc29y
CnRvIHJlbW92aW5nWzJdIHRoaXNbM10gbWFjcm9bNF0sIGp1c3QgcmVtb3ZlIHRoaXMgdmFyaWFi
bGUgc2luY2UgaXQgd2FzCmFjdHVhbGx5IHVudXNlZDoKCmRyaXZlcnMvc3BpL3NwaS1kYXZpbmNp
LmM6IEluIGZ1bmN0aW9uIOKAmGRhdmluY2lfc3BpX2J1ZnPigJk6CmRyaXZlcnMvc3BpL3NwaS1k
YXZpbmNpLmM6NTc5OjExOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYcnhfYnVmX2NvdW50
4oCZIFstV3VudXNlZC12YXJpYWJsZV0KICA1NzkgfCAgdW5zaWduZWQgcnhfYnVmX2NvdW50Owog
ICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjAwNjAzMTc0NzE0LjE5MjAyNy0xLWdsaWRlckBnb29nbGUuY29tLwpbMl0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQSs1NWFGdytWYmowaT0xVEdxQ1I1dlFrQ3pXSjBR
eEs2Q2Vybk9VNmVlZHN1ZEFpeHdAbWFpbC5nbWFpbC5jb20vClszXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL0NBKzU1YUZ3Z2JncWhicDFma3h2UktFcHp5UjVKOG4xdktUMVZaZHo5a25t
UHVYaE9lZ0BtYWlsLmdtYWlsLmNvbS8KWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
Q0ErNTVhRnoyNTAwV2ZiS1hBeDhzNjd3cm05PXlWSnU2NVRwTGdOX3liWU52MFZFT0tBQG1haWwu
Z21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5v
cmc+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWRhdmluY2kuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktZGF2aW5jaS5jIGIv
ZHJpdmVycy9zcGkvc3BpLWRhdmluY2kuYwppbmRleCBmNzFjNDk3MzkzYTYuLmY1MGMwYzc5Y2Jk
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWRhdmluY2kuYworKysgYi9kcml2ZXJzL3Nw
aS9zcGktZGF2aW5jaS5jCkBAIC01NzYsNyArNTc2LDYgQEAgc3RhdGljIGludCBkYXZpbmNpX3Nw
aV9idWZzKHN0cnVjdCBzcGlfZGV2aWNlICpzcGksIHN0cnVjdCBzcGlfdHJhbnNmZXIgKnQpCiAJ
dTMyIGVycm9ycyA9IDA7CiAJc3RydWN0IGRhdmluY2lfc3BpX2NvbmZpZyAqc3BpY2ZnOwogCXN0
cnVjdCBkYXZpbmNpX3NwaV9wbGF0Zm9ybV9kYXRhICpwZGF0YTsKLQl1bnNpZ25lZCB1bmluaXRp
YWxpemVkX3ZhcihyeF9idWZfY291bnQpOwogCiAJZHNwaSA9IHNwaV9tYXN0ZXJfZ2V0X2RldmRh
dGEoc3BpLT5tYXN0ZXIpOwogCXBkYXRhID0gJmRzcGktPnBkYXRhOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
