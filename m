Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0F72222D
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Jun 2023 11:30:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 21A74420B00;
	Mon,  5 Jun 2023 11:30:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AEF2E420632
	for <drbd-dev@lists.linbit.com>; Mon,  5 Jun 2023 11:30:13 +0200 (CEST)
Received: by mail-wm1-f45.google.com with SMTP id
	5b1f17b1804b1-3f6e4554453so40103465e9.3
	for <drbd-dev@lists.linbit.com>; Mon, 05 Jun 2023 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20221208.gappssmtp.com; s=20221208; t=1685957353;
	x=1688549353; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=g2THcfh8s/E8A9Q3W+8XFt0p7Au/U9ACqLSkFJ7lxEE=;
	b=UvBj2Hz/ZyBpE3lZSzXKA6ngq0oc0HTbjyhRG8nzmfnlVnJ4qkk3+a5nd2qQmveFDj
	t71ab8pGB7bQWWjRGYYkk712PmUXzLv0IcSD6VwwLiN1U1Srhh5C5KJJ25HLZz9qxSco
	03Aop4Wo7ynqXbjPiNrKjqdwKF9Vi1HhYUQUjuZCpMU1ILl8xjVmcmTsu7htky31FXR6
	JVTuXJ4bCLrDt80cC9mSJSlqO5cfCRWnNcJ7gLLXyS8jQhlV9vJXKTqCrjlpxRMTvbXc
	fFVwrq/Wuc3c1IWXFkEPNsY55LGFeL1PfwdSlQSwl+9UNF0e5V6fLAfVVx4+ctOCAX5a
	6tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1685957353; x=1688549353;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=g2THcfh8s/E8A9Q3W+8XFt0p7Au/U9ACqLSkFJ7lxEE=;
	b=Ugt43H4cgRUqfxJjWN7tVheWkRT3MsJ4O0RkiyGziF/GEIcA99XikRdh4u8lojdM3U
	Qy+uk1+uwNeQX81eo2AP1l6kF7jQXggXWA27+Q395qeFskgrbqXvxI+hzoJ4MlZMHbNt
	2xTxlrVsWp+IgB5++uXvZCOFL+nXX1fL8jz2BLAyo4+g7raG/m9DhNxJ3v93nnhgH06v
	AMb5JaQzEvYjKY6lufK4ouEEfRQdmVLP4V4BYKi03KioLpHsUz/DWGSgr7vPbHLuq2P1
	z8Ly0ymKTfEArbLnz3rUMNuJQDlVDpsbhhoTCzZ7KDQrGbRaXUQFFXvz85xtfZUFWpST
	rfSQ==
X-Gm-Message-State: AC+VfDx7odG5xTM96DSvM9tyUIdg5sZenjpdS7p7O4X/uNooiANlO5Yj
	DIq5Zv94eCBhFtK0pUvhFZSQYl/L
X-Google-Smtp-Source: ACHHUZ4IzU7/FDO3TZ9CMu/B7p9RSwV7e1VVEtKPAbfQjjSYbz4yBn6ModbRKB7EWAwlhO/cTJ4RMQ==
X-Received: by 2002:a5d:65ca:0:b0:307:a075:2709 with SMTP id
	e10-20020a5d65ca000000b00307a0752709mr4179957wrw.68.1685957353048;
	Mon, 05 Jun 2023 02:29:13 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	n18-20020a5d4c52000000b0030ae901bc54sm9095163wrt.62.2023.06.05.02.29.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 05 Jun 2023 02:29:12 -0700 (PDT)
Message-ID: <2135eb9d-b673-1a0d-6698-d73de60fa00d@linbit.com>
Date: Mon, 5 Jun 2023 11:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.10.0
To: Christoph Hellwig <hch@lst.de>, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com
References: <20230601151646.1386867-1-hch@lst.de>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20230601151646.1386867-1-hch@lst.de>
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: stop defining __KERNEL_SYSCALLS__
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

QW0gMDEuMDYuMjMgdW0gMTc6MTYgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBfX0tFUk5F
TF9TWVNDQUxMU19fIGhhc24ndCBiZWVuIG5lZWRlZCBzaW5jZSBMaW51eCAyLjYuMTkgc28gc3Rv
cAo+IGRlZmluaW5nIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgIHwg
MSAtCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgfCAxIC0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKPiBpbmRl
eCA4Mzk4N2U3YTVlZjI3NS4uNTQyMjNmNjQ2MTBhMDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFp
bi5jCj4gQEAgLTM3LDcgKzM3LDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L25vdGlmaWVyLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+Cj4gICNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUu
aD4KPiAtI2RlZmluZSBfX0tFUk5FTF9TWVNDQUxMU19fCj4gICNpbmNsdWRlIDxsaW51eC91bmlz
dGQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3Nj
aGVkL3NpZ25hbC5oPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNl
aXZlci5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwo+IGluZGV4IDhjMmJj
NDdkZTQ3MzVlLi4wYzlmNTQxOTc3NjhkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9yZWNlaXZlci5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2
ZXIuYwo+IEBAIC0yNyw3ICsyNyw2IEBACj4gICNpbmNsdWRlIDx1YXBpL2xpbnV4L3NjaGVkL3R5
cGVzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC9zaWduYWwuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3BrdF9zY2hlZC5oPgo+IC0jZGVmaW5lIF9fS0VSTkVMX1NZU0NBTExTX18KPiAgI2luY2x1
ZGUgPGxpbnV4L3VuaXN0ZC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgo+ICAjaW5j
bHVkZSA8bGludXgvcmFuZG9tLmg+CgpMb29rcyByaWdodC4KClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgoKLS0gCkNo
cmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1
bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVk
IFN0b3JhZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9s
aXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
