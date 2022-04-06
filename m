Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E44F6996
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:09:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48B8C420FEC;
	Wed,  6 Apr 2022 21:09:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 65DB2420FCC
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:34 +0200 (CEST)
Received: by mail-ej1-f45.google.com with SMTP id qh7so6177766ejb.11
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0vcoWpko5M6BsO9WO6BZaEztSvAjnr2wIhZH0Y0nwWU=;
	b=mi8paDeGJ9FgOE5KAUIYIDlCD6t9WRIXW8Zbxzongj6zFKj7quoAet0fhWDUc5SmZZ
	xayddIqSEyI7Dea/HQIrpqGu5yheJHlfO1suXNQxYPDr5klhiDG31V04CeBKUxei7+ca
	0uTdz7MsCQGNpsEQ70paHowFP/DBIK5J6Fj6tWvzXh/hUpmCtlYstrUvlG+Xi7Rdloz/
	N3iDKbQcXbxEI5pj/fUur06ak9ZOnuD6GrGbyxTMSB+111T9S1hz1sv8/cNJS7W1FVSm
	rbKM2LzDMGzWgcX65SRXCJqlKq3vguzKAH5r7POFaeMyJ13qps80aqz+e8GmhQpmmike
	4C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0vcoWpko5M6BsO9WO6BZaEztSvAjnr2wIhZH0Y0nwWU=;
	b=f+940fXsgHX42PTjIZtbcUE8mPzbA+3317eDB4gFbouHQ8tZXHr6AjRzirsx5dtvzD
	m05GaWju3F6Ri1Cyd2XgJzZhs7p/b21pDgqpwVhGn8LE78npE3o36y3WvJbL2o7lrxZc
	4mBdAJFW3rhVanE5aMOV5S/mNvblD6supXEdySgh9y0Z02sYpiBErIuMCnj7tFMTm5HF
	rpxMmI7ZL1aQJkJtbPC+FC+pK6J/715ceszvrRLPTIx0wYibeNYr1tA04F8bsDDlhz3v
	LIQ4B4c8h+5hwAJyzGAdSbgnaFF5y24ipB1fcEewAYvYMSHa7NQphk7/LckzpiFicidV
	gebQ==
X-Gm-Message-State: AOAM5331BH4cYH42WSvQDCSihx2LEf7Ze4VEy93Wd7nbm8TETt89LVzJ
	8HDyPE1LjuiMEb7to1VMFHxUy/Gs
X-Google-Smtp-Source: ABdhPJwS75mCEvIsWowddkngt4NmRn8+jLBJvmrzPpQ7wLwXC5KAdkj6Vik6DmpRxwMlJAQJjznehg==
X-Received: by 2002:a17:907:6da3:b0:6e6:ec5e:c2f7 with SMTP id
	sb35-20020a1709076da300b006e6ec5ec2f7mr9677283ejc.309.1649272053940;
	Wed, 06 Apr 2022 12:07:33 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	n5-20020a1709065e0500b006e4dae9b1besm6503475eju.145.2022.04.06.12.07.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:33 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:11 +0200
Message-Id: <20220406190715.1938174-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/7] block: drbd: drbd_receiver: Remove redundant
	assignment to err
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

RnJvbTogSmlhcGVuZyBDaG9uZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4KClZh
cmlhYmxlIGVyciBpcyBzZXQgdG8gJy1FSU8nIGJ1dCB0aGlzIHZhbHVlIGlzIG5ldmVyIHJlYWQg
YXMKaXQgaXMgb3ZlcndyaXR0ZW4gb3Igbm90IHVzZWQgbGF0ZXIgb24sIGhlbmNlIGl0IGlzIGEg
cmVkdW5kYW50CmFzc2lnbm1lbnQgYW5kIGNhbiBiZSByZW1vdmVkLgoKQ2xlYW4gdXAgdGhlIGZv
bGxvd2luZyBjbGFuZy1hbmFseXplciB3YXJuaW5nOgoKZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
cmVjZWl2ZXIuYzozOTU1OjU6IHdhcm5pbmc6IFZhbHVlIHN0b3JlZCB0bwonZXJyJyBpcyBuZXZl
ciByZWFkIFtjbGFuZy1hbmFseXplci1kZWFkY29kZS5EZWFkU3RvcmVzXS4KClJlcG9ydGVkLWJ5
OiBBYmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEpp
YXBlbmcgQ2hvbmcgPGppYXBlbmcuY2hvbmdAbGludXguYWxpYmFiYS5jb20+CkFja2VkLWJ5OiBD
aHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgot
LS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgfCAxIC0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
cmVjZWl2ZXIuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKaW5kZXggMDhk
YTkyMmY4MWQxLi45MTFjMjY3NTM1NTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX3JlY2VpdmVyLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwpA
QCAtMzkwMyw3ICszOTAzLDYgQEAgc3RhdGljIGludCByZWNlaXZlX1N5bmNQYXJhbShzdHJ1Y3Qg
ZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uLCBzdHJ1Y3QgcGFja2V0X2kKIAkJCQlkcmJkX2Vy
cihkZXZpY2UsICJ2ZXJpZnktYWxnIG9mIHdyb25nIHNpemUsICIKIAkJCQkJInBlZXIgd2FudHMg
JXUsIGFjY2VwdGluZyBvbmx5IHVwIHRvICV1IGJ5dGVcbiIsCiAJCQkJCWRhdGFfc2l6ZSwgU0hB
UkVEX1NFQ1JFVF9NQVgpOwotCQkJCWVyciA9IC1FSU87CiAJCQkJZ290byByZWNvbm5lY3Q7CiAJ
CQl9CiAKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20K
aHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
