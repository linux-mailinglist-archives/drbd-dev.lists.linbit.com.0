Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B18622C82
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Nov 2022 14:36:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BE4D242178D;
	Wed,  9 Nov 2022 14:36:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B97B442178D
	for <drbd-dev@lists.linbit.com>; Wed,  9 Nov 2022 14:35:11 +0100 (CET)
Received: by mail-ej1-f51.google.com with SMTP id ud5so46691680ejc.4
	for <drbd-dev@lists.linbit.com>; Wed, 09 Nov 2022 05:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=7hF3rMk8apVOOgsCxEsnYa+onZZgR9Ac90HGkbjlBXY=;
	b=WYj28GSbjnk/0i6VzKp+MEOsvjkvjUeibMvRcUfW8smL/+shwJz5l4p4w/58lBmgHG
	wAF7yA/kX6SFBy/U6gtEdb2TLYEoDejIGD9TO7iJI1aWWq8v8x/2NQCeQYOYCSOlVih+
	jm9H+EOdFouIINDlH9a730ZzHbq3ZLklBfiD4xL4AkgO9e6NYGl216ncs2uqfDGc2sG/
	jNtDphsOaZbNoguEdcNTKrSxD8fofe7WvgLClYsd+29wF/MgfETVfX2rzwwzOvbffDkC
	yZT1XLShDODK9R/wOvvSJbtwJdYfW2ofQea00HyXshfebDO+YAgfBWaQF2qqyeIuWtUT
	RO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=7hF3rMk8apVOOgsCxEsnYa+onZZgR9Ac90HGkbjlBXY=;
	b=kPr2nUewWrGrKBeMtIRMFHnink97t3c6PpMX7nAjWZO1Lh/lsqJra2FYEplQXqZPcz
	gwVlYAAekklllC4Rqqbz+SJX6nIYAWaqnCiDVXpbUFCkSfjajja6BUp2uR+5xvwhIFSf
	QwbGlk4zZu0fA2hNUFbkyQ3khZ/IGTw/bRdiaIYhA/kcFAjAS/TYlA9eMYw64ubPaNxi
	xdfGIlx3DnARInEhFVrJF+hMp2Z7arKS+WPkto6g7Z9talirZfid9vi4O9Svl4egMOo7
	mv2LAlzoqUgE9ZQ2BcrWWqsDH+JKkkxKRXJFjGwYZzDYZziQRpNIP/3Irtk/6aA2j7Um
	a/dA==
X-Gm-Message-State: ACrzQf0Khd6IkmKguH7nGCzAEEuNRFbjGHv6wvfoA0HOd03ORMPnuLvD
	hla9v2yVcnJiM1IkDGAZYrCPMaZx
X-Google-Smtp-Source: AMsMyM4t4CWXtlyKLCZmHOOOVRWjcckjZl3xCwXKb4N+heCpjTiTxHg7GDncjRCrpLbudOygicbj4g==
X-Received: by 2002:a17:906:3b48:b0:7ad:fa67:1daa with SMTP id
	h8-20020a1709063b4800b007adfa671daamr38243729ejf.653.1668000911374;
	Wed, 09 Nov 2022 05:35:11 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	lx8-20020a170906af0800b00782fbb7f5f7sm5867463ejb.113.2022.11.09.05.35.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Nov 2022 05:35:11 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  9 Nov 2022 14:34:52 +0100
Message-Id: <20221109133453.51652-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
References: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/3] drbd: disable discard support if granularity
	> max
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

RnJvbTogUGhpbGlwcCBSZWlzbmVyIDxwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbT4KClRoZSBk
aXNjYXJkX2dyYW51bGFyaXR5IGRlc2NyaWJlcyB0aGUgbWluaW11bSB1bml0IG9mIGEgZGlzY2Fy
ZC4KSWYgdGhhdCBpcyBsYXJnZXIgdGhhbiB0aGUgbWF4aW1hbCBkaXNjYXJkIHNpemUsIHdlIG5l
ZWQgdG8gZGlzYWJsZQpkaXNjYXJkcyBjb21wbGV0ZWx5LgoKUmV2aWV3ZWQtYnk6IEpvZWwgQ29s
bGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBS
ZWlzbmVyIDxwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KLS0tCiBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF9ubC5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwppbmRleCAyNDllYmE3ZDIx
YzIuLjYzZjU4OTkyNmQ4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwu
YworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCkBAIC0xMjU2LDYgKzEyNTYsMTgg
QEAgc3RhdGljIHZvaWQgZml4dXBfd3JpdGVfemVyb2VzKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2
aWNlLCBzdHJ1Y3QgcmVxdWVzdF9xdWV1ZQogCQlxLT5saW1pdHMubWF4X3dyaXRlX3plcm9lc19z
ZWN0b3JzID0gMDsKIH0KIAorc3RhdGljIHZvaWQgZml4dXBfZGlzY2FyZF9zdXBwb3J0KHN0cnVj
dCBkcmJkX2RldmljZSAqZGV2aWNlLCBzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSkKK3sKKwl1bnNp
Z25lZCBpbnQgbWF4X2Rpc2NhcmQgPSBkZXZpY2UtPnJxX3F1ZXVlLT5saW1pdHMubWF4X2Rpc2Nh
cmRfc2VjdG9yczsKKwl1bnNpZ25lZCBpbnQgZGlzY2FyZF9ncmFudWxhcml0eSA9CisJCWRldmlj
ZS0+cnFfcXVldWUtPmxpbWl0cy5kaXNjYXJkX2dyYW51bGFyaXR5ID4+IFNFQ1RPUl9TSElGVDsK
KworCWlmIChkaXNjYXJkX2dyYW51bGFyaXR5ID4gbWF4X2Rpc2NhcmQpIHsKKwkJYmxrX3F1ZXVl
X2Rpc2NhcmRfZ3JhbnVsYXJpdHkocSwgMCk7CisJCWJsa19xdWV1ZV9tYXhfZGlzY2FyZF9zZWN0
b3JzKHEsIDApOworCX0KK30KKwogc3RhdGljIHZvaWQgZHJiZF9zZXR1cF9xdWV1ZV9wYXJhbShz
dHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgc3RydWN0IGRyYmRfYmFja2luZ19kZXYgKmJkZXYs
CiAJCQkJICAgdW5zaWduZWQgaW50IG1heF9iaW9fc2l6ZSwgc3RydWN0IG9fcWxpbSAqbykKIHsK
QEAgLTEyODgsNiArMTMwMCw3IEBAIHN0YXRpYyB2b2lkIGRyYmRfc2V0dXBfcXVldWVfcGFyYW0o
c3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBkcmJkX2JhY2tpCiAJCWRpc2tfdXBk
YXRlX3JlYWRhaGVhZChkZXZpY2UtPnZkaXNrKTsKIAl9CiAJZml4dXBfd3JpdGVfemVyb2VzKGRl
dmljZSwgcSk7CisJZml4dXBfZGlzY2FyZF9zdXBwb3J0KGRldmljZSwgcSk7CiB9CiAKIHZvaWQg
ZHJiZF9yZWNvbnNpZGVyX3F1ZXVlX3BhcmFtZXRlcnMoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZp
Y2UsIHN0cnVjdCBkcmJkX2JhY2tpbmdfZGV2ICpiZGV2LCBzdHJ1Y3Qgb19xbGltICpvKQotLSAK
Mi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xp
c3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
