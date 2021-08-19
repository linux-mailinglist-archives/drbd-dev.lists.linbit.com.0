Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 544383F19D0
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Aug 2021 14:54:24 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BBAC42060A;
	Thu, 19 Aug 2021 14:54:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CF9E4202FF
	for <drbd-dev@lists.linbit.com>; Thu, 19 Aug 2021 11:31:10 +0200 (CEST)
Received: by mail-pf1-f182.google.com with SMTP id m26so4934677pff.3
	for <drbd-dev@lists.linbit.com>; Thu, 19 Aug 2021 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=TD555ToQ7cZoDLrsFaWX+rKTsvPUaPbTlrb7wj9mN80=;
	b=uae6j5z2fYdUHB09jUyx6mGb6+vwA8vC3enxMHz5jS5429LZodtoKDe26vRjxKOMS1
	uc09m8WGq0hkh1F6/j/oeG8Zdj8JYYTcx1bhwuEbxa+j2mjxnfYSMy1AYRFmxPGlIXOT
	dyw9N9r+2X0AJLenQyE+peiEiyndWDhcY9aiJrt7pmShCjfdqA785rMa0UUeTUUmxzcP
	PPAGFxFyTkWbJj2LdySrhMiCj97905tO0YtsW9iJV+nfJYohhY5nFgvmALfZZOZf6IeZ
	CIndsfuKiE4OEu36bWS893BIIRnvJ74gaVA2fIksBxMpx0E9YnoWGb+RjQ9y2MnDgXG2
	th9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=TD555ToQ7cZoDLrsFaWX+rKTsvPUaPbTlrb7wj9mN80=;
	b=YXitTDad8YfXzwUTvix+/8w/sOkWJLIt7BUVRQs8KVds/iZGmONYNYuu8VJGMKlHNR
	9FborFk3mGCQULaKzU4tBOEadISewGgI6trV78LQDplO/o+MehR8AS8edr2iPoRObBfd
	20jBg7sBfu6Wa/8mZlTore2sQ6SUvhaCZbxr4QW/7D2kNWKGHJfM7UNCR4Sy4iLGP1w8
	9FU4bCFHuVSeLLXEL69qUI4Nc5rHfMqYoIiYYLgffdeGzqrcObZjjua6QRDWECd1+Ej9
	y2lwCyKh4S2ZBFBczXvoLvd0JkXkp3AR+jdd63eNzGrK+T4KFqBxRMI0onP3e8m+53wF
	Zjhw==
X-Gm-Message-State: AOAM5331+MvOrQv8+MUwv+68QM4gsv/msfYbhU9JH7jnLzD60GiI+zny
	/JgY1R46tWFji1uZKEhi+SY=
X-Google-Smtp-Source: ABdhPJwLhUpHhOzjgyGvwPAuNAhAfzZkmXEns11qhy89P72cp+Q5tTX74RDjS/M/frd/KzWLI+pLfg==
X-Received: by 2002:a62:76d0:0:b0:3e3:42d6:c735 with SMTP id
	r199-20020a6276d0000000b003e342d6c735mr958707pfc.32.1629365469368;
	Thu, 19 Aug 2021 02:31:09 -0700 (PDT)
Received: from [10.133.0.42] ([85.203.23.237])
	by smtp.gmail.com with ESMTPSA id n18sm2737978pfu.3.2021.08.19.02.31.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Aug 2021 02:31:08 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	Jens Axboe <axboe@kernel.dk>
Message-ID: <f425ae14-8857-28d7-a27a-d25da83e1bd6@gmail.com>
Date: Thu, 19 Aug 2021 17:31:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 19 Aug 2021 14:54:21 +0200
Cc: linux-block@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [BUG] block: drbd: four possible ABBA deadlocks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

SGVsbG8sCgpNeSBzdGF0aWMgYW5hbHlzaXMgdG9vbCByZXBvcnRzIGZvdXIgcG9zc2libGUgQUJC
QSBkZWFkbG9ja3MgaW4gdGhlIGRyYmQgCmRyaXZlcnMgaW4gTGludXggNS4xMDoKCiMjIyBEZWFk
bG9jayBBICMjIwp3X2FmdGVyX2Nvbm5fc3RhdGVfY2goKQogwqAgbXV0ZXhfbG9jaygmY29ubmVj
dGlvbi0+cmVzb3VyY2UtPmNvbmZfdXBkYXRlKTsgLS0+IGxpbmUgMjA2NQogwqAgY29ubl9mcmVl
X2NyeXB0bygpCiDCoMKgwqAgZHJiZF9mcmVlX3NvY2soKQogwqDCoMKgwqDCoCBkcmJkX2ZyZWVf
b25lX3NvY2soJmNvbm5lY3Rpb24tPmRhdGEpCiDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZk
cy0+bXV0ZXgpOyAtLT4gbGluZSAyOTY3CgpkcmJkX2FkbV9uZXRfb3B0cygpCiDCoCBtdXRleF9s
b2NrKCZjb25uZWN0aW9uLT5kYXRhLm11dGV4KTsgLS0+IGxpbmUgMjQ0NQogwqAgbXV0ZXhfbG9j
aygmY29ubmVjdGlvbi0+cmVzb3VyY2UtPmNvbmZfdXBkYXRlKTsgLS0+IGxpbmUgMjQ0NgoKV2hl
biB3X2FmdGVyX2Nvbm5fc3RhdGVfY2goKSBhbmQgZHJiZF9hZG1fbmV0X29wdHMoKSBhcmUgY29u
Y3VycmVudGx5IApleGVjdXRlZCwgdGhlIGRlYWRsb2NrIGNhbiBvY2N1ci4KCiMjIyBEZWFkbG9j
ayBCICMjIwpkcmJkX2FkbV9jb25uZWN0KCkKIMKgIG11dGV4X2xvY2soJmFkbV9jdHgucmVzb3Vy
Y2UtPmNvbmZfdXBkYXRlKTsgLS0+IGxpbmUgMjY0NAogwqAgY29ubl9mcmVlX2NyeXB0bygpCiDC
oMKgwqAgZHJiZF9mcmVlX29uZV9zb2NrKCZjb25uZWN0aW9uLT5kYXRhKQogwqDCoMKgwqDCoCBt
dXRleF9sb2NrKCZkcy0+bXV0ZXgpOyAtLT4gbGluZSAyOTY3CgpkcmJkX2FkbV9uZXRfb3B0cygp
CiDCoCBtdXRleF9sb2NrKCZjb25uZWN0aW9uLT5kYXRhLm11dGV4KTsgLS0+IGxpbmUgMjQ0NQog
wqAgbXV0ZXhfbG9jaygmY29ubmVjdGlvbi0+cmVzb3VyY2UtPmNvbmZfdXBkYXRlKTsgLS0+IGxp
bmUgMjQ0NgoKV2hlbiBkcmJkX2FkbV9jb25uZWN0KCkgYW5kIGRyYmRfYWRtX25ldF9vcHRzKCkg
YXJlIGNvbmN1cnJlbnRseSAKZXhlY3V0ZWQsIHRoZSBkZWFkbG9jayBjYW4gb2NjdXIuCgojIyMg
RGVhZGxvY2sgQyAjIyMKd19hZnRlcl9jb25uX3N0YXRlX2NoKCkKIMKgIG11dGV4X2xvY2soJmNv
bm5lY3Rpb24tPnJlc291cmNlLT5jb25mX3VwZGF0ZSk7IC0tPiBsaW5lIDIwNjUKIMKgIGNvbm5f
ZnJlZV9jcnlwdG8oKQogwqDCoMKgIGRyYmRfZnJlZV9zb2NrKCkKIMKgwqDCoMKgwqAgZHJiZF9m
cmVlX29uZV9zb2NrKCZjb25uZWN0aW9uLT5kYXRhKQogwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9j
aygmZHMtPm11dGV4KTsgLS0+IGxpbmUgMjk2NwoKcmVjZWl2ZV9wcm90b2NvbCgpCiDCoCBtdXRl
eF9sb2NrKCZjb25uZWN0aW9uLT5kYXRhLm11dGV4KTsgLS0+IGxpbmUgMzc3OAogwqAgbXV0ZXhf
bG9jaygmY29ubmVjdGlvbi0+cmVzb3VyY2UtPmNvbmZfdXBkYXRlKTsgLS0+IGxpbmUgMzc3OQoK
V2hlbiB3X2FmdGVyX2Nvbm5fc3RhdGVfY2goKSBhbmQgcmVjZWl2ZV9wcm90b2NvbCgpIGFyZSBj
b25jdXJyZW50bHkgCmV4ZWN1dGVkLCB0aGUgZGVhZGxvY2sgY2FuIG9jY3VyLgoKIyMjIERlYWRs
b2NrIEQgIyMjCmRyYmRfYWRtX2Nvbm5lY3QoKQogwqAgbXV0ZXhfbG9jaygmYWRtX2N0eC5yZXNv
dXJjZS0+Y29uZl91cGRhdGUpOyAtLT4gbGluZSAyNjQ0CiDCoCBjb25uX2ZyZWVfY3J5cHRvKCkK
IMKgwqDCoCBkcmJkX2ZyZWVfb25lX3NvY2soJmNvbm5lY3Rpb24tPmRhdGEpCiDCoMKgwqDCoMKg
IG11dGV4X2xvY2soJmRzLT5tdXRleCk7IC0tPiBsaW5lIDI5NjcKCnJlY2VpdmVfcHJvdG9jb2wo
KQogwqAgbXV0ZXhfbG9jaygmY29ubmVjdGlvbi0+ZGF0YS5tdXRleCk7IC0tPiBsaW5lIDM3NzgK
IMKgIG11dGV4X2xvY2soJmNvbm5lY3Rpb24tPnJlc291cmNlLT5jb25mX3VwZGF0ZSk7IC0tPiBs
aW5lIDM3NzkKCldoZW4gZHJiZF9hZG1fY29ubmVjdCgpIGFuZCByZWNlaXZlX3Byb3RvY29sKCkg
YXJlIGNvbmN1cnJlbnRseSAKZXhlY3V0ZWQsIHRoZSBkZWFkbG9jayBjYW4gb2NjdXIuCgpJIGFt
IG5vdCBxdWl0ZSBzdXJlIHdoZXRoZXIgdGhlc2UgcG9zc2libGUgZGVhZGxvY2tzIGFyZSByZWFs
IGFuZCBob3cgdG8gCmZpeCB0aGVtIGlmIHRoZXkgYXJlIHJlYWwuCkFueSBmZWVkYmFjayB3b3Vs
ZCBiZSBhcHByZWNpYXRlZCwgdGhhbmtzCgpSZXBvcnRlZC1ieTogVE9URSBSb2JvdCA8b3NsYWJA
dHNpbmdodWEuZWR1LmNuPgoKCkJlc3Qgd2lzaGVzLApKaWEtSnUgQmFpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApk
cmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RyYmQtZGV2Cg==
