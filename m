Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ED1648445
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Dec 2022 15:56:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 29DAA4252CA;
	Fri,  9 Dec 2022 15:56:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 55EDE420FC2
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 15:53:35 +0100 (CET)
Received: by mail-ej1-f49.google.com with SMTP id n20so12153266ejh.0
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ROtOQl0iT4Ua6doSdkwJJ3Gv1mhqQe8GXYrZrg3slxM=;
	b=ApPRBy01ChJFifDOnwbdnwBSBF0lcYWMqjlMTXz2jhF6/5ANYo14gJvPrTt/ll13S4
	K3w8+TcexOTVeUactHN1bzHljJf8MB3pj+7s2l9W2X2B/rqVw7CJc40bdYAb3MWRWG0C
	rHtrkO46Y6Pi3pN+lpiC3pLYeKw3zGiL8SXaOISfar5nXi0rY5xvNycjwkcZdn40uzix
	IWIZ3TI8SQjhDOrLC2SXzRmEbOO9d2OljNpN/2gfa7/RfgkeBfgclr9buadIgB1EH0TY
	RXQT5ehbonldUCPsY7sbejkfcY2jU8HE86oKqZI8WC68NKs999tNSNRAWzzFHs0YHQPn
	Tv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ROtOQl0iT4Ua6doSdkwJJ3Gv1mhqQe8GXYrZrg3slxM=;
	b=j97ZHkBpxOzoBnMCracmYiDRDVruosCa3BfTTuv2hZ4R85qZIBhCg8dpGRPCVw0f3y
	ESmJHgLik5zlvSxpV01u8GAHSOhof/IPBCkbFlZjv06IU7Hx1YfArmc5WAoB8KAi8xpU
	ET6zrdkhIXXBt5/RuJVtpfI8dVKt8YnZbLcOhzXXm1G4/Z9I2aLXsJSSZsfuB/j189rM
	FVak45ZSgSvmukdgMS3/+2a0RWP91m9WroutD/NWyyAVFO7LiQONBXt351QdVzdw8dtU
	wSuebHR4ZMc9f/QjK9L6w6Gn/+8E42BBZkDQfsz03xeXqf7DahVS6imtEMKWjlfw82fz
	XBZA==
X-Gm-Message-State: ANoB5pkg22uIj9tr/y+bVAcsxJDyTRHPS7xTDyBtWHYau3HaMjS+lmqS
	WHxCws1wbZCm8j0JE9+fwR3Iy8xpEyUxq8OZpUOYVQ==
X-Google-Smtp-Source: AA0mqf4FR3/rLj1r8DduSRH9Ahrzdkej5gCrltixWaV5Ldqq3If0NcyorWhWwageABZaLWMi1ZsSug==
X-Received: by 2002:a17:906:1115:b0:7c1:1fcf:266c with SMTP id
	h21-20020a170906111500b007c11fcf266cmr5039561eja.14.1670597615707;
	Fri, 09 Dec 2022 06:53:35 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	bd21-20020a056402207500b0046bb7503d9asm728424edb.24.2022.12.09.06.53.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 06:53:35 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  9 Dec 2022 15:53:24 +0100
Message-Id: <20221209145327.2272271-6-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
References: <20221209145327.2272271-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 5/8] drbd: remove macros using require_context
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

VGhpcyByZXF1aXJlX2NvbnRleHQgYXR0cmlidXRlIG9yaWdpbmF0ZWQgaW4gYSBwcm9wb3NlZCBz
cGFyc2UgcGF0Y2ggYnkKUGhpbGlwcCBSZWlzbmVyIGJhY2sgaW4gMjAwOC4gSm9oYW5uZXMgQmVy
ZyBoYWQgYSBkaWZmZXJlbnQgc29sdXRpb24gdG8KYSBzaW1pbGFyIHByb2JsZW0sIGFuZCB0aGF0
IHBhdGNoICJ3b24iIGluIHRoZSBlbmQ7IHNvIHRoZSByZXF1aXJlX2NvbnRleHQKdGhpbmcgbmV2
ZXIgZ290IG1lcmdlZC4gVGhlIHdob2xlIGhpc3RvcnkgY2FuIGJlIHJlYWQgYXQgWzBdLgoKRFJC
RCBrZXB0IHVzaW5nIHRoZXNlIGFubm90YXRpb25zIGFueXdheSBmb3IgYSB3aGlsZS4gTm93YWRh
eXMsIG9uIGEKbW9kZXJuIHVubW9kaWZpZWQgc3BhcnNlLCB0aGV5IG9idmlvdXNseSBkbyBub3Ro
aW5nLCBhbmQgdGhleSBhcmUgaGFyZGx5CnVzZWQgYW55bW9yZSBhbnl3YXkuCgpTbywganVzdCBy
ZW1vdmUgdGhlIGRlZmluaXRpb25zIG9mIHRoZXNlIG1hY3Jvcy4KClswXSBodHRwczovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9saW51eC1zcGFyc2UvbXNnMDExNTAuaHRtbAoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4K
LS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCB8IDEyICstLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2ludC5oCmluZGV4IGFlNzEzMzM4YWE0Ni4uZWRjZTFmN2FjMmRhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAorKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9p
bnQuaApAQCAtMzksMTYgKzM5LDYgQEAKICNpbmNsdWRlICJkcmJkX3Byb3RvY29sLmgiCiAjaW5j
bHVkZSAiZHJiZF9wb2x5bW9ycGhfcHJpbnRrLmgiCiAKLSNpZmRlZiBfX0NIRUNLRVJfXwotIyBk
ZWZpbmUgX19wcm90ZWN0ZWRfYnkoeCkgICAgICAgX19hdHRyaWJ1dGVfXygocmVxdWlyZV9jb250
ZXh0KHgsMSw5OTksInJkd3IiKSkpCi0jIGRlZmluZSBfX3Byb3RlY3RlZF9yZWFkX2J5KHgpICBf
X2F0dHJpYnV0ZV9fKChyZXF1aXJlX2NvbnRleHQoeCwxLDk5OSwicmVhZCIpKSkKLSMgZGVmaW5l
IF9fcHJvdGVjdGVkX3dyaXRlX2J5KHgpIF9fYXR0cmlidXRlX18oKHJlcXVpcmVfY29udGV4dCh4
LDEsOTk5LCJ3cml0ZSIpKSkKLSNlbHNlCi0jIGRlZmluZSBfX3Byb3RlY3RlZF9ieSh4KQotIyBk
ZWZpbmUgX19wcm90ZWN0ZWRfcmVhZF9ieSh4KQotIyBkZWZpbmUgX19wcm90ZWN0ZWRfd3JpdGVf
YnkoeCkKLSNlbmRpZgotCiAvKiBzaGFyZWQgbW9kdWxlIHBhcmFtZXRlcnMsIGRlZmluZWQgaW4g
ZHJiZF9tYWluLmMgKi8KICNpZmRlZiBDT05GSUdfRFJCRF9GQVVMVF9JTkpFQ1RJT04KIGV4dGVy
biBpbnQgZHJiZF9lbmFibGVfZmF1bHRzOwpAQCAtNzc0LDcgKzc2NCw3IEBAIHN0cnVjdCBkcmJk
X2RldmljZSB7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAogCS8qIGNvbmZpZ3VyZWQgYnkgZHJi
ZHNldHVwICovCi0Jc3RydWN0IGRyYmRfYmFja2luZ19kZXYgKmxkZXYgX19wcm90ZWN0ZWRfYnko
bG9jYWwpOworCXN0cnVjdCBkcmJkX2JhY2tpbmdfZGV2ICpsZGV2OwogCiAJc2VjdG9yX3QgcF9z
aXplOyAgICAgLyogcGFydG5lcidzIGRpc2sgc2l6ZSAqLwogCXN0cnVjdCByZXF1ZXN0X3F1ZXVl
ICpycV9xdWV1ZTsKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
