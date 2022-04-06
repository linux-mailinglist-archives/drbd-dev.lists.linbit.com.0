Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA54F5A11
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 11:32:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B577420FC7;
	Wed,  6 Apr 2022 11:32:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1508D420FBB
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 11:32:11 +0200 (CEST)
Received: by mail-ed1-f43.google.com with SMTP id p23so1872079edi.8
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:references:cc:from:in-reply-to:content-transfer-encoding;
	bh=HPMmkcw3ad6froN4Uu8+fNEoD64IPnc5ZGiMrl26DPM=;
	b=fTpJjsBLJ/+L6EP7MX9IxjIh8OJGxonHiounyuu38lvEMIBMhAPvWT37Ne1LeByA3G
	af7pWhKfAU0bGt/HLhAb1mcrO7G6SXlZ9GksLDrjLrIhuPHpSE/DHn2cWpyhxmICNKmV
	AvqKGqvQgcj+WzHPGqzEabJbXRFjk2Rhw9p4evOhLkmhlSxsIB4xvv7bRglhTmhWtAyk
	VAOp2XIf8H6DDRAF5YFXaLcpD8KnsJGWrm23qMGnvj3XjVRx8PtSR9nhBYrHRCveBIhL
	m/rTRI/M1se+T1jh+c6P53VvM6n8Sth3KvZ2jHrKP/jEtEbn2FvOU7Rs59Pm3Q13ylP4
	mBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:cc:from:in-reply-to
	:content-transfer-encoding;
	bh=HPMmkcw3ad6froN4Uu8+fNEoD64IPnc5ZGiMrl26DPM=;
	b=kce8A1omqsS4dtWg6ek6rEqh4fWouVCOiDGmZry/sFIty2j/+3lAhotpVmc4MLRIej
	VcmfV2DNWtRFqlBxpcPmVv4E8bnaXj3j4zI1FgVPYqxfbhoSoSReCeI/P1LfcfgvRPiV
	aH7ozdPLilv6DwNSYyCna9Bp83z8jCX9Ci9G9n4ReTHoKwgE0+fq8AxGo13uXqor4IFo
	CQjzfF8eIsxoFc/dkheFO2pjlLY7e+3UPPcLbGel5z1qnS/3oIX7HytFl5WA48+7XQNC
	Z8HmWcM43SN4QYUaj21RVjycHWQxiwPKT3f9cbODt9qzNrjQcXOaq1os4plWhJsZ6+AX
	JaaQ==
X-Gm-Message-State: AOAM531PJQberh7anIDBAiAjaBMprE8aobzRtOSmWt7Is8A0DHZzX4Vu
	c2uvZ+FAzzGuNj3CSUZztkS5VVW3
X-Google-Smtp-Source: ABdhPJxEZipVSp/jLRjgfkTXOza1SLmWA+gBYr7e8P6WbfE06/HkOUuOCsPtCg+3bkoBdxmqnQQMJg==
X-Received: by 2002:a50:a408:0:b0:41c:cdc7:88bd with SMTP id
	u8-20020a50a408000000b0041ccdc788bdmr7735003edb.399.1649237531719;
	Wed, 06 Apr 2022 02:32:11 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	n27-20020a1709062bdb00b006da975173bfsm6475424ejg.170.2022.04.06.02.32.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 02:32:11 -0700 (PDT)
Message-ID: <b6d79d64-dbea-4fbf-be91-d80bd3b9cd22@linbit.com>
Date: Wed, 6 Apr 2022 11:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
	<20220406060516.409838-17-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220406060516.409838-17-hch@lst.de>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 16/27] drbd: use bdev_alignment_offset
 instead of queue_alignment_offset
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

QW0gMDYuMDQuMjIgdW0gMDg6MDUgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBUaGUgYmRl
diB2ZXJzaW9uIGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGZvciBwYXJ0aXRpb25zLCBzbyB1c2UgdGhh
dC4KPiAKPiBGaXhlczogOTEwNGQzMWE3NTlmICgiZHJiZDogaW50cm9kdWNlIFdSSVRFX1NBTUUg
c3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X21haW4uYwo+IGluZGV4IGQyMGQ4NGVlN2E4OGUuLjlkNDNhYWRkZTE5YWQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbWFpbi5jCj4gQEAgLTkzOSw3ICs5MzksNyBAQCBpbnQgZHJiZF9zZW5kX3NpemVz
KHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdnZXJfcmVwbHks
IGVudQo+ICAJCXAtPnFsaW0tPmxvZ2ljYWxfYmxvY2tfc2l6ZSA9Cj4gIAkJCWNwdV90b19iZTMy
KGJkZXZfbG9naWNhbF9ibG9ja19zaXplKGJkZXYpKTsKPiAgCQlwLT5xbGltLT5hbGlnbm1lbnRf
b2Zmc2V0ID0KPiAtCQkJY3B1X3RvX2JlMzIocXVldWVfYWxpZ25tZW50X29mZnNldChxKSk7Cj4g
KwkJCWNwdV90b19iZTMyKGJkZXZfYWxpZ25tZW50X29mZnNldChiZGV2KSk7Cj4gIAkJcC0+cWxp
bS0+aW9fbWluID0gY3B1X3RvX2JlMzIoYmRldl9pb19taW4oYmRldikpOwo+ICAJCXAtPnFsaW0t
PmlvX29wdCA9IGNwdV90b19iZTMyKGJkZXZfaW9fb3B0KGJkZXYpKTsKPiAgCQlwLT5xbGltLT5k
aXNjYXJkX2VuYWJsZWQgPSBibGtfcXVldWVfZGlzY2FyZChxKTsKCkFja2VkLWJ5OiBDaHJpc3Rv
cGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5n
IGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
