Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C1072669787
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Jan 2023 13:40:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9D63F422456;
	Fri, 13 Jan 2023 13:40:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42F57422115
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 13:35:49 +0100 (CET)
Received: by mail-ej1-f44.google.com with SMTP id u9so52055350ejo.0
	for <drbd-dev@lists.linbit.com>; Fri, 13 Jan 2023 04:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=w8l6YI6ll5WTtemsFOxZHnG0tRV3sgRpFSwrNSjhQUI=;
	b=n5fyYkdzH0FaufBTIPFRKPuo0z+AnNGqgMIwP1N9mikuhruiPj9WRKliJKtqkJNcSH
	jdCwrwklvxXlnybHa2UFVFEhVxo4yxnl8RG0yqtoK6PM/qUzfFALdh3BP1L2UPVBR9o/
	w6zxIZEnL5J2sKJYA0OPCfypQ0p9FVxHHUrz6Z1/JMdUq1spCP7LrSapSCEMuwGCHe8s
	HGX+lofy0D+Q+QodiXTM0nZKzf/sIpaOtXX8WkCVlMaYF2cEEk1uvCC20PCV1+9TJe7q
	9hzSbMatiM8L1ARpqUspUBtbv9iuXjfy6N1xV7yn0VoH1DnxioqTPvTQdYkdND7Ap/8M
	BVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=w8l6YI6ll5WTtemsFOxZHnG0tRV3sgRpFSwrNSjhQUI=;
	b=AGBrRCZOYj0QJGWwy/wlM112I2K3cnloMEYA4WP54ylS6A7YHKyKxjoG1adKuCmEiR
	pkk/hFMdo7p95R5IoIn6SgkbKh1TNuiqF3f5EaGPUtsOQAJmQn0K81AIZWoSYdxIuvpi
	YI7TFEgbSKzgV6g42eGelA2lSYJQ0OzHKct/AuMAxXu1mAeA0/xgVqkY15xNIr/lGZ7m
	EfSE+04bKilOMz8O48dcOcBuLBWTvDlvBc8WDdRGyHErtOXAM8b0OeCv9Q6vkM9i70rM
	e2QoYP3QOX2M7DUzH4DjkfuXtJd+qtC0GI+Fk9iMKbKrKyl5If5Wm4dufoNsD//hoj5C
	OWXA==
X-Gm-Message-State: AFqh2kofsXN5ZpLtSiEpoEurzi4o/zzaGTB3zs42VUKZU9iOhYGSq4YC
	Mz0P9mNi1mj3Qc2T/8XkDgktLinBTpCZx5jcaG4LHA==
X-Google-Smtp-Source: AMrXdXu44yUl9NgFIBf8qhXToOixwyuyGJ/Lw4hHpgVpqAff1RfeVl1gcgrTKjFSUgjeQWYdT5EfWQ==
X-Received: by 2002:a17:906:3993:b0:844:de87:8684 with SMTP id
	h19-20020a170906399300b00844de878684mr78074081eje.46.1673613349021;
	Fri, 13 Jan 2023 04:35:49 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	17-20020a170906329100b007c0bb571da5sm8402496ejw.41.2023.01.13.04.35.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Jan 2023 04:35:48 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Jan 2023 13:35:38 +0100
Message-Id: <20230113123538.144276-9-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
References: <20230113123538.144276-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 8/8] drbd: drbd_insert_interval(): Clarify comment
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
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnRlcnZhbC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfaW50ZXJ2YWwuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X2ludGVydmFsLmMKaW5kZXggYjZhYWYwZDRkODViLi44NzNiZWRhNmRlMjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludGVydmFsLmMKKysrIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfaW50ZXJ2YWwuYwpAQCAtNTgsNyArNTgsNyBAQCBkcmJkX2luc2VydF9pbnRlcnZh
bChzdHJ1Y3QgcmJfcm9vdCAqcm9vdCwgc3RydWN0IGRyYmRfaW50ZXJ2YWwgKnRoaXMpCiAgKiBk
cmJkX2NvbnRhaW5zX2ludGVydmFsICAtICBjaGVjayBpZiBhIHRyZWUgY29udGFpbnMgYSBnaXZl
biBpbnRlcnZhbAogICogQHJvb3Q6CXJlZCBibGFjayB0cmVlIHJvb3QKICAqIEBzZWN0b3I6CXN0
YXJ0IHNlY3RvciBvZiBAaW50ZXJ2YWwKLSAqIEBpbnRlcnZhbDoJbWF5IG5vdCBiZSBhIHZhbGlk
IHBvaW50ZXIKKyAqIEBpbnRlcnZhbDoJbWF5IGJlIGFuIGludmFsaWQgcG9pbnRlcgogICoKICAq
IFJldHVybnMgaWYgdGhlIHRyZWUgY29udGFpbnMgdGhlIG5vZGUgQGludGVydmFsIHdpdGggc3Rh
cnQgc2VjdG9yIEBzdGFydC4KICAqIERvZXMgbm90IGRlcmVmZXJlbmNlIEBpbnRlcnZhbCB1bnRp
bCBAaW50ZXJ2YWwgaXMga25vd24gdG8gYmUgYSB2YWxpZCBvYmplY3QKLS0gCjIuMzguMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFp
bGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
