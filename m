Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9F6980F2
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Feb 2023 17:33:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B1F1422129;
	Wed, 15 Feb 2023 17:33:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2801C421740
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 17:32:10 +0100 (CET)
Received: by mail-wr1-f51.google.com with SMTP id o15so16448150wrc.9
	for <drbd-dev@lists.linbit.com>; Wed, 15 Feb 2023 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Tcb29/6rtQpwc/kpAeczx/YDjGscreJ2xzUEcJHD+jU=;
	b=SiULoR+ISmuhrNAnD07QKQb8SYSxgMwZ7pAAEstG7eURaU9WssGRca+FKa+4X46naD
	RXqTk1tz6ABgPP51rAEEECEvfmUX/HNqOPvIJiJed8Ykj2Fj3VhXCH8Sl4Cddk3+ct3Z
	3d+Na8/yxRgaBJffnSp1WRTCU4Nnvnabdx3flKmm5Rf+pqmXB/ixqs4yKvcAFP3QYKuH
	YuUv+Iz4ecDpzfPEUnQTvU8j4LxMsisURHuuedKlf6PQX7fXpWGph2koB8Aplg3Xz4BS
	Ibfpc8Vq8Di3IEDz2F35QQBkYR3yUt6368t7CMX/yLQBCjc5ILFfrcLcx9ClTy0sI6V2
	KnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Tcb29/6rtQpwc/kpAeczx/YDjGscreJ2xzUEcJHD+jU=;
	b=A4NS8qADaQcM+2vr7YL3xyamsoiZ+Xq2qVQO66jmr2vUq2FkDiLXY/liPx79Te9M8U
	Th+wcWnNMM8XkJ64kQTT5OCyoDkP2DJ88Owm3yvSGYdCjRUEyl0wxdRpKrA2hMovPx2v
	WLexklp3+ScfJEzU11dfbXZMXoCbNx9wrvyJJjg4qZ3aS5U1mWH0ad2WMj1wyw+vhWY8
	Ln1JPclOGA+ySAEp8leeomQtVw2XEylCfVpeJRttzvBBWSmNWn0zgh80LWD8kOYA2B8N
	nrPTQeqP+Rr47fUdmOG4Pi/TslhBTPUavwdOXW73hnw8epTBbBytCY69CAD1KdN7fzPB
	U/Bw==
X-Gm-Message-State: AO0yUKWQ7Dqcl9dv2PoJRkJgc+7UQaUHXtDxVES1Tl5W0xXoRJ2pKRi+
	tugUJ2UKgspaJG5qoBrugrZKaD5p
X-Google-Smtp-Source: AK7set+R1ETjxF5meR15HBFQTAyoHQ/uqK2I8nZZ1ZDgQj9yueHElN0lk1qd2JTeWXj5jk0CviwI+w==
X-Received: by 2002:a05:6000:120e:b0:2c5:4784:6f0c with SMTP id
	e14-20020a056000120e00b002c547846f0cmr2521322wrx.15.1676478729819;
	Wed, 15 Feb 2023 08:32:09 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	n4-20020a5d67c4000000b002c56287bd2csm4865055wrw.114.2023.02.15.08.32.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Feb 2023 08:32:09 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 15 Feb 2023 17:32:00 +0100
Message-Id: <20230215163204.2856631-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
References: <20230215163204.2856631-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/7] drbd: INFO_bm_xfer_stats(): Pass a peer
	device argument
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

RnJvbTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuQGxpbmJpdC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5AbGluYml0LmNvbT4KU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCAgICAgIHwgNCArKy0tCiBkcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgIHwgMiArLQogZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfcmVjZWl2ZXIuYyB8IDggKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX2ludC5oIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKaW5kZXggNjM5MTk3ODFm
ZTMwLi44YjRkMDZlMTAzNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2lu
dC5oCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oCkBAIC0xMjYsOCArMTI2LDgg
QEAgc3RydWN0IGJtX3hmZXJfY3R4IHsKIAl1bnNpZ25lZCBieXRlc1syXTsKIH07CiAKLWV4dGVy
biB2b2lkIElORk9fYm1feGZlcl9zdGF0cyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwKLQkJ
Y29uc3QgY2hhciAqZGlyZWN0aW9uLCBzdHJ1Y3QgYm1feGZlcl9jdHggKmMpOworZXh0ZXJuIHZv
aWQgSU5GT19ibV94ZmVyX3N0YXRzKHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2Rldmlj
ZSwKKwkJCSAgICAgICBjb25zdCBjaGFyICpkaXJlY3Rpb24sIHN0cnVjdCBibV94ZmVyX2N0eCAq
Yyk7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBibV94ZmVyX2N0eF9iaXRfdG9fd29yZF9vZmZzZXQo
c3RydWN0IGJtX3hmZXJfY3R4ICpjKQogewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCmluZGV4IDVkOTgw
MTc0OTdlNC4uNmYyOTU1ZjJkY2M5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCkBAIC0xMjQ3LDcg
KzEyNDcsNyBAQCBzZW5kX2JpdG1hcF9ybGVfb3JfcGxhaW4oc3RydWN0IGRyYmRfcGVlcl9kZXZp
Y2UgKmRldmljZSwgc3RydWN0IGJtX3hmZXJfY3R4ICpjKQogCX0KIAlpZiAoIWVycikgewogCQlp
ZiAobGVuID09IDApIHsKLQkJCUlORk9fYm1feGZlcl9zdGF0cyhkZXZpY2UsICJzZW5kIiwgYyk7
CisJCQlJTkZPX2JtX3hmZXJfc3RhdHMocGVlcl9kZXZpY2UsICJzZW5kIiwgYyk7CiAJCQlyZXR1
cm4gMDsKIAkJfSBlbHNlCiAJCQlyZXR1cm4gMTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3JlY2VpdmVyLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5j
CmluZGV4IDQyNDc0OGY2ZTRmYS4uYWE4OTZkYjE3NjdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Jl
Y2VpdmVyLmMKQEAgLTQ3NjYsMTEgKzQ3NjYsMTEgQEAgZGVjb2RlX2JpdG1hcF9jKHN0cnVjdCBk
cmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwKIAlyZXR1cm4gLUVJTzsKIH0KIAotdm9pZCBJ
TkZPX2JtX3hmZXJfc3RhdHMoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsCit2b2lkIElORk9f
Ym1feGZlcl9zdGF0cyhzdHJ1Y3QgZHJiZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsCiAJCWNv
bnN0IGNoYXIgKmRpcmVjdGlvbiwgc3RydWN0IGJtX3hmZXJfY3R4ICpjKQogewogCS8qIHdoYXQg
d291bGQgaXQgdGFrZSB0byB0cmFuc2ZlciBpdCAicGxhaW50ZXh0IiAqLwotCXVuc2lnbmVkIGlu
dCBoZWFkZXJfc2l6ZSA9IGRyYmRfaGVhZGVyX3NpemUoZmlyc3RfcGVlcl9kZXZpY2UoZGV2aWNl
KS0+Y29ubmVjdGlvbik7CisJdW5zaWduZWQgaW50IGhlYWRlcl9zaXplID0gZHJiZF9oZWFkZXJf
c2l6ZShwZWVyX2RldmljZS0+Y29ubmVjdGlvbik7CiAJdW5zaWduZWQgaW50IGRhdGFfc2l6ZSA9
IERSQkRfU09DS0VUX0JVRkZFUl9TSVpFIC0gaGVhZGVyX3NpemU7CiAJdW5zaWduZWQgaW50IHBs
YWluID0KIAkJaGVhZGVyX3NpemUgKiAoRElWX1JPVU5EX1VQKGMtPmJtX3dvcmRzLCBkYXRhX3Np
emUpICsgMSkgKwpAQCAtNDc5NCw3ICs0Nzk0LDcgQEAgdm9pZCBJTkZPX2JtX3hmZXJfc3RhdHMo
c3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsCiAJCXIgPSAxMDAwOwogCiAJciA9IDEwMDAgLSBy
OwotCWRyYmRfaW5mbyhkZXZpY2UsICIlcyBiaXRtYXAgc3RhdHMgW0J5dGVzKHBhY2tldHMpXTog
cGxhaW4gJXUoJXUpLCBSTEUgJXUoJXUpLCAiCisJZHJiZF9pbmZvKHBlZXJfZGV2aWNlLCAiJXMg
Yml0bWFwIHN0YXRzIFtCeXRlcyhwYWNrZXRzKV06IHBsYWluICV1KCV1KSwgUkxFICV1KCV1KSwg
IgogCSAgICAgInRvdGFsICV1OyBjb21wcmVzc2lvbjogJXUuJXUlJVxuIiwKIAkJCWRpcmVjdGlv
biwKIAkJCWMtPmJ5dGVzWzFdLCBjLT5wYWNrZXRzWzFdLApAQCAtNDg3Miw3ICs0ODcyLDcgQEAg
c3RhdGljIGludCByZWNlaXZlX2JpdG1hcChzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0
aW9uLCBzdHJ1Y3QgcGFja2V0X2luZm8KIAkJCWdvdG8gb3V0OwogCX0KIAotCUlORk9fYm1feGZl
cl9zdGF0cyhkZXZpY2UsICJyZWNlaXZlIiwgJmMpOworCUlORk9fYm1feGZlcl9zdGF0cyhwZWVy
X2RldmljZSwgInJlY2VpdmUiLCAmYyk7CiAKIAlpZiAoZGV2aWNlLT5zdGF0ZS5jb25uID09IENf
V0ZfQklUTUFQX1QpIHsKIAkJZW51bSBkcmJkX3N0YXRlX3J2IHJ2OwotLSAKMi4zOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
