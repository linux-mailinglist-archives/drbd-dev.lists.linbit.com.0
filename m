Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BA6A82DF
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Mar 2023 13:55:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFC8E421748;
	Thu,  2 Mar 2023 13:55:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 66C674210CD
	for <drbd-dev@lists.linbit.com>; Thu,  2 Mar 2023 13:55:26 +0100 (CET)
Received: by mail-ed1-f42.google.com with SMTP id d30so67213913eda.4
	for <drbd-dev@lists.linbit.com>; Thu, 02 Mar 2023 04:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1677761725;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=54k/F/kd1jw+ZRVo2rfRXmr6Q0n6AeiP/4wU154+q3M=;
	b=DiYufgsNUoUuET376YLirzNgz4MVoF9JGtbOLkgT9k9ZJD35xX57JvfCvzvTT7g+BM
	2VMDCUs2GtxDAM0nBW6VRfnbt9NmMM58l2kJ+BNWAxLG4I7dRVN4MAw5/XZWjRMPZ3YR
	to1KACqfwGfqC8mvdRQ6Vpu7XE7ULLgmMLBUoQWJKc8WQ5Wc65+kkPNBwwveSN9Zl6dA
	KYI1BuagHWj57GzPc96lXU2WqQD3Zrsh9+jiotUGPmBTJdrlIx4Erqv8XW4a6JaFsDyO
	0E+Wo4giVsNhttMqArV20tgQaWpNYnv4T7C8+hqwiBc+WI+iWL7hbbPUlGJm2MsCYW4A
	SLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1677761725;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=54k/F/kd1jw+ZRVo2rfRXmr6Q0n6AeiP/4wU154+q3M=;
	b=CNDpRTLmMMLej+MS44x581eVuAQshfIUKcJ9RBV+N6vLzuDMTX5GK6UPCKe7ldsgBM
	Z9gOviZZTsfGLls4J8Ap39QVMOme9T+bsqfTlZq5FipWBgWM3XEiBXcIJS5Sfu8p3Yfp
	Baxl6c47hs3et/LsAYMDycLD6MHqn+oIzpNSNZW+soD8POofpKBXQWOYm3Qlt0PZN0tj
	8Vg9VqwOICA3yubdA8MzVPVOy5Ve2o5OcVTTn0/AeLRXJeyVLBrPK3nvr8VNjGbHcRll
	5By/AgyKDvtiCUuJDVsqgD+Oo9yZwA13OQKros4z+XCCe4dd7S8q7CqX9fHWcmyJ/79r
	p6Jg==
X-Gm-Message-State: AO0yUKWcOYQqKZwnLje7wQO1JRTAC/E1F2kBgeEjCPUmvdWCN1k7h4JU
	KQAbytoCe2ZK5xC5zn2buH0vek68
X-Google-Smtp-Source: AK7set/8pIVyuXgKoQRPGW3GjFFjUmIZqdaOxXk1X6aOFM5g3/5F089uBAXT394Gy23mPnOOYs6zpg==
X-Received: by 2002:a17:906:468d:b0:8b1:353a:2636 with SMTP id
	a13-20020a170906468d00b008b1353a2636mr11122371ejr.14.1677761725603;
	Thu, 02 Mar 2023 04:55:25 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a98-20020a509eeb000000b004ad601533a3sm6955034edf.55.2023.03.02.04.55.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Mar 2023 04:55:24 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  2 Mar 2023 13:54:39 +0100
Message-Id: <20230302125445.2653493-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
References: <20230302125445.2653493-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 1/7] genetlink: make _genl_cmd_to_str static
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

UHJpbWFyaWx5IHRvIHNpbGVuY2Ugd2FybmluZ3MgbGlrZToKd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciAneHh4X2dlbmxfY21kX3RvX3N0cicgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13
YWxkZXJAbGluYml0LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2dlbmxfbWFnaWNfZnVuYy5oIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9nZW5sX21hZ2ljX2Z1bmMuaCBiL2luY2x1ZGUvbGludXgv
Z2VubF9tYWdpY19mdW5jLmgKaW5kZXggNGE0YjM4NzE4MWFkLi4yOTg0YjBjYjI0YjEgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvZ2VubF9tYWdpY19mdW5jLmgKKysrIGIvaW5jbHVkZS9saW51
eC9nZW5sX21hZ2ljX2Z1bmMuaApAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyBpbnQgc19uYW1l
ICMjIF9mcm9tX2F0dHJzX2Zvcl9jaGFuZ2Uoc3RydWN0IHNfbmFtZSAqcywJCVwKICAqIE1hZ2lj
OiBkZWZpbmUgb3AgbnVtYmVyIHRvIG9wIG5hbWUgbWFwcGluZwkJCQl7e3sxCiAgKgkJCQkJCQkJ
CXt7ezIKICAqLwotY29uc3QgY2hhciAqQ09OQ0FUXyhHRU5MX01BR0lDX0ZBTUlMWSwgX2dlbmxf
Y21kX3RvX3N0cikoX191OCBjbWQpCitzdGF0aWMgY29uc3QgY2hhciAqQ09OQ0FUXyhHRU5MX01B
R0lDX0ZBTUlMWSwgX2dlbmxfY21kX3RvX3N0cikoX191OCBjbWQpCiB7CiAJc3dpdGNoIChjbWQp
IHsKICN1bmRlZiBHRU5MX29wCi0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Ry
YmQtZGV2Cg==
