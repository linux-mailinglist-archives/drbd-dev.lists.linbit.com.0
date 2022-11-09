Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A73622C7E
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Nov 2022 14:35:36 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9B4D9422110;
	Wed,  9 Nov 2022 14:35:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8E4542210A
	for <drbd-dev@lists.linbit.com>; Wed,  9 Nov 2022 14:35:08 +0100 (CET)
Received: by mail-ed1-f43.google.com with SMTP id a5so27228306edb.11
	for <drbd-dev@lists.linbit.com>; Wed, 09 Nov 2022 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=fMFIifcDEWp2tuYJ6xczHhtO2meaPJaEEnuy7NTfdVA=;
	b=6kEX59yOiWAA2z//lcDmb/ZWXfyTfEGiA7WYWTIEjzQJKuUX13VM+dNzv/hxsTZ+pC
	lk5yde0+fVgTDH8fbD8AG0mPOG1iA74UPHFMuiDIIQ8a4bEJf+KCTobE5zSuxlPUaHtH
	DzK3gsDExUAAzzRyDvN7BNwaKspgSNvPVAoS8WUyzp2EtiWV09ftAj5IrcYi1GfqtdF4
	XRVOYeOanOl5krqDGBZN0dmyNKJCCgMLrO4qBWb6KZzLNhD71qyMlvugp4RrYKqDidUU
	fUNkIuJomMJo0c685105vF+bt1yqwNgAb+eUH/KBZGvWC5mbHB7APfBYiXC6H6eg5WbX
	vesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=fMFIifcDEWp2tuYJ6xczHhtO2meaPJaEEnuy7NTfdVA=;
	b=zzjnpDP12Rq51Z7wCS1EnnYEit/Hp7A7IqTazhGsBohm3YJPNDm4EckvgNRezjY346
	WtDs20ZO9fExiNNXuvpyOI4hNuok+GSy9gmEKYWkrc85ckox14t0D7EuL9PVhxZdmIUu
	YI4QI2KZBc79Ve+HbRPcxvIyTt7OvE0PWtAQiq2MapnumBK7+C4qFrVC/gaPuV7io1Ra
	uMPQA4DOPikD44HwDSahYL1UGiGzUpfAkuq18W07+RkCuRUbvoMCv6dDo2qFwPd5wkk1
	kvyUG3lwEV+2NzPAUEGi0ShT2TeWkJ+D+fK57wa61t/vgwJNfO7M3jYIsCBQ1JXynm/3
	EKow==
X-Gm-Message-State: ACrzQf1NuEwiSzB2J0Km/e3bVh12vsmBnUgtRHMYP6UxGduA6kgHZbvV
	DO7C3Vw8ToVtXbyTKGNL+t6knvoOXo1RMaSHJwk=
X-Google-Smtp-Source: AMsMyM4SlPW4+oqdJEYdjbWdRDoVC4KbD45S3pxdQMR+ts52lYTo8PnHU6bdCZ3XM7Xb/vD8+hRlHA==
X-Received: by 2002:aa7:d744:0:b0:45c:e353:e891 with SMTP id
	a4-20020aa7d744000000b0045ce353e891mr61337607eds.36.1668000908425;
	Wed, 09 Nov 2022 05:35:08 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	lx8-20020a170906af0800b00782fbb7f5f7sm5867463ejb.113.2022.11.09.05.35.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Nov 2022 05:35:08 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  9 Nov 2022 14:34:51 +0100
Message-Id: <20221109133453.51652-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
References: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/3] drbd: use blk_queue_max_discard_sectors
	helper
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

V2UgY3VycmVudGx5IG9ubHkgc2V0IHEtPmxpbWl0cy5tYXhfZGlzY2FyZF9zZWN0b3JzLCBidXQg
dGhhdCBpcyBub3QKZW5vdWdoLiBBbm90aGVyIGZpZWxkLCBtYXhfaHdfZGlzY2FyZF9zZWN0b3Jz
LCB3YXMgaW50cm9kdWNlZCBpbgpjb21taXQgMDAzNGFmMDM2NTU0ICgiYmxvY2s6IG1ha2UgL3N5
cy9ibG9jay88ZGV2Pi9xdWV1ZS9kaXNjYXJkX21heF9ieXRlcwp3cml0ZWFibGUiKS4KClRoZSBk
aWZmZXJlbmNlIGlzIHRoYXQgbWF4X2Rpc2NhcmRfc2VjdG9ycyBjYW4gYmUgY2hhbmdlZCBmcm9t
IHVzZXIKc3BhY2UgdmlhIHN5c2ZzLCB3aGlsZSBtYXhfaHdfZGlzY2FyZF9zZWN0b3JzIGlzIHRo
ZSAiaGFyZHdhcmUiIHVwcGVyCmxpbWl0LgoKU28gdXNlIHRoaXMgaGVscGVyLCB3aGljaCBzZXRz
IGJvdGguCgpUaGlzIGlzIGFsc28gYSBmaXh1cCBmb3IgY29tbWl0IDk5OGU5Y2JjZDYxNSAoImRy
YmQ6IGNsZWFudXAKZGVjaWRlX29uX2Rpc2NhcmRfc3VwcG9ydCIpOiBpZiBkaXNjYXJkcyBhcmUg
bm90IHN1cHBvcnRlZCwgdGhhdCBkb2VzCm5vdCBuZWNlc3NhcmlseSBtZWFuIHdlIGFsc28gd2Fu
dCB0byBkaXNhYmxlIHdyaXRlX3plcm9lcy4KCkZpeGVzOiA5OThlOWNiY2Q2MTUgKCJkcmJkOiBj
bGVhbnVwIGRlY2lkZV9vbl9kaXNjYXJkX3N1cHBvcnQiKQpSZXZpZXdlZC1ieTogSm9lbCBDb2xs
ZWRnZSA8am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
QsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgotLS0KIGRyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX25sLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX25sLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCmluZGV4IDg2
NGM5OGU3NDg3NS4uMjQ5ZWJhN2QyMWMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9ubC5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKQEAgLTEyMTAsNiAr
MTIxMCw3IEBAIHN0YXRpYyB2b2lkIGRlY2lkZV9vbl9kaXNjYXJkX3N1cHBvcnQoc3RydWN0IGRy
YmRfZGV2aWNlICpkZXZpY2UsCiAJc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbiA9
CiAJCWZpcnN0X3BlZXJfZGV2aWNlKGRldmljZSktPmNvbm5lY3Rpb247CiAJc3RydWN0IHJlcXVl
c3RfcXVldWUgKnEgPSBkZXZpY2UtPnJxX3F1ZXVlOworCXVuc2lnbmVkIGludCBtYXhfZGlzY2Fy
ZF9zZWN0b3JzOwogCiAJaWYgKGJkZXYgJiYgIWJkZXZfbWF4X2Rpc2NhcmRfc2VjdG9ycyhiZGV2
LT5iYWNraW5nX2JkZXYpKQogCQlnb3RvIG5vdF9zdXBwb3J0ZWQ7CkBAIC0xMjMwLDE1ICsxMjMx
LDE0IEBAIHN0YXRpYyB2b2lkIGRlY2lkZV9vbl9kaXNjYXJkX3N1cHBvcnQoc3RydWN0IGRyYmRf
ZGV2aWNlICpkZXZpY2UsCiAJICogdG9wb2xvZ3kgb24gYWxsIHBlZXJzLgogCSAqLwogCWJsa19x
dWV1ZV9kaXNjYXJkX2dyYW51bGFyaXR5KHEsIDUxMik7Ci0JcS0+bGltaXRzLm1heF9kaXNjYXJk
X3NlY3RvcnMgPSBkcmJkX21heF9kaXNjYXJkX3NlY3RvcnMoY29ubmVjdGlvbik7Ci0JcS0+bGlt
aXRzLm1heF93cml0ZV96ZXJvZXNfc2VjdG9ycyA9Ci0JCWRyYmRfbWF4X2Rpc2NhcmRfc2VjdG9y
cyhjb25uZWN0aW9uKTsKKwltYXhfZGlzY2FyZF9zZWN0b3JzID0gZHJiZF9tYXhfZGlzY2FyZF9z
ZWN0b3JzKGNvbm5lY3Rpb24pOworCWJsa19xdWV1ZV9tYXhfZGlzY2FyZF9zZWN0b3JzKHEsIG1h
eF9kaXNjYXJkX3NlY3RvcnMpOworCWJsa19xdWV1ZV9tYXhfd3JpdGVfemVyb2VzX3NlY3RvcnMo
cSwgbWF4X2Rpc2NhcmRfc2VjdG9ycyk7CiAJcmV0dXJuOwogCiBub3Rfc3VwcG9ydGVkOgogCWJs
a19xdWV1ZV9kaXNjYXJkX2dyYW51bGFyaXR5KHEsIDApOwotCXEtPmxpbWl0cy5tYXhfZGlzY2Fy
ZF9zZWN0b3JzID0gMDsKLQlxLT5saW1pdHMubWF4X3dyaXRlX3plcm9lc19zZWN0b3JzID0gMDsK
KwlibGtfcXVldWVfbWF4X2Rpc2NhcmRfc2VjdG9ycyhxLCAwKTsKIH0KIAogc3RhdGljIHZvaWQg
Zml4dXBfd3JpdGVfemVyb2VzKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlLCBzdHJ1Y3QgcmVx
dWVzdF9xdWV1ZSAqcSkKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1k
ZXYK
