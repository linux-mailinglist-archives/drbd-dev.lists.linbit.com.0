Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CB33ABEA
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2D42425FF1;
	Mon, 15 Mar 2021 08:01:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8FC6E4205A8
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:42 +0100 (CET)
Received: by mail-wr1-f46.google.com with SMTP id l12so4552621wry.2
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IHYhJM9nMyAbr9kC0PuVmzVL2n+2I82Ba3dsjUeY+AI=;
	b=d9pSu1o7M26wU29kEvwgXHR/9OVEDjrsKEs7qA14xPmWODrzW4tRDS+O/ts0F6JnJj
	x8LEZn2Mxngo9It+fCDXY5fgfGOD4zgSTA6ebhbt4XLG9X5WFjcMG1GW/qH9Dc54vTTQ
	qtO6jZ6Q12Be2RxnqCH6coaZLJ1/7iKCa4GUEm3PK9l9ecouej6FvqT4qQtwC9EEBjfC
	6UCJZ01F8JIqq0ga1L79yVOaCcrGTLakUKnzqxO4hIjCiE5+wJ02o3TyIz3uifCAb/s+
	xnthZx1vQSV8G+vAhq1he8Qp91qlJKzBGpZKDLAaMHHOE+iWfyWF65ScVDsCEdij7GLM
	mAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IHYhJM9nMyAbr9kC0PuVmzVL2n+2I82Ba3dsjUeY+AI=;
	b=GM2jc/RN4oP2OA+cqh++V3YKf0tk2tLtT+/sKTJsiqsf2MP4VH7b6JefAFn7OmsUO5
	CRMXEWOky+aX9o5GECE4QuQmKbFBdBK7gMsXs5Etk7OKIR5Xj1vHLfPpMiQIT3/jplJ+
	dmyDnCadH2DqxsIS3PTCy5aqc6tp1H1BXDHMOYSk3goBDG21oebqi5oIZOGKojhfkBBT
	s6Hav5kqhKDvhZ736e0Zyhwhe8Z9i3Pb4QumsQzMlP2DAheMOpXlnOdxe2yqKMUm/Cvz
	+G0GTf+bVf6qoJxEC3OrDTgWfz3K+Sm3zuKCPT+bsEq1PMu3AzjHmE1YDAxONj1Bw2F2
	sdEw==
X-Gm-Message-State: AOAM533tfA+0bPtOrYuDWurtnWhE9h7cxaNJIQvwaiGbMPC/fLVkzez0
	ROBXJxrFHMAUhp4NfxqtFfSShQ==
X-Google-Smtp-Source: ABdhPJwn83lXba8ON91dxvqRmuL6Fo3sSgrermJApEsbmfY2Mjz9q/po8sAA6SAMQtVCUVHM4Ak+VQ==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr13658139wrr.30.1615546541806; 
	Fri, 12 Mar 2021 02:55:41 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:25 +0000
Message-Id: <20210312105530.2219008-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 06/11] block: drbd: drbd_main: Remove duplicate
	field initialisation
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

W1BfUkVUUllfV1JJVEVdIGlzIGluaXRpYWxpc2VkIG1vcmUgdGhhbiBvbmNlLgoKRml4ZXMgdGhl
IGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbWFpbi5jOiBJbiBmdW5jdGlvbiDigJhjbWRuYW1l4oCZOgogZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfbWFpbi5jOjM2NjA6MjI6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92
ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWlu
LmM6MzY2MDoyMjogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmGNtZG5hbWVzWzQ0
XeKAmSkKCkNjOiBQaGlsaXBwIFJlaXNuZXIgPHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPgpD
YzogTGFycyBFbGxlbmJlcmcgPGxhcnMuZWxsZW5iZXJnQGxpbmJpdC5jb20+CkNjOiBKZW5zIEF4
Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCkNjOiBs
aW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCmlu
ZGV4IDI1Y2Q4YTJmNzI5ZGIuLjY5Yzk2NDBkNDA3ZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX21haW4uYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMK
QEAgLTM2NTcsNyArMzY1Nyw2IEBAIGNvbnN0IGNoYXIgKmNtZG5hbWUoZW51bSBkcmJkX3BhY2tl
dCBjbWQpCiAJCVtQX1JTX0NBTkNFTF0JCT0gIlJTQ2FuY2VsIiwKIAkJW1BfQ09OTl9TVF9DSEdf
UkVRXQk9ICJjb25uX3N0X2NoZ19yZXEiLAogCQlbUF9DT05OX1NUX0NIR19SRVBMWV0JPSAiY29u
bl9zdF9jaGdfcmVwbHkiLAotCQlbUF9SRVRSWV9XUklURV0JCT0gInJldHJ5X3dyaXRlIiwKIAkJ
W1BfUFJPVE9DT0xfVVBEQVRFXQk9ICJwcm90b2NvbF91cGRhdGUiLAogCQlbUF9SU19USElOX1JF
UV0gICAgICAgICA9ICJyc190aGluX3JlcSIsCiAJCVtQX1JTX0RFQUxMT0NBVEVEXSAgICAgID0g
InJzX2RlYWxsb2NhdGVkIiwKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3Rz
LmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJi
ZC1kZXYK
