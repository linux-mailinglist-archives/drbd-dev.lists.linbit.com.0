Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 571475BFC61
	for <lists+drbd-dev@lfdr.de>; Wed, 21 Sep 2022 12:33:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9BF374210D5;
	Wed, 21 Sep 2022 12:33:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5AC6E420667
	for <drbd-dev@lists.linbit.com>; Wed, 21 Sep 2022 12:33:26 +0200 (CEST)
Received: by mail-wr1-f50.google.com with SMTP id r7so9157090wrm.2
	for <drbd-dev@lists.linbit.com>; Wed, 21 Sep 2022 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date;
	bh=QNdK/x1FwWDTtDiwm+N/ozUQEsyD1wB+oSdekgNGTIg=;
	b=axbU1KZEPt9HoFsx/4W5fbKk0Gk2Z49UGAlbSbDQsURq7gkj8NsotdzJDjC/qbSH+W
	sJTFtxon7elLIMdmkwPak/bCn+PS5r6UGcS/MfKmexA91F8H+Sk/K8eNuc1j4blaUAco
	fzTXTn4xdiz4Wr+O4zWy/UVl+92RM7Ry6j/t9BMf2I8QOnOifks3RhONYxH2YASkTDDe
	+9kAd9aCjOT0iE4jun77GcaaaGRYhgtz42w2Ktjupc44jcHIuM+E2mxEfKun2Ba5lAwV
	wzf2GMvq95lOWK8yhnL2HJAlYgBXB/Qa7qmOFoZvilGdUhwyv08NEOMGjg52/wbXwT2r
	r6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date;
	bh=QNdK/x1FwWDTtDiwm+N/ozUQEsyD1wB+oSdekgNGTIg=;
	b=I0zpKz8vYck1amlYlk9QQEs6w8QGaVBxMAGcr2YaMukLtFgXZqkH3J3KSReTbLaznJ
	/HhvuOkqdYkwcMgEs0Vw4YEr+xVhONyex6zs22o2koRMeyAIjU3LNSNsGA3Np8ChFEQa
	ChbEs+t1lcRqHmqSH6h2zJboBaduPOFFCP4mYtY1wpuKVq7Gl/cmtLLwm9grMq5cWENt
	YpZhgCk6+eSxoZtS5BJZ3bnwcHV5ToIv39+L2YTVnqwWRoAqOKpYv45B4Qn7jFsYRyOq
	ABMcZ2bF7+psvIFtHxYWpKejPVwEM/7RAtLff49FxOE954y0n8zEavq5GJ+TZSpM+K4X
	1rmQ==
X-Gm-Message-State: ACrzQf3iiUzTq6zd6McHhuyNQGNnvA0a7q9iEtwAtw2lTt6ES8gcT9CN
	+6K3teYGxbWZv5Da6wApaM2csd8N
X-Google-Smtp-Source: AMsMyM50CgQ5xl3r0AX3gxpIgmXPUs4Doiiew8orNM97DPAkZMD04CyFbVnv+mbWb8CmFb0RoeDaMw==
X-Received: by 2002:a5d:51c3:0:b0:22a:c371:a4e0 with SMTP id
	n3-20020a5d51c3000000b0022ac371a4e0mr16449172wrv.522.1663756405961;
	Wed, 21 Sep 2022 03:33:25 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ba30-20020a0560001c1e00b00228655a5c8fsm2197599wrb.28.2022.09.21.03.33.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 21 Sep 2022 03:33:24 -0700 (PDT)
Message-ID: <677922df-1674-a872-4bc6-e9c874ee4e46@linbit.com>
Date: Wed, 21 Sep 2022 12:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.12.0
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>
References: <20220920015216.782190-1-cuigaosheng1@huawei.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220920015216.782190-1-cuigaosheng1@huawei.com>
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, lars.ellenberg@linbit.com,
	philipp.reisner@linbit.com, drbd-dev@lists.linbit.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QW0gMjAuMDkuMjIgdW0gMDM6NTIgc2NocmllYiBHYW9zaGVuZyBDdWk6Cj4gVGhpcyBzZXJpZXMg
Y29udGFpbnMgYSBmZXcgY2xlYW51cCBwYXRjaGVzLCB0byByZW1vdmUgYSBvcnBoYW4KPiBkZWNs
YXJhdGlvbiB3aGljaCBoYXMgYmVlbiByZW1vdmVkIGFuZCBzb21lIHVzZWxlc3MgY29tbWVudHMu
IFRoYW5rcyEKPiAKPiBHYW9zaGVuZyBDdWkgKDIpOgo+ICAgZHJiZDogcmVtb3ZlIG9ycGhhbiBf
cmVxX21heV9iZV9kb25lKCkgZGVjbGFyYXRpb24KPiAgIGJsb2NrL2RyYmQ6IHJlbW92ZSB1c2Vs
ZXNzIGNvbW1lbnRzIGluIHJlY2VpdmVfRGF0YVJlcGx5KCkKPiAKPiAgZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfcmVjZWl2ZXIuYyB8IDMgLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Jl
cS5oICAgICAgfCAyIC0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiAKCkJv
dGggcGF0Y2hlcyBsb29rIGdvb2QgdG8gbWUsIHRoYW5rcy4KCkFja2VkLWJ5OiBDaHJpc3RvcGgg
QsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgoKUFM6IEkgdGhp
bmsgdHJpdmlhbCBmaXhlcyBsaWtlIHRoaXMgYXJlIGltcG9ydGFudCwgYnV0IHRoZXkgYWxzbyBj
cmVhdGUKYWRkaXRpb25hbCBtYWludGVuYW5jZSBidXJkZW4uIFNvIGlmIHlvdSBoYXZlIG1vcmUg
b2YgdGhlc2UgaW4gdGhlCmZ1dHVyZSwgbWF5YmUgc2F2ZSB0aGVtIHVwIGFuZCBzdWJtaXQgdGhl
bSBhbGwgYXQgb25jZSAobWF5YmUgZXZlbiBpbiBhCnNpbmdsZSBwYXRjaCBpZiB0aGV5IGFyZSBy
ZWxhdGVkKS4gVGhhbmtzIQoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVw
aW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292
ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxp
c3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZHJiZC1kZXYK
