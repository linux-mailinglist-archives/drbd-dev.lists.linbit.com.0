Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E744F699D
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:10:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E181420FF6;
	Wed,  6 Apr 2022 21:10:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7971D420FE1
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:07:39 +0200 (CEST)
Received: by mail-ed1-f44.google.com with SMTP id g20so3798319edw.6
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x6Z98lJKXuS91zE/lsKZc5fIxCcxTcDsBFNfuGVittc=;
	b=eo1ARq8XmDt4WJEG0fNRv1dh9ZyUYCvrTijwHC867kmZU3IKD5dL6KdP6iczPp7pQy
	tnHgSGg3MfdBTqOVO2b3wHz1Z1mFb8Wy98zw0SLKqmDjHRE/4/DbCsgTBy7NOY5paS8p
	nijBU4Ij7aZfaQxXvIOGZwEYAEJTEbOiT2lyhnYGBEja+bnssGEBiy65Dw46FE2/H9UV
	imNJlRPrr05hmPE64cmvbNhcIp4UPW+Qk3Y1ciKA1Tx83BjewM3t9IBYibMz3dVMHHKn
	uH8gkqbRDc2yw+GEAn0188l22b0ZHzaEI+RGp7WxxHsGJ5OBspo1dMpXv1v3j5kAjIoG
	nv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x6Z98lJKXuS91zE/lsKZc5fIxCcxTcDsBFNfuGVittc=;
	b=p8MAJ+29nAtBw4qhA0W9NNvWKjsC/e9TSXDiBJCLgd5cVKaQKQQMp8L2srquEk1Txk
	sUF7hZ/ChNq3H03pM2vDQJzDkGuDKTlj9AfHxLdklv1PDCf8PE5bXHCLTOHeWKRC3TiD
	Ez6MLgc0DU3lH2W5/FE6PFFusrOh+zITWtq3KQnYZO6Rufn53/AMY98HyuFIzQu5gTfg
	/B1lhxYvy8dY/BDgxu2f4g43ljOlvBpoxL8oAMF5JEbkZ2oVvhshee0z0BT081YDjtJ7
	r1oZTtvzQ9inXod5xkkD8e7Km54mVxH2PKL5cG4D9ubCHTEiRPDJIDmAW2OEqtT66zP7
	wLPg==
X-Gm-Message-State: AOAM532qqQBDgqsg+H6VbUedRBFZROepeA0ZlmJtTOFErRJff9m/+NVi
	0LQQNujOx/tRyPlD2RanYMrd3hpk
X-Google-Smtp-Source: ABdhPJziYZNh8lETm/Afxn5OVMjYG1YbWRgvE9PR7ajZDuxwzBFio8OijpeIWLus8bx4HMB+EFR/ag==
X-Received: by 2002:a05:6402:430d:b0:419:45cd:7ab1 with SMTP id
	m13-20020a056402430d00b0041945cd7ab1mr10233378edc.367.1649272059049;
	Wed, 06 Apr 2022 12:07:39 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	gg7-20020a170906e28700b006e73ac96f99sm4886409ejb.224.2022.04.06.12.07.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:07:38 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:07:15 +0200
Message-Id: <20220406190715.1938174-8-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
References: <20220406190715.1938174-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Haowen Bai <baihaowen@meizu.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 7/7] drbd: Return true/false (not 1/0) from bool
	functions
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

RnJvbTogSGFvd2VuIEJhaSA8YmFpaGFvd2VuQG1laXp1LmNvbT4KClJldHVybiBib29sZWFuIHZh
bHVlcyAoInRydWUiIG9yICJmYWxzZSIpIGluc3RlYWQgb2YgMSBvciAwIGZyb20gYm9vbApmdW5j
dGlvbnMuICBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3MgZnJvbSBjb2NjaWNoZWNr
OgoKLi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZXEuYzo5MTI6OS0xMDogV0FSTklORzogcmV0
dXJuIG9mIDAvMSBpbgpmdW5jdGlvbiAncmVtb3RlX2R1ZV90b19yZWFkX2JhbGFuY2luZycgd2l0
aCByZXR1cm4gdHlwZSBib29sCgpTaWduZWQtb2ZmLWJ5OiBIYW93ZW4gQmFpIDxiYWloYW93ZW5A
bWVpenUuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGgu
Ym9laG13YWxkZXJAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZXEu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfcmVxLmMKaW5kZXggNzViZTBlMTY3NzBhLi5lNjRiY2ZiYTMwZWYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlcS5jCisrKyBiL2RyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3JlcS5jCkBAIC05MjIsNyArOTIyLDcgQEAgc3RhdGljIGJvb2wgcmVtb3RlX2R1
ZV90b19yZWFkX2JhbGFuY2luZyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgc2VjdG9yX3Qg
c2UKIAogCXN3aXRjaCAocmJtKSB7CiAJY2FzZSBSQl9DT05HRVNURURfUkVNT1RFOgotCQlyZXR1
cm4gMDsKKwkJcmV0dXJuIGZhbHNlOwogCWNhc2UgUkJfTEVBU1RfUEVORElORzoKIAkJcmV0dXJu
IGF0b21pY19yZWFkKCZkZXZpY2UtPmxvY2FsX2NudCkgPgogCQkJYXRvbWljX3JlYWQoJmRldmlj
ZS0+YXBfcGVuZGluZ19jbnQpICsgYXRvbWljX3JlYWQoJmRldmljZS0+cnNfcGVuZGluZ19jbnQp
OwotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRw
czovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
