Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD44F6987
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:05:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4C47420FD2;
	Wed,  6 Apr 2022 21:05:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 95F78420FCC
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:05:04 +0200 (CEST)
Received: by mail-ej1-f52.google.com with SMTP id p15so6216955ejc.7
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PVR1WiZiDN1kb7YdBQvF0QqeZSGem3zHMrQcF73X4Lc=;
	b=qLl81TqYj7KzL7UIqJKrovWynPv9i9YvrVVkvOnoxFVlUcwG/sjbdtihwTOe+I6x0J
	AvYqxznOHCH4/ucJ4CilN4lN5sdk71M9YhTMRg+MedHuhoY0VVWAkFK+M4DOw06geXcM
	OHeJE+ydwDEU9HQX4v/Maz5qOgnt62yz5qb28yyldCNFBOBg/sDSC6Jlff1PlnIk6Onq
	HQHiBU0Y2UgnZ80NhbgVgpMiw238blT+ZIj0vzf9cE8r4RoEd3BaaQTsRwFwpEpFz4X8
	1Vu2KbY/K3ByXSx8GQmQAcF1jWtUidYyxJkp5WRKP/G3WhzhZ7jPDJTmv96CcykdZkEI
	TjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PVR1WiZiDN1kb7YdBQvF0QqeZSGem3zHMrQcF73X4Lc=;
	b=eiSe449GESZ5N/9906qkWBx7XlJCcHjvhz6Fqu3mq1vHrewUd1tEQxdDWF4RJJL7uc
	Wr3Jsealq8bXweYf1CCYDPqGEOaveEDcYGN5fpfc1EAqQT3bumxK2czeQIsk6OHmh4NJ
	bzif8VBi9zW+NEimmP/RuhqAbDwuL7X/OwzMvKUmUId67AgOaIVTWnL5vkOplGSZC8sC
	8iwPHNmt0lokILBUB4QtdavwCKtW8Raz4WxXsUyJIk2By9w6WgKdjvC4sYjNJY4o0Pno
	eq1R0MQeEgLAxWkXWyy372PSmzghkCm5BoBszk0iN4/QcOFbJDNwoRZj7LJ5TEwwvmxn
	dVOQ==
X-Gm-Message-State: AOAM53276cjm4JbbLTl3OguPeYS6CkKgusfO4SkHuP/u8WCFOQ53c783
	zTLH0A51TMGwT6BwSX+YGe/FCPCT
X-Google-Smtp-Source: ABdhPJzA8EL6/H38z0G1KGmEQjtYeR2zbJjBAKFQ3Wa+amzYg2FhNhCv8dTdSSlXd3LPMZPUAJa9/g==
X-Received: by 2002:a17:906:f85:b0:6d6:e97b:d276 with SMTP id
	q5-20020a1709060f8500b006d6e97bd276mr9525912ejj.431.1649271904122;
	Wed, 06 Apr 2022 12:05:04 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	o5-20020a170906974500b006dfc781498dsm6919876ejy.37.2022.04.06.12.05.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:05:03 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:04:42 +0200
Message-Id: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/3] DRBD fixes for Linux 5.18
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

QXNzb3J0bWVudCBvZiBtb3JlIHJlbGV2YW50IGZpeGVzIGZvciBEUkJEIHRvIGdvIGludG8gNS4x
OC4KCkNocmlzdG9waCBCw7ZobXdhbGRlciAoMSk6CiAgZHJiZDogc2V0IFFVRVVFX0ZMQUdfU1RB
QkxFX1dSSVRFUwoKTHYgWXVubG9uZyAoMSk6CiAgZHJiZDogRml4IGZpdmUgdXNlIGFmdGVyIGZy
ZWUgYnVncyBpbiBnZXRfaW5pdGlhbF9zdGF0ZQoKWGlhb21lbmcgVG9uZyAoMSk6CiAgZHJiZDog
Zml4IGFuIGludmFsaWQgbWVtb3J5IGFjY2VzcyBjYXVzZWQgYnkgaW5jb3JyZWN0IHVzZSBvZiBs
aXN0CiAgICBpdGVyYXRvcgoKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oICAgICAgICAg
IHwgIDggKystLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyAgICAgICAgIHwgIDcg
KystLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMgICAgICAgICAgIHwgNDEgKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlLmMgICAg
ICAgIHwgMTggKysrKystLS0tLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlX2NoYW5n
ZS5oIHwgIDggKystLS0KIDUgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMzcgZGVs
ZXRpb25zKC0pCgotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0
LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
