Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E1669785
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:40:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52738422431;
	Fri, 13 Jan 2023 13:40:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A72F422114
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:47 +0100 (CET)
Received: by mail-ed1-f41.google.com with SMTP id b4so11463006edf.0
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ROtOQl0iT4Ua6doSdkwJJ3Gv1mhqQe8GXYrZrg3slxM=;
	b=ErKW/TxlAkHOp6yWMyc0PYQKS3vas/8+4CtSulX5ZBNX8lQJcb++ZtigEvatXIzNe6
	kD/LuncciPfQjSE7BmEZmrNUraJOcS5aSzS/KWkviHFHVa2WlI/nfg+ZtDDC2x5ICv54
	WJqdCuKUi2pca6TXQdejgPN0R4Od9CDVv8/ZKl+aT3b3Cm75o9M0XqbyIQ5azzLuukGo
	5QfuG83/H2UTMigQgtM/ZeE4MqN4JhZAvmMQLIaxKSRUzCtrwY5GDjyRjlzCrctba+OQ
	ky9Dl5f6NcgrF5Fzc+xUf/eVUlIlSETcnSby4Itn790wXKydl9L8q+QMudSDkFFGDrNF
	tXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ROtOQl0iT4Ua6doSdkwJJ3Gv1mhqQe8GXYrZrg3slxM=;
	b=uYqwOLOVrmcnmsfVxEbMklKGR5wAh8avR2m1spSBRrpZDvqE3zw9Gr5qTTLkD5tUwE
	9ySwltLy+l0W4/xq6/zIvQO+HIlyLK6yGY9Y+0Rt7PEWDvTc5dSI1H1pVe0qAn0AynRd
	Sutg829cUeEWoy9pUgeMiB+H+DXWMAQx+4rcJ1b+LgmFzd+pMZxybXk5OZb86KPY/EmQ
	30hS3bU0HF6N3XnI3BxYRAhvFccadITZDPsrsPjfxtZmjpbHMalZuXz3Vgjb6ivxV5pV
	nNopsul572RQ5XsNzpjInTghhRXPoLb51hHkrkznTcGgNdJLbDyOCdtC063ZFrtyufF6
	lfOQ==
X-Gm-Message-State: AFqh2kruY1/4Vn/E5lGgChMdZdY/JLfTEqra7R7dTaTSa+SaOV5yRyBK
	WN28kvo235AuVQsZnkJffAbm3kPx
X-Google-Smtp-Source: AMrXdXsG7JRoo4+Hp7wbro81KZ3BeWAye4WXsbiO+i6r7mLULfUsoBiLYp9o21eoMeL3awA+AfhBtQ==
X-Received: by 2002:aa7:cad0:0:b0:492:8207:f2ba with SMTP id
	l16-20020aa7cad0000000b004928207f2bamr24829569edt.1.1673613346743;
	Fri, 13 Jan 2023 04:35:46 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:46 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:35 +0100
Message-Id: <20230113123538.144276-6-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
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
