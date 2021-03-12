Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257533ABED
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B32604264D1;
	Mon, 15 Mar 2021 08:01:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1594C420F79
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:46 +0100 (CET)
Received: by mail-wm1-f44.google.com with SMTP id g20so3530573wmk.3
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ChpkgDvC00jlcyTpzmO/AxUi3IFbRKq2Rr45Vj3i/Mk=;
	b=M7HIi8f+gB/JI8PhrAXj82T0nj05L6LxfnxpB9qnEn5uMRXJ6CB95P0Xr79R4BKzAp
	oJq2DYDFa3UK8r5lVDLHFzKF0MIkdbHt3U2SjDf3Pyb9fS5fyaS1KpK0ja7B3nvMXRFE
	bKFLwSPRhVig3OaTQ+x9C3G+Sw47s0lkTmPwGLgV10lyhINnpPyl5X+vKGbJbY/WuuDp
	vEbXQOx6WEsgGazJtFIRFqznDnQSMOO91Mm8LBTMJeLUafj/fFKQ1TnGVtcxjV4CPkgM
	Obyjv2plNvWObSL2wRfSXNZaPq6fciMow1nJCzNhfs+o6ue6XZLEEX6jnCXlgCVn3+bA
	NHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ChpkgDvC00jlcyTpzmO/AxUi3IFbRKq2Rr45Vj3i/Mk=;
	b=gc6bHoP7xfUVWTzKEljiqqIpQFq8v5Bd5yn9NpGy6+ITDkijnPPpDmaSVFsG7bllJ6
	vtXoAhPiXHbQlKiHanvDp1LBUVS2lwlNzEDHqsSZ2vRFc5VXB/nSfbWMTLaLDYZTkulS
	lEPQNiQuxxV4+FijtV4ZzOueu1cN/f3T3apJBaX5Ed6Xhk45rdPjOd1qP5EyAhOKSQxv
	XS0cWadVk7CSRlMrdgtIKy6+b0vQAyA98IDyioDFDCjs1CNchIlqcZZOVRsSxmiACpuD
	v2+IOJQjX83ycXTuGIfYQDIlCp2jjYnOxoTHCTnJ5a4XmYQ5lsZkDWzzQwCnGNrvTuBi
	1oPg==
X-Gm-Message-State: AOAM531ZF3GYdzrMkt4HT/7vcBuVt2mfqiME4PyS+dwxx/sILwuk9C/t
	CGxUc0xhPAp2BI/CoVN4QRj8Sw==
X-Google-Smtp-Source: ABdhPJwC/cvyVmhhLtpqzhs4+UAHBO67pW6y4yjeQq1dW5Hf2tw1TaVh9srGIIR86iZZVMjXPPD57g==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr12767958wma.39.1615546546556; 
	Fri, 12 Mar 2021 02:55:46 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:30 +0000
Message-Id: <20210312105530.2219008-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 11/11] block: drbd: drbd_nl: Demote half-complete
	kernel-doc headers
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZnJvbSBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jOjI0OgogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bmwuYzogSW4gZnVuY3Rpb24g4oCYZHJiZF9hZG1fYXR0YWNo4oCZOgogZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbmwuYzoxOTY4OjEwOiB3YXJuaW5nOiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20g
4oCYZW51bSBkcmJkX3N0YXRlX3J24oCZIHRvIOKAmGVudW0gZHJiZF9yZXRfY29kZeKAmSBbLVdl
bnVtLWNvbnZlcnNpb25dCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jOjkzMDogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4g
J2RyYmRfZGV0ZXJtaW5lX2Rldl9zaXplJwogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzo5
MzA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JzJyBub3QgZGVzY3Jp
YmVkIGluICdkcmJkX2RldGVybWluZV9kZXZfc2l6ZScKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X25sLmM6MTE0ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGMnIG5v
dCBkZXNjcmliZWQgaW4gJ2RyYmRfY2hlY2tfYWxfc2l6ZScKCkNjOiBQaGlsaXBwIFJlaXNuZXIg
PHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPgpDYzogTGFycyBFbGxlbmJlcmcgPGxhcnMuZWxs
ZW5iZXJnQGxpbmJpdC5jb20+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBk
cmJkLWRldkBsaXN0cy5saW5iaXQuY29tCkNjOiBsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX25sLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCmluZGV4IDMxOTAyMzA0
ZGRhYzcuLmU3ZDBlNjM3ZTYzMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X25sLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwpAQCAtOTE4LDcgKzkxOCw3
IEBAIHZvaWQgZHJiZF9yZXN1bWVfaW8oc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UpCiAJCXdh
a2VfdXAoJmRldmljZS0+bWlzY193YWl0KTsKIH0KIAotLyoqCisvKgogICogZHJiZF9kZXRlcm1p
bmVfZGV2X3NpemUoKSAtICBTZXRzIHRoZSByaWdodCBkZXZpY2Ugc2l6ZSBvYmV5aW5nIGFsbCBj
b25zdHJhaW50cwogICogQGRldmljZToJRFJCRCBkZXZpY2UuCiAgKgpAQCAtMTEzNiw3ICsxMTM2
LDcgQEAgZHJiZF9uZXdfZGV2X3NpemUoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVj
dCBkcmJkX2JhY2tpbmdfZGV2ICpiZGV2LAogCXJldHVybiBzaXplOwogfQogCi0vKioKKy8qCiAg
KiBkcmJkX2NoZWNrX2FsX3NpemUoKSAtIEVuc3VyZXMgdGhhdCB0aGUgQUwgaXMgb2YgdGhlIHJp
Z2h0IHNpemUKICAqIEBkZXZpY2U6CURSQkQgZGV2aWNlLgogICoKLS0gCjIuMjcuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGlu
ZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29t
L21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
