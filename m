Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFF669781
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:39:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D453D422271;
	Fri, 13 Jan 2023 13:39:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7DA37422112
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:46 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id mp20so5396034ejc.7
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8SGWONfVHjklNBkXRu6sFYgnXokffLko1IC/BWEcSP8=;
	b=Joe7Sd9Hx4Gf2vwVgdgILntRRgbEjXOg1uMsmUrBuUlBqw+V6tmmR9kV6DLRp8BlK1
	ceDmU736RBaVBZoQ+8FYfrrs5IvOy6tR8uirV7ddw9x5vp2qzik8heDc2f8Y1mkueEl+
	dIelEVxs3O0T5iWPpLTmXn5E/l8duiVzSlpf4rpgk5Ad6eEN0JZNFjZp6ikSwLSFDbpS
	rHQISTWVPR9ijUstQljd8vTV3syLFWn6W0YrGY/O/ra3yRXVHoxF5lxlNEL+6TQBS7gw
	V8mffcjHc18bXEs3wF7sbNgTx206HqTvVfHJgHilmfgjWVi+2thqLCLj/mlHGai9WXPh
	uNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=8SGWONfVHjklNBkXRu6sFYgnXokffLko1IC/BWEcSP8=;
	b=I2L6qMbHP/3lDNGUnQIZOddegj1qGwahPddEQgZyHyRTEJB7WA/JAKOvzqoGfJl6/D
	bdMhl40Wl7kbctmZpM2+jGnSfZcluMTQwy4tN37GwEuNS+9OuwMCVvFdzHYEl+KiN4Ts
	dXZT089K/LgD2s0CKC815G4B9IjPpBmywSoZwRwd4Qtypn/qUGtNKO3Y5cRb3O0u/Nmw
	wC9LQLCiFH2p53uJVRtY8JXM9NYnvEbXbMSg8Ylw4lXsb/+eVZBm73rFNuTbMy0CxMZO
	gFCY87ehfKY0xMvJZXUYyGMQvackMr3g7At++zZ0/GwoAB8BgGQ9LygKTVVQEu1ZvwUE
	jH9g==
X-Gm-Message-State: AFqh2koWOnwQKYIgql87heYQCfQDZ6C1PUfnc1h2uZDxGGJgYIFB/onO
	dL6C/MdVx7RmChtdgR6IJPCvg8eVoC/Mgo072M6cCw==
X-Google-Smtp-Source: AMrXdXvuKKjhYnwWG7p48seWblhNni3qNMosJbFSWpWw/FpYs9PxwOjAk6HwAAJ51o4yQVkK9jURSQ==
X-Received: by 2002:a17:906:5042:b0:841:e5b3:c95f with SMTP id
	e2-20020a170906504200b00841e5b3c95fmr67054967ejk.29.1673613345846;
	Fri, 13 Jan 2023 04:35:45 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:45 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:34 +0100
Message-Id: <20230113123538.144276-5-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 4/8] drbd: remove unnecessary assignment in
	vli_encode_bits
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxk
ZXJAbGluYml0LmNvbT4KUmV2aWV3ZWQtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VA
bGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF92bGkuaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3ZsaS5oIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
dmxpLmgKaW5kZXggMWVlODFlM2MyMTUyLi45NDFjNTExY2M0ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX3ZsaS5oCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3Zs
aS5oCkBAIC0zMjcsNyArMzI3LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYml0c3RyZWFtX2dldF9i
aXRzKHN0cnVjdCBiaXRzdHJlYW0gKmJzLCB1NjQgKm91dCwgaW50IGJpdHMpCiAgKi8KIHN0YXRp
YyBpbmxpbmUgaW50IHZsaV9lbmNvZGVfYml0cyhzdHJ1Y3QgYml0c3RyZWFtICpicywgdTY0IGlu
KQogewotCXU2NCBjb2RlID0gY29kZTsKKwl1NjQgY29kZTsKIAlpbnQgYml0cyA9IF9fdmxpX2Vu
Y29kZV9iaXRzKCZjb2RlLCBpbik7CiAKIAlpZiAoYml0cyA8PSAwKQotLSAKMi4zOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
