Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 059CB5BADB
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2019 13:39:54 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D40371028A76;
	Mon,  1 Jul 2019 13:39:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 348191011BF7
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2019 13:39:27 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id e3so3919837wrs.11
	for <drbd-dev@lists.linbit.com>; Mon, 01 Jul 2019 04:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=elXp1aRzWl/H7rMMwgQt+6149bGjSIsrRSI9clCQq8s=;
	b=PB5S7Qdg//C4W2ZRwK1IdiRXCdM0j2c4ym7WJ7UodGRunj6/BW6Qr6GNs4aq4onht9
	2rkO7PirPxCbzP2KT6gF8fNfGjrMTKE868uKrbOAP0JZTkvrpPML1x3O6UmZFD66mvkt
	Sw4oBaYdZlTV2YAYALxeDFTPqRJWVjB9+rCoY2iDyOWPIg9gxX5cmz4aLaSmEyt6gWf2
	hcKKehSMy8GJiKPaPM0Ft5Mlh8Md39CHmkkhlcINmM66iE0faGtGXvXkOf2M4T6oP8Mh
	GxtP0y5kZJfZdgFM+723/4B/XX0G0zbscqPldjeIg9ukbjjkKOAe1+o18pqgQYZmCfbX
	9JLg==
X-Gm-Message-State: APjAAAV2etxEKMI7XPjBYPsFG5mvxw/zonhpvHr3yy5ZJf2rn75Dl/eo
	q6DKZH3KY9DOtpvxMfOH/58eF/1eClE+rg==
X-Google-Smtp-Source: APXvYqzLtxI1wFMaSSIRieuMQHWQZ8+09eia80cPPVPVaRd1c11YJLwpYruQ9aUpTzWPm1H5Ii/hUw==
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr15268819wru.242.1561981167135; 
	Mon, 01 Jul 2019 04:39:27 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	v15sm9461026wrt.25.2019.07.01.04.39.26
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Jul 2019 04:39:26 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 1 Jul 2019 13:39:25 +0200
Resent-Message-ID: <20190701113925.GD6950@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B56B1028A7C
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2019 15:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=elXp1aRzWl/H7rMMwgQt+6149bGjSIsrRSI9clCQq8s=;
	b=GNsqzjL07ulC+4iwMZEDlhTiew
	XY32uik+FfWmbVpMOqQi8oM0EYIfR8lET3XaUnbyOE4vPCLp5+YaoO+uAci65sf7m91HCZ0+jOWrx
	FVOX6qweQzlJ8psZtO1NV8ih3YZvyp7oTQU0Api0OkCmokV6NXI7jsjGINatWdKSKJI2xZE51eLk+
	O8Fl+LtlO38KS5ZGyzoWm2EKfXgydGz3Ki/ykDat+2arGmtH/BSRjFXvvOgkcV21bE1Diwc9Zly87
	5u3OQkbP8o5R7KunLFbFwdZidEAy9et7YcDJlfjmUAY3JPWrDX1RCtb26OnJ7n0uyGQgIabBnjKjR
	mrayjqLg==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hgq1V-00055v-0o; Fri, 28 Jun 2019 12:30:37 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1hgq1S-0005To-SY; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Fri, 28 Jun 2019 09:30:29 -0300
Message-Id: <d3cd5d1309647bd16b3590419e7a2387eaf24bad.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	linux-arm-kernel@lists.infradead.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 36/39] docs: add SPDX tags to new index files
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QWxsIHRob3NlIG5ldyBmaWxlcyBJIGFkZGVkIGFyZSB1bmRlciBHUEwgdjIuMCBsaWNlbnNlLgoK
QWRkIHRoZSBjb3JyZXNwb25kaW5nIFNQRFggaGVhZGVycyB0byB0aGVtLgoKU2lnbmVkLW9mZi1i
eTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KLS0t
CiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Jsb2NrZGV2L2RyYmQvZmlndXJlcy5yc3QgfCAy
ICsrCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Jsb2NrZGV2L2luZGV4LnJzdCAgICAgICAg
fCAyICsrCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvaW5kZXgucnN0ICAgICAg
ICAgfCAxICsKIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbmFtZXNwYWNlcy9pbmRleC5yc3Qg
ICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QgICAg
ICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYXJtL2luZGV4LnJzdCAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYXJtL253ZnBlL2luZGV4LnJzdCAgICAg
ICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYXJtL29tYXAvaW5kZXgucnN0ICAg
ICAgICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYXJtL3NhMTEwMC9pbmRleC5y
c3QgICAgICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYXJtL3NhbXN1bmctczNj
MjR4eC9pbmRleC5yc3QgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vYXJtL3NhbXN1bmcv
aW5kZXgucnN0ICAgICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vZHJpdmVyLWFw
aS9lYXJseS11c2Vyc3BhY2UvaW5kZXgucnN0ICB8IDIgKysKIERvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS9tZC9pbmRleC5yc3QgICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9tZW1vcnktZGV2aWNlcy9pbmRleC5yc3QgICB8IDIgKysKIERvY3VtZW50YXRpb24v
ZHJpdmVyLWFwaS9tbWMvaW5kZXgucnN0ICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50YXRp
b24vZHJpdmVyLWFwaS9tdGQvaW5kZXgucnN0ICAgICAgICAgICAgICB8IDIgKysKIERvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9uZmMvaW5kZXgucnN0ICAgICAgICAgICAgICB8IDIgKysKIERvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS9udmRpbW0vaW5kZXgucnN0ICAgICAgICAgICB8IDIgKysKIERv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS9waHkvaW5kZXgucnN0ICAgICAgICAgICAgICB8IDIgKysK
IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9yYXBpZGlvL2luZGV4LnJzdCAgICAgICAgICB8IDIg
KysKIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS90aGVybWFsL2luZGV4LnJzdCAgICAgICAgICB8
IDIgKysKIERvY3VtZW50YXRpb24vaWE2NC9pbmRleC5yc3QgICAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKysKIDIyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Jsb2NrZGV2L2RyYmQvZmlndXJlcy5yc3QgYi9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Jsb2NrZGV2L2RyYmQvZmlndXJlcy5yc3QKaW5kZXgg
M2UzZmQ0YjhhNDc4Li5iZDlhNDkwMWZlNDYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvYmxvY2tkZXYvZHJiZC9maWd1cmVzLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2Jsb2NrZGV2L2RyYmQvZmlndXJlcy5yc3QKQEAgLTEsMyArMSw1IEBACisuLiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCiAuLiBUaGUgaGVyZSBpbmNsdWRlZCBm
aWxlcyBhcmUgaW50ZW5kZWQgdG8gaGVscCB1bmRlcnN0YW5kIHRoZSBpbXBsZW1lbnRhdGlvbgog
CiBEYXRhIGZsb3dzIHRoYXQgUmVsYXRlIHNvbWUgZnVuY3Rpb25zLCBhbmQgd3JpdGUgcGFja2V0
cwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9ibG9ja2Rldi9pbmRleC5y
c3QgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Jsb2NrZGV2L2luZGV4LnJzdAppbmRleCAy
MGE3MzhkOWQwNDcuLmI5MDNjZjE1MjA5MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9ibG9ja2Rldi9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9ibG9ja2Rldi9pbmRleC5yc3QKQEAgLTEsMyArMSw1IEBACisuLiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAorCiA9PT09PT09PT09PT09PT09PT09PT09PT09PT0KIFRoZSBMaW51
eCBSYXBpZElPIFN1YnN5c3RlbQogPT09PT09PT09PT09PT09PT09PT09PT09PT09CmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvaW5kZXgucnN0IGIvRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9sYXB0b3BzL2luZGV4LnJzdAppbmRleCA2YjU1NGUzOTg2M2Iu
LmNkOWExYzI2OTVmZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9sYXB0
b3BzL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvaW5k
ZXgucnN0CkBAIC0xLDMgKzEsNCBAQAorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKIAogPT09PT09PT09PT09PT0KIExhcHRvcCBEcml2ZXJzCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL25hbWVzcGFjZXMvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9uYW1lc3BhY2VzL2luZGV4LnJzdAppbmRleCA3MTNlYzQ5NDlmYTcuLjM4NGYy
ZTBmMzNkMiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9uYW1lc3BhY2Vz
L2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL25hbWVzcGFjZXMvaW5k
ZXgucnN0CkBAIC0xLDMgKzEsNSBAQAorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKKwogPT09PT09PT09PQogTmFtZXNwYWNlcwogPT09PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9wZXJmL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QKaW5kZXggOWQ0NDU0NTFlYTE4Li5lZTRiZmQyYTc0MGYg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QKKysr
IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9wZXJmL2luZGV4LnJzdApAQCAtMSwzICsxLDUg
QEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKID09PT09PT09PT09PT09
PT09PT09PT09PT09PQogUGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJtL2luZGV4LnJzdCBi
L0RvY3VtZW50YXRpb24vYXJtL2luZGV4LnJzdAppbmRleCA5YzJmNzgxZjQ2ODUuLjVmYzA3MmRk
MGM1ZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm0vaW5kZXgucnN0CisrKyBiL0RvY3Vt
ZW50YXRpb24vYXJtL2luZGV4LnJzdApAQCAtMSwzICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCisKID09PT09PT09PT09PT09PT0KIEFSTSBBcmNoaXRlY3R1cmUK
ID09PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJtL253ZnBlL2lu
ZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vYXJtL253ZnBlL2luZGV4LnJzdAppbmRleCAyMWZhOGNl
MTkyYWUuLjNjNGQyZjlhYTEwZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm0vbndmcGUv
aW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJtL253ZnBlL2luZGV4LnJzdApAQCAtMSwz
ICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CiBOZXRXaW5kZXIncyBmbG9hdGluZyBwb2ludCBl
bXVsYXRvcgogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vYXJtL29tYXAvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hcm0vb21h
cC9pbmRleC5yc3QKaW5kZXggZjFlOWMxMWQ5ZjliLi44YjM2NWIyMTJlNDkgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vYXJtL29tYXAvaW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJt
L29tYXAvaW5kZXgucnN0CkBAIC0xLDMgKzEsNSBAQAorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKKwogPT09PT09PQogVEkgT01BUAogPT09PT09PQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9hcm0vc2ExMTAwL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vYXJtL3NhMTEw
MC9pbmRleC5yc3QKaW5kZXggZmIyMzg1YjNhY2NmLi42OGMyYTI4MGE3NDUgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vYXJtL3NhMTEwMC9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9h
cm0vc2ExMTAwL2luZGV4LnJzdApAQCAtMSwzICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCisKID09PT09PT09PT09PT09PT09PT09CiBJbnRlbCBTdHJvbmdBUk0g
MTEwMAogPT09PT09PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJt
L3NhbXN1bmctczNjMjR4eC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FybS9zYW1zdW5nLXMz
YzI0eHgvaW5kZXgucnN0CmluZGV4IDZjN2IyNDFjYmYzNy4uNWI4YTdmOTM5OGQ4IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2FybS9zYW1zdW5nLXMzYzI0eHgvaW5kZXgucnN0CisrKyBiL0Rv
Y3VtZW50YXRpb24vYXJtL3NhbXN1bmctczNjMjR4eC9pbmRleC5yc3QKQEAgLTEsMyArMSw1IEBA
CisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCiDvu789PT09PT09PT09PT09
PT09PT09PT09PT09PQogU2Ftc3VuZyBTM0MyNFhYIFNvQyBGYW1pbHkKID09PT09PT09PT09PT09
PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FybS9zYW1zdW5nL2luZGV4
LnJzdCBiL0RvY3VtZW50YXRpb24vYXJtL3NhbXN1bmcvaW5kZXgucnN0CmluZGV4IGY1NGQ5NTcz
NDM2Mi4uODE0MmNjZTNkMjNlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FybS9zYW1zdW5n
L2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FybS9zYW1zdW5nL2luZGV4LnJzdApAQCAt
MSwzICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKID09PT09
PT09PT09CiBTYW1zdW5nIFNvQwogPT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZHJpdmVyLWFwaS9lYXJseS11c2Vyc3BhY2UvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL2Vhcmx5LXVzZXJzcGFjZS9pbmRleC5yc3QKaW5kZXggNmYyMGMzYzU2MGQ4Li4x
NDljMTgyMmYwNmQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9lYXJseS11
c2Vyc3BhY2UvaW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9lYXJseS11
c2Vyc3BhY2UvaW5kZXgucnN0CkBAIC0xLDMgKzEsNSBAQAorLi4gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKKwogPT09PT09PT09PT09PT09CiBFYXJseSBVc2Vyc3BhY2UKID09PT09
PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL21kL2luZGV4
LnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tZC9pbmRleC5yc3QKaW5kZXggMjA1MDgw
ODkxYTFhLi4xOGY1NGE3ZDdkNmUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFw
aS9tZC9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL21kL2luZGV4LnJz
dApAQCAtMSwzICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisK
ID09PT0KIFJBSUQKID09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9t
ZW1vcnktZGV2aWNlcy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbWVtb3J5
LWRldmljZXMvaW5kZXgucnN0CmluZGV4IDg3NTQ5ODI4ZjZhYi4uMjgxMDE0NThjZGE1IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbWVtb3J5LWRldmljZXMvaW5kZXgucnN0
CisrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tZW1vcnktZGV2aWNlcy9pbmRleC5yc3QK
QEAgLTEsMyArMSw1IEBACisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCiA9
PT09PT09PT09PT09PT09PT09PT09PT09CiBNZW1vcnkgQ29udHJvbGxlciBkcml2ZXJzCiA9PT09
PT09PT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1h
cGkvbW1jL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tbWMvaW5kZXgucnN0
CmluZGV4IDlhYWY2NDk1MWE4Yy4uNzMzOTczNmFjNzc0IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvbW1jL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1h
cGkvbW1jL2luZGV4LnJzdApAQCAtMSwzICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCisKID09PT09PT09PT09PT09PT09PT09PT09PQogTU1DL1NEL1NESU8gY2Fy
ZCBzdXBwb3J0CiA9PT09PT09PT09PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9tdGQvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L210ZC9pbmRleC5yc3QKaW5kZXggMmUwZTdjYzQwNTVlLi40MzZiYTVhODUxZDcgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tdGQvaW5kZXgucnN0CisrKyBiL0RvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9tdGQvaW5kZXgucnN0CkBAIC0xLDMgKzEsNSBAQAorLi4gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKwogPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CiBNZW1vcnkgVGVjaG5vbG9neSBEZXZpY2UgKE1URCkKID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL25mYy9pbmRl
eC5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbmZjL2luZGV4LnJzdAppbmRleCAzYWZi
MmMwYzJlM2MuLmI2ZTllZWRiZmYyOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL25mYy9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL25mYy9pbmRl
eC5yc3QKQEAgLTEsMyArMSw1IEBACisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAorCiA9PT09PT09PT09PT09PT09PT09PT09PT0KIE5lYXIgRmllbGQgQ29tbXVuaWNhdGlvbgog
PT09PT09PT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZl
ci1hcGkvbnZkaW1tL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9udmRpbW0v
aW5kZXgucnN0CmluZGV4IDE5ZGM4ZWUzNzFkYy4uYTRmOGY5OGFlYjk0IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbnZkaW1tL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvbnZkaW1tL2luZGV4LnJzdApAQCAtMSwzICsxLDUgQEAKKy4uIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CiBOb24tVm9sYXRpbGUgTWVtb3J5IERldmljZSAoTlZESU1NKQogPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9waHkvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3BoeS9pbmRl
eC5yc3QKaW5kZXggZmNlOWZmYWUyODEyLi42OWJhMTIxNmRlNzIgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS9waHkvaW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9waHkvaW5kZXgucnN0CkBAIC0xLDMgKzEsNSBAQAorLi4gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKKwogPT09PT09PT09PT09PT09PT09PT09CiBHZW5lcmljIFBIWSBG
cmFtZXdvcmsKID09PT09PT09PT09PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kcml2ZXItYXBpL3JhcGlkaW8vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L3JhcGlkaW8vaW5kZXgucnN0CmluZGV4IDRjNWU1MWEwNTEzNC4uYTQxYjQyNDJkMTZmIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcmFwaWRpby9pbmRleC5yc3QKKysrIGIv
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3JhcGlkaW8vaW5kZXgucnN0CkBAIC0xLDMgKzEsNSBA
QAorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKwogPT09PT09PT09PT09PT09
PT09PT09PT09PT09CiBUaGUgTGludXggUmFwaWRJTyBTdWJzeXN0ZW0KID09PT09PT09PT09PT09
PT09PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3RoZXJt
YWwvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3RoZXJtYWwvaW5kZXgucnN0
CmluZGV4IDY4Y2ViNjg4NjU2MS4uNWJhNjFkMTljNmFlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvdGhlcm1hbC9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2
ZXItYXBpL3RoZXJtYWwvaW5kZXgucnN0CkBAIC0xLDMgKzEsNSBAQAorLi4gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKKwogPT09PT09PQogVGhlcm1hbAogPT09PT09PQpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9pYTY0L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vaWE2NC9p
bmRleC5yc3QKaW5kZXggZWY5OTQ3NWY2NzJiLi4wNDM2ZTEwMzQxMTUgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vaWE2NC9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9pYTY0L2luZGV4
LnJzdApAQCAtMSwzICsxLDUgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
CisKID09PT09PT09PT09PT09PT09PQogSUEtNjQgQXJjaGl0ZWN0dXJlCiA9PT09PT09PT09PT09
PT09PT0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20K
aHR0cDovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
