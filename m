Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F88555593
	for <lists+drbd-dev@lfdr.de>; Wed, 22 Jun 2022 22:57:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F898420621;
	Wed, 22 Jun 2022 22:57:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52AF3420471
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 22:57:34 +0200 (CEST)
Received: by mail-ed1-f43.google.com with SMTP id z19so8783527edb.11
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=ElFrXwSwCVPRAW+hNoFiRlLykLfaXSBn/Xpo3VMfLLk=;
	b=Efok5NV3PznOUwdj5HBUpm2llYRESRyUMgoC5pD+Wpp8dirSeZAM0D9mHNp9LkA4lL
	cnSkDRGmKIczuA/wDuTFdlJmu3SmVKE0YChzqmYSM58BjHAH16OF6pqIK9W32YqipqmX
	dI8JR8genlIiRMeCFGOCZKejLksLdnNQPfSVoZbOyY2mhSjdNFOnFBnkEMgsjZoRw7wH
	MX1u7g4TiG+btgHspYWIL12N1P5slDFrTf7PUgK2QWhtCzkyHeW7ZDtqdcS48gGglzSq
	S4cgXWD9B0D+6BhwZbvyBIr3fj5IpW85b1NKXjDZwutoxcCl0uZoOKFu7EiA/9zAMZCc
	rzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=ElFrXwSwCVPRAW+hNoFiRlLykLfaXSBn/Xpo3VMfLLk=;
	b=V82HjETByWsIcVNNdTJ31K3eODUtfec0dRhb1djdDGqaUNmCJg1HQwyRvp17dOXwqh
	4U7eqMxqcqTWbypZrUgD6aQ+LSrIcf0ciAWPGDgkWN3rJm4RfphuNtpLh5F+ArSNt5hM
	o7bDXchrpRHb8lGja4WvnxCJmJZg6LGBHF6ufjXOAQizgmz0mz1QrA0x1FlFR+4cKmG9
	qZuQX4jy4z9AL1i8N8aHF8E/0EhtrymLXrxuFNIEPzqr/k2sT2fn0HXHWuo8C4wt1avo
	EyKdpZK0vwm9hzz6sOfyXCKRmg45aa6RW8sBtMOwPt+pSmwhAnsjYa6O/oWT/AcUPb2H
	i++Q==
X-Gm-Message-State: AJIora+RlFouafRxHeBeUzU+j9JPJlf9InXEdBIPP5Bxi2jiLcP9vZkF
	FdpH9NWDGs5IqI52LUrJ1tFslX6P
X-Google-Smtp-Source: AGRyM1upVwjgt9V6koh5c+6kvyMccavSbjHn9yi1EVuTbS5UDByI2R5SzZFO798xd+xGxS7lQZCThA==
X-Received: by 2002:a05:6402:d5c:b0:435:6e2f:245b with SMTP id
	ec28-20020a0564020d5c00b004356e2f245bmr6482479edb.145.1655931453857;
	Wed, 22 Jun 2022 13:57:33 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	r17-20020a1709061bb100b00711d88ae162sm9788042ejg.24.2022.06.22.13.57.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Jun 2022 13:57:33 -0700 (PDT)
Message-ID: <0308c92a-0e10-35a4-928b-8f715a7bae44@linbit.com>
Date: Wed, 22 Jun 2022 22:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.10.0
Content-Language: en-US
To: Jiang Jian <jiangjian@cdjrlc.com>
References: <20220622155220.8704-1-jiangjian@cdjrlc.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220622155220.8704-1-jiangjian@cdjrlc.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: drbd: drbd_state: Fix typo in comments
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

QW0gMjIuMDYuMjIgdW0gMTc6NTIgc2NocmllYiBKaWFuZyBKaWFuOgo+IFJlcGxhY2UgJ2lzJyB3
aXRoICdpdCcKPiAKPiBmaWxlOiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jCj4gbGlu
ZTogMTkwMAo+IAo+ICogQnV0IGlzIGlzIHN0aWxsIG5vdCBzYXZlIHRvIGRyZWZlcmVuY2UgbGRl
diBoZXJlLCBzaW5jZQo+IAo+IGNoYW5nZWQgdG86Cj4gCj4gKiBCdXQgaXQgaXMgc3RpbGwgbm90
IHNhdmUgdG8gZHJlZmVyZW5jZSBsZGV2IGhlcmUsIHNpbmNlCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmlhbmcgSmlhbiA8amlhbmdqaWFuQGNkanJsYy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX3N0YXRlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9zdGF0ZS5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGUuYwo+IGluZGV4IDNmN2Jm
OWYyZDg3NC4uOTk5MjdjNDRmMGMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX3N0YXRlLmMKPiArKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jCj4gQEAg
LTE4OTcsNyArMTg5Nyw3IEBAIHN0YXRpYyB2b2lkIGFmdGVyX3N0YXRlX2NoKHN0cnVjdCBkcmJk
X2RldmljZSAqZGV2aWNlLCB1bmlvbiBkcmJkX3N0YXRlIG9zLAo+ICAJCWludCB3YXNfaW9fZXJy
b3IgPSAwOwo+ICAJCS8qIGNvcnJlc3BvbmRpbmcgZ2V0X2xkZXYgd2FzIGluIF9kcmJkX3NldF9z
dGF0ZSwgdG8gc2VyaWFsaXplCj4gIAkJICogb3VyIGNsZWFudXAgaGVyZSB3aXRoIHRoZSB0cmFu
c2l0aW9uIHRvIERfRElTS0xFU1MuCj4gLQkJICogQnV0IGlzIGlzIHN0aWxsIG5vdCBzYXZlIHRv
IGRyZWZlcmVuY2UgbGRldiBoZXJlLCBzaW5jZQo+ICsJCSAqIEJ1dCBpdCBpcyBzdGlsbCBub3Qg
c2F2ZSB0byBkcmVmZXJlbmNlIGxkZXYgaGVyZSwgc2luY2UKPiAgCQkgKiB3ZSBtaWdodCBjb21l
IGZyb20gYW4gZmFpbGVkIEF0dGFjaCBiZWZvcmUgbGRldiB3YXMgc2V0LiAqLwo+ICAJCWlmIChk
ZXZpY2UtPmxkZXYpIHsKPiAgCQkJcmN1X3JlYWRfbG9jaygpOwoKSSBhZ3JlZSB3aXRoIEphbWVz
IGhlcmUsIEkgZG8gbm90IHRoaW5rIHRoaXMgcHJvdmlkZXMgbXVjaCB2YWx1ZS4KCkluIGZhY3Qs
IHRoZSAqc2FtZSogbGluZSB5b3UgYXJlIGNoYW5naW5nIGNvbnRhaW5zIHR3byBtb3JlIHNwZWxs
aW5nCm1pc3Rha2VzICgic2F2ZSIgYW5kICJkcmVmZXJlbmNlIikuCgpNeSBvcGluaW9uIGlzIHRo
YXQgdHJpdmlhbCBwYXRjaGVzIGxpa2UgdGhpcyBhcmUgZmluZSBhcyBhIHN0YXJ0aW5nCnBvaW50
IGZvciBuZXcgY29udHJpYnV0b3JzLCB3aGljaCBpcyB3aHkgSSBhY2tlZCB0aGUgcHJldmlvdXMg
cGF0Y2ggZnJvbQp5b3UgZ3V5cy4gSG93ZXZlciwgaWYgd2Ugc3RhcnQgZ2V0dGluZyB0d28gb2Yg
dGhlc2UgZXZlcnkgd2VlayBpdCBqdXN0CmFkZHMgbW9yZSBtYWludGVuYW5jZSBidXJkZW4gdGhh
biBpdCdzIHdvcnRoLgoKU28gdGhhbmtzIGZvciB0aGUgY29udHJpYnV0aW9uLCBidXQgaXQncyBh
IE5BSyBmcm9tIG1lLgoKLS0gCkNocmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5n
IHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5
IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3JhZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3Rz
LmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJi
ZC1kZXYK
