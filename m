Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0564AD5DE
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Feb 2022 11:55:44 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 386614201E1;
	Tue,  8 Feb 2022 11:55:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5DD874201E1
	for <drbd-dev@lists.linbit.com>; Tue,  8 Feb 2022 11:55:42 +0100 (CET)
Received: by mail-pf1-f182.google.com with SMTP id p43so637820pfw.1
	for <drbd-dev@lists.linbit.com>; Tue, 08 Feb 2022 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:subject:to:cc:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=sWE38xa95W+xhxHgrq7WzsZ2vv/Ie+VkpJNorAGjDbg=;
	b=pl2KrerUPO7MVE2mHCZefx2Cu4UZm40ckE4roweTe44c4Ba20GwJgU1rTKso9u6o2M
	Kj3sbpYEtJt4vQQewuqFXCPntHNfgIjnnjOGwmasAEudNDqcpfQ+kkfBlpHs2u5eVDM9
	2o7krHmcBdbWj5VIOdLbo+N8O+Oo4bslLwDmrHVgLP76c1DSwPNr60Q4iLlxUqaMVl8x
	sYhks3hdQEVr0uo7ZQW+08cLx9omr0tfW1W3mxhZZlix82+kKoKxjYaiylZKwt5u6BZm
	nv70sxkFlTdmMcEC8Ds+KF9wMOruXjUJ/onhU0oV7Bx6J7F7/3x1pPT41IFJwRO2m8WC
	bKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=sWE38xa95W+xhxHgrq7WzsZ2vv/Ie+VkpJNorAGjDbg=;
	b=WfpgFttA/U/PmmHxg1sFYTc7BaGPn+0Reu2w/a0INVAxsXWdd/8oPqYGTg7l7yp0wt
	RteIqDNtbnAh/E+crckeL0GJC4ye69O2tc3bP/xzPyS/2NU3EEL77uWe00NLxBmFMvQ3
	wh+epH1B0DUodiJQYTIcgZBxFY0aOxyncuUlp5P6kIhQUJfVZs4JSbFeYeZzOby8fq/d
	gkJNNopj2Wx13aovmAXo1BvSzopt3wLewQzSAd59vbYnZc2W1z1aTeJpz6sigE6Kd0CJ
	k/fjfDawVvZKD02bIU0hbDYHBa9Mivcv5h64O6sc/TGas523Tje3+bHP6+NA1fh9w+lu
	55gg==
X-Gm-Message-State: AOAM533CyKQVVO5YH6j08J8GNn6fdel4pHVA0WEg/EJJnsWzqrxu8duj
	dVImBkp6NXP2+QCMlUstYxhSpMI/MHU=
X-Google-Smtp-Source: ABdhPJzDfm/XaP31aWpiNpsnafHmrMc0SBrpe7htyOBDrSByBdrMOLx1+2RuXa1fzkZlUAECj3XIAw==
X-Received: by 2002:a05:6a00:c94:: with SMTP id
	a20mr3833402pfv.41.1644317741126; 
	Tue, 08 Feb 2022 02:55:41 -0800 (PST)
Received: from [192.168.1.100] ([166.111.139.99])
	by smtp.gmail.com with ESMTPSA id
	lk8sm2489742pjb.40.2022.02.08.02.55.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 08 Feb 2022 02:55:40 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, axboe@kernel.dk
Message-ID: <3b992e3b-bf1a-426a-5e76-a822f5bf6e6a@gmail.com>
Date: Tue, 8 Feb 2022 18:55:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-block@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [BUG] block: drbd: possible deadlocks involving waiting
 and locking operations
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

SGVsbG8sCgpNeSBzdGF0aWMgYW5hbHlzaXMgdG9vbCByZXBvcnRzIHRocmVlIHBvc3NpYmxlIGRl
YWRsb2NrcyBpbiB0aGUgZHJiZCAKZHJpdmVyIGluIExpbnV4IDUuMTY6CgojQlVHIDEKZHJiZF9h
ZG1fYXR0YWNoKCkKIMKgIG11dGV4X2xvY2soJmFkbV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7
IC0tPiBMaW5lIDE4MTAgKExvY2sgQSkKIMKgIHdhaXRfZXZlbnQoZGV2aWNlLT5taXNjX3dhaXQs
IC4uLik7IC0tPiBMaW5lIDE4MjQgKFdhaXQgWCkKCmRyYmRfYWRtX2Rpc2tfb3B0cygpCiDCoCBt
dXRleF9sb2NrKCZhZG1fY3R4LnJlc291cmNlLT5hZG1fbXV0ZXgpOyAtLT4gTGluZSAxNTgyIChM
b2NrIEEpCiDCoCBnZXRfbGRldigpCiDCoMKgwqAgZ2V0X2xkZXZfaWZfc3RhdGUoKQogwqDCoMKg
wqDCoCBfZ2V0X2xkZXZfaWZfc3RhdGUoKQogwqDCoMKgwqDCoMKgwqAgcHV0X2xkZXYoKQogwqDC
oMKgwqDCoMKgwqDCoMKgIHdha2VfdXAoJmRldmljZS0+bWlzY193YWl0KTsgLS0+IExpbmUgMjEw
OCAoV2FrZSBYKQoKI0JVRyAyCmRyYmRfYWRtX2ludmFsaWRhdGUoKQogwqAgbXV0ZXhfbG9jaygm
YWRtX2N0eC5yZXNvdXJjZS0+YWRtX211dGV4KTsgLS0+IExpbmUgMzAyNCAoTG9jayBBKQogwqAg
d2FpdF9ldmVudChkZXZpY2UtPm1pc2Nfd2FpdCwgLi4uKTsgLS0+IExpbmUgMzAzMCAoV2FpdCBY
KQoKZHJiZF9hZG1fZGlza19vcHRzKCkKIMKgIG11dGV4X2xvY2soJmFkbV9jdHgucmVzb3VyY2Ut
PmFkbV9tdXRleCk7IC0tPiBMaW5lIDE1ODIgKExvY2sgQSkKIMKgIGdldF9sZGV2KCkKIMKgwqDC
oCBnZXRfbGRldl9pZl9zdGF0ZSgpCiDCoMKgwqDCoMKgIF9nZXRfbGRldl9pZl9zdGF0ZSgpCiDC
oMKgwqDCoMKgwqDCoCBwdXRfbGRldigpCiDCoMKgwqDCoMKgwqDCoMKgwqAgd2FrZV91cCgmZGV2
aWNlLT5taXNjX3dhaXQpOyAtLT4gTGluZSAyMTA4IChXYWtlIFgpCgojQlVHIDMKZHJiZF9hZG1f
aW52YWxpZGF0ZV9wZWVyKCkKIMKgIG11dGV4X2xvY2soJmFkbV9jdHgucmVzb3VyY2UtPmFkbV9t
dXRleCk7IC0tPiBMaW5lIDMxMDEgKExvY2sgQSkKIMKgIHdhaXRfZXZlbnQoZGV2aWNlLT5taXNj
X3dhaXQsIC4uLik7IC0tPiBMaW5lIDMxMDcgKFdhaXQgWCkKCmRyYmRfYWRtX2Rpc2tfb3B0cygp
CiDCoCBtdXRleF9sb2NrKCZhZG1fY3R4LnJlc291cmNlLT5hZG1fbXV0ZXgpOyAtLT4gTGluZSAx
NTgyIChMb2NrIEEpCiDCoCBnZXRfbGRldigpCiDCoMKgwqAgZ2V0X2xkZXZfaWZfc3RhdGUoKQog
wqDCoMKgwqDCoCBfZ2V0X2xkZXZfaWZfc3RhdGUoKQogwqDCoMKgwqDCoMKgwqAgcHV0X2xkZXYo
KQogwqDCoMKgwqDCoMKgwqDCoMKgIHdha2VfdXAoJmRldmljZS0+bWlzY193YWl0KTsgLS0+IExp
bmUgMjEwOCAoV2FrZSBYKQoKV2hlbiBkcmJkX2FkbV9hdHRhY2goKS9kcmJkX2FkbV9pbnZhbGlk
YXRlKCkvZHJiZF9hZG1faW52YWxpZGF0ZV9wZWVyKCkgCmlzIGV4ZWN1dGVkLCAiV2FpdCBYIiBp
cyBwZXJmb3JtZWQgYnkgaG9sZGluZyAiTG9jayBBIi4gSWYgCmRyYmRfYWRtX2Rpc2tfb3B0cygp
IGlzIGV4ZWN1dGVkIGF0IHRoaXMgdGltZSwgYmVjYXVzZSAiTG9jayBBIiBoYXMgYmVlbiAKYWxy
ZWFkeSBoZWxkLCAiV2FrZSBYIiBjYW5ub3QgYmUgcGVyZm9ybWVkIHRvIHdha2UgdXAgIldhaXQg
WCIsIGNhdXNpbmcgCnBvc3NpYmxlIGRlYWRsb2Nrcy4KCkkgYW0gbm90IHF1aXRlIHN1cmUgd2hl
dGhlciB0aGVzZSBwb3NzaWJsZSBwcm9ibGVtcyBhcmUgcmVhbC4KQW55IGZlZWRiYWNrIHdvdWxk
IGJlIGFwcHJlY2lhdGVkLCB0aGFua3MgOikKCkJlc3Qgd2lzaGVzLApKaWEtSnUgQmFpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
