Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8706282C
	for <lists+drbd-dev@lfdr.de>; Mon,  8 Jul 2019 20:16:51 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 527291045C22;
	Mon,  8 Jul 2019 20:16:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D8F95103B4B8
	for <drbd-dev@lists.linbit.com>; Mon,  8 Jul 2019 20:16:46 +0200 (CEST)
Received: by mail-io1-f50.google.com with SMTP id g20so16295585ioc.12
	for <drbd-dev@lists.linbit.com>; Mon, 08 Jul 2019 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:organization:to:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=lDjv+BcoVwy1spbZVct+IKwOOXGI+y/HAIZdXAFwP8o=;
	b=dBi4mlvXihptlaZjr7IVPPtk8lFZIk3Ghd2XMabaX7NScYjHsVsgiYevvCf69nevsM
	lZu2ldmdZWYStF0MIp/PykgLDYFWz8Ro2vGt2UDJhtp4rmVDYh4spbrkyE/jlphuMNbF
	3nSBe3kPMp41g7LcFhXN+u8LHc8oCo8AoPrREHSqMvVAHoQ9boPUvHLDNJoiNYr/DXBd
	aPxvRFKMg0FjdA8iNzSZhVQY3nD3xoOGkmOhikizhhSBxXoU3C1dDAwTJ++WeRRQHF5Q
	2hexQAX46nXiVWIq9ACdPC1BE2scwZapotYRrUtYMO+9YoHTlLRmkdmwbnwujHI8Pfcf
	NB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:organization:to:subject:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=lDjv+BcoVwy1spbZVct+IKwOOXGI+y/HAIZdXAFwP8o=;
	b=j3HL7y6JiqajQbbSN34C258shQhb5Qu8CM/86OBGSFPUaqX4mqON5+N1WKYyQNgMG1
	YdxgbK74UBKneEhrQGWedI2fgfEe+mCCLiezjSrLa9/zZZY8IP5ANUudzZp38PzZfZH7
	yIWT+C8q38nPVNb02Uz7oJQmB/7Lszbax28QuevHncT5lNZJN74N3G29U6QCNAGXB387
	PRpjd3PgLluQceTvTsegQSrlNSEACABR4fosc9CwhuLHGZQaAlqAz9mH05WLG+nimOkQ
	/ohJf/8avDpQ0Pfx5YIMtYaOM4FSxGvnv4B83n8WeTr4eleOVIoNW61axfrZdL+sfDdO
	cuNw==
X-Gm-Message-State: APjAAAU7eqWhFCfYAAAAHvuVeYxit4fyJfir/IYQk52OesRHBlWWyoxG
	lu/1msdUr92ond7TX4JOMBK7SkGM
X-Google-Smtp-Source: APXvYqwt4d1XCGV3pOwebi9D8FIzDJJPyDL++8Ld/Nr/HKCduiFQhK2n4SSVksrt+wK1vpCp38yz7w==
X-Received: by 2002:a5d:8a10:: with SMTP id w16mr15335156iod.175.1562609805402;
	Mon, 08 Jul 2019 11:16:45 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	t19sm15767775iog.41.2019.07.08.11.16.44
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 11:16:45 -0700 (PDT)
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
To: drbd-dev@lists.linbit.com
Message-ID: <ef9fab02-3129-d733-2316-1c11a246c572@gmail.com>
Date: Mon, 8 Jul 2019 12:16:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] "missing-prototypes" warning under standard kernel
	compile options
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

VGhpcyBmaXhlcyBhICJtaXNzaW5nLXByb3RvdHlwZXMiIGNvbXBpbGVyIHdhcm5pbmcgdW5kZXIg
dGhlIHN0YW5kYXJkIGtlcm5lbCBjb21waWxlCndhcm5pbmcgb3B0aW9ucy4gIEl0IHdhbnRzIHRv
IHNlZSBhIHByaW9yIGRlY2xhcmF0aW9uIGZvciBleHRlcm5hbGx5LXZpc2libGUgZnVuY3Rpb25z
LgpUaGUgZnVuY3Rpb24gYXQgaXNzdWUgZG9lcyBub3QgbmVlZCB0byBiZSBleHRlcm5hbGx5LXZp
c2libGUsIHNvIG1ha2UgaXQgc3RhdGljLgoKZHJiZF9hY3Rsb2cuYzoyMzk6MTogd2FybmluZzog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzZXRfYm1lX3ByaW9yaXR54oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KIHNldF9ibWVfcHJpb3JpdHkoc3RydWN0IGdldF9hY3Rpdml0eV9sb2df
cmVmX2N0eCAqYWxfY3R4KQoKCgpkaWZmIC0tZ2l0IGEvZHJiZC9kcmJkX2FjdGxvZy5jIGIvZHJi
ZC9kcmJkX2FjdGxvZy5jCmluZGV4IDQ0YzViMmNjLi4yMGI3MmQ1ZiAxMDA2NDQKLS0tIGEvZHJi
ZC9kcmJkX2FjdGxvZy5jCisrKyBiL2RyYmQvZHJiZF9hY3Rsb2cuYwpAQCAtMjM1LDcgKzIzNSw3
IEBAIGZpbmRfYWN0aXZlX3Jlc3luY19leHRlbnQoc3RydWN0IGdldF9hY3Rpdml0eV9sb2dfcmVm
X2N0eCAqYWxfY3R4KQogCXJldHVybiBOVUxMOwogfQogCi12b2lkCitzdGF0aWMgdm9pZAogc2V0
X2JtZV9wcmlvcml0eShzdHJ1Y3QgZ2V0X2FjdGl2aXR5X2xvZ19yZWZfY3R4ICphbF9jdHgpCiB7
CiAJc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlOwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJi
ZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RyYmQtZGV2Cg==
