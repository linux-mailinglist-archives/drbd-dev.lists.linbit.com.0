Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D636C606086
	for <lists+drbd-dev@lfdr.de>; Thu, 20 Oct 2022 14:47:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CA3F420FB8;
	Thu, 20 Oct 2022 14:47:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BDDF4206CF
	for <drbd-dev@lists.linbit.com>; Thu, 20 Oct 2022 14:47:31 +0200 (CEST)
Received: by mail-pj1-f44.google.com with SMTP id
	a6-20020a17090abe0600b0020d7c0c6650so3405616pjs.0
	for <drbd-dev@lists.linbit.com>; Thu, 20 Oct 2022 05:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=5di/z4a+vLm3ZhU2C1VbibktQruhGUphvigt45yM7Gs=;
	b=AIizJSv3xaZPzajpHIRKPbIqzQIxq0/W/tBADQe9Cizrm3sUUy6jhj4WS9s+RRBE2u
	ALHCWKn+AqhUox0/GMt0cZkyF/cWeoWrl4cNjWUnoCJ3oAM+Rnq1N/v3hXIvM9WBfX44
	5z1EKAjIklY5yqOkdyrY1hk3wG/HhXPio4rQGx07x7lj62lkZnaJWh2OCZwCr+krj7/k
	VNWw1yTbmF/AsU02I2L5WSuScbCFPp9byw5fm1RtgSE+ij7OANoQlVKAdUBmv4X7WFUz
	mpjDSK8imiHhT9Vot5/OV0kCwMPyUCcFMHY6BWORxC/aPQlBKSTEhCqBFrqDWzia3fwT
	Fdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=5di/z4a+vLm3ZhU2C1VbibktQruhGUphvigt45yM7Gs=;
	b=bmL1CwF9fKA9QB+nKzlNaePzyKVQ15rq2+uMyFAqb7uTth7hPB09mGWyJBopbtgk4j
	vQzBMPOctz16WbmGuxOnImVH+KCcLHF706AEGTo1e5FdVgJP2j1lQKcpiZBW7U/u5Ydb
	J5jMcdcXNY+rcWQvWJnv3Cp9oJGcKQCSfsx4BUQUF3obanYQvlng2dksFqzKV/8uRck9
	EH5rmSNT6drch6bQEk7rxUIa+BRVUDVMY1lTtT4RSL/aOtq5Hec6riC2J8cuJtze1KPC
	BFxEo4bmpUCo0S1eEncFbxnTNoBARSdRt6DWwM07uxFWMqGL4oaFT1Gptp8Crh9Hoo7N
	upjQ==
X-Gm-Message-State: ACrzQf1wBIscQJm3J/mYdSbNR+5HwgvqdK3JVq/1XQKmq/ZcAKLvxPmq
	4EMByprb8YqPuzim1B5TlJSjKQ==
X-Google-Smtp-Source: AMsMyM7OCpaNMLpCz8It/F7cZRmq/f0esD/nhJAaYWrzjftPI1I36so/NBrxJvjEsMdCMX3P3zkiGg==
X-Received: by 2002:a17:902:900a:b0:178:77c7:aa28 with SMTP id
	a10-20020a170902900a00b0017877c7aa28mr13741118plp.3.1666270050995;
	Thu, 20 Oct 2022 05:47:30 -0700 (PDT)
Received: from [127.0.0.1] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	m12-20020a170902768c00b00176675adbe1sm2035164pll.208.2022.10.20.05.47.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Oct 2022 05:47:30 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221020085205.129090-1-christoph.boehmwalder@linbit.com>
References: <20221020085205.129090-1-christoph.boehmwalder@linbit.com>
Message-Id: <166627004940.161439.4764263813482729420.b4-ty@kernel.dk>
Date: Thu, 20 Oct 2022 05:47:29 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-d9ed3
Cc: linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2] drbd: only clone bio if we have a backing
	device
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

T24gVGh1LCAyMCBPY3QgMjAyMiAxMDo1MjowNSArMDIwMCwgQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IHdyb3RlOgo+IENvbW1pdCBjMzQ3YTc4N2UzNGNiIChkcmJkOiBzZXQgLT5iaV9iZGV2IGluIGRy
YmRfcmVxX25ldykgbW92ZWQgYQo+IGJpb19zZXRfZGV2IGNhbGwgKHdoaWNoIGhhcyBzaW5jZSBi
ZWVuIHJlbW92ZWQpIHRvICJlYXJsaWVyIiwgZnJvbQo+IGRyYmRfcmVxdWVzdF9wcmVwYXJlIHRv
IGRyYmRfcmVxX25ldy4KPiAKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoaXMgYWNjZXNzZXMgZGV2
aWNlLT5sZGV2LT5iYWNraW5nX2JkZXYsIHdoaWNoIGlzCj4gbm90IE5VTEwtY2hlY2tlZCBhdCB0
aGlzIHBvaW50LiBXaGVuIHdlIGRvbid0IGhhdmUgYW4gbGRldiAoaS5lLiB3aGVuCj4gdGhlIERS
QkQgZGV2aWNlIGlzIGRpc2tsZXNzKSwgdGhpcyBsZWFkcyB0byBhIG51bGwgcG9pbnRlciBkZXJl
Zi4KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvMV0gZHJiZDogb25seSBjbG9uZSBi
aW8gaWYgd2UgaGF2ZSBhIGJhY2tpbmcgZGV2aWNlCiAgICAgIGNvbW1pdDogNmQ0MmRkZjdmMjdi
NjcyMzU0OWVlNmQ0YzhiMWI0MThiNTliZjZiNQoKQmVzdCByZWdhcmRzLAotLSAKSmVucyBBeGJv
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQt
ZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMu
bGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
