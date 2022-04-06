Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DC54F5735
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 10:07:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 93CE8420FBF;
	Wed,  6 Apr 2022 10:07:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2093F420FB2
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 10:06:58 +0200 (CEST)
Received: by mail-ej1-f43.google.com with SMTP id qh7so2526759ejb.11
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:content-language:to:cc:from
	:subject:content-transfer-encoding;
	bh=es6GCrlF2nUa0y5ZqhJAmYS3RmLKzWhj9CrxAydvPkQ=;
	b=WLs5Y7dQQ1ojQDKonVW6tlspo1zGSLIdb34V1BJRbZ8++lv5g3uyv8sDyc+aeAiwi+
	XcJw2lAErX6inKAEwv1iR9I9O4OHIlWTk4rMQW0yx3MsopAyhZ+ohuE5rT8oR6NKGIB+
	B2UW7eg7uhPisss+fZ3XIu7aaVgQsioBwNWykuYRMTFdLMdsIMM/v5zn4xkT501erVBv
	J7YSTnIlpqIo7WbU2m0Z8/S4YAWjF9A00yWknK4Ewp2Ikw7KQokUMgEuVTxUbPjFa8G9
	dD9dRWZUtfbPL2WQwXktQsQJnsdIl/46vrlj+vrE8MT339Exya2p8uFxtb2fqBjMKM/C
	5J2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent
	:content-language:to:cc:from:subject:content-transfer-encoding;
	bh=es6GCrlF2nUa0y5ZqhJAmYS3RmLKzWhj9CrxAydvPkQ=;
	b=Pi8Oju0A5GQcp1Xmd8yxDV/U5D0N0UXZQPD+2S9iD3uM0iLRRlNmIq4op+r6Yh64+p
	cbV8CCftNOsDXN71DY6TNkGIDsn4gXGaerM+7wbGdD+P4C2UN2xjLmHjAGyjc2RE+p3O
	YjeWHcfjVj/B//APXHg4uD+EgzRTyN/znaIC1+PEsahyLMAqkzohYcF1CKTld4E6KB6G
	2gCoYiAJeP6Zfj7XdVJ66rKw1xR2yg2QEyH2glRhW7KNOaWCMbFW6pTFOiW3SSzqCwSk
	6akzoIWFmpXCeIDcZTEZ9/rxYnImL438tF9fHglOcuzA4ecH1mQEOCtjC2gZwNn8hTLf
	YbEA==
X-Gm-Message-State: AOAM531MyC3sQxgNs/Q/q1eagVJf+TICBPnPna37h+eKvzR8sjS4QtpZ
	Od1vomJN0z6SQFUma4Wlt1h99dws
X-Google-Smtp-Source: ABdhPJy0++LnaoradYkv1E6KheIHyeqVReiZzhg85Ym/lpm0gMzniiWG8JrkI90H2/KDZlnujE8+/A==
X-Received: by 2002:a17:907:3f86:b0:6df:ad43:583 with SMTP id
	hr6-20020a1709073f8600b006dfad430583mr7144090ejc.535.1649232418531;
	Wed, 06 Apr 2022 01:06:58 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	gk16-20020a17090790d000b006e802f814b2sm1996037ejb.193.2022.04.06.01.06.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 01:06:57 -0700 (PDT)
Message-ID: <60bf3e8f-9cfb-00d1-5fea-71a72ba93258@linbit.com>
Date: Wed, 6 Apr 2022 10:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [GIT PULL] DRBD fixes for Linux 5.18
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

SGkgSmVucywKCnRoaXMgaXMgdGhlIGZpcnN0IGJhdGNoIG9mIERSQkQgdXBkYXRlcywgY2F0Y2hp
bmcgdXAgZnJvbSB0aGUgbGFzdCBmZXcgeWVhcnMuClRoZXNlIGZpeGVzIGFyZSBhIGJpdCBtb3Jl
IHN1YnN0YW50aWFsLCBzbyBpdCB3b3VsZCBiZSBncmVhdCBpZiB0aGV5IGNvdWxkIHN0aWxsCmdv
IGludG8gNS4xOC4KClBsZWFzZSBwdWxsLgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgZmYwZjNmODMxNzUyNzRkYWYyZWI0ZmQ0ZGI2NDMwYWI3MWM2NmU4MDoKCiAgTWVyZ2Ug
YnJhbmNoICdmb3ItNS4xOS9pb191cmluZy14YXR0cicgaW50byBmb3ItbmV4dCAoMjAyMi0wNC0w
NCAxNzo1OTo1MSAtMDYwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
OgoKICBodHRwczovL2dpdGh1Yi5jb20vTElOQklUL2xpbnV4LWRyYmQuZ2l0IHRhZ3MvZHJiZC1m
aXhlcy01LjE4LTIwMjItMDQtMDYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwYWI1
ZTIxMTc3NjMxOTBmNjg0ZmRlZGI2ZjE3MWFiZDRiOTM5ZjFiOgoKICBkcmJkOiBzZXQgUVVFVUVf
RkxBR19TVEFCTEVfV1JJVEVTICgyMDIyLTA0LTA2IDA5OjE2OjEzICswMjAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpE
UkJEIGZpeGVzIGZvciBMaW51eCA1LjE4CgotIGVuYWJsZSBzdGFibGUgd3JpdGVzIGZvciBEUkJE
IChDaHJpc3RvcGggQsO2aG13YWxkZXIpCi0gZml4IGEgcG90ZW50aWFsIGludmFsaWQgbWVtb3J5
IGFjY2VzcyAoWGlhb21lbmcgVG9uZykKLSBmaXggYSB1c2UtYWZ0ZXItZnJlZSBidWcgKEx2IFl1
bmxvbmcpCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkNocmlzdG9waCBCw7ZobXdhbGRlciAoMSk6CiAgICAgIGRyYmQ6IHNl
dCBRVUVVRV9GTEFHX1NUQUJMRV9XUklURVMKCkx2IFl1bmxvbmcgKDEpOgogICAgICBkcmJkOiBG
aXggZml2ZSB1c2UgYWZ0ZXIgZnJlZSBidWdzIGluIGdldF9pbml0aWFsX3N0YXRlCgpYaWFvbWVu
ZyBUb25nICgxKToKICAgICAgZHJiZDogZml4IGFuIGludmFsaWQgbWVtb3J5IGFjY2VzcyBjYXVz
ZWQgYnkgaW5jb3JyZWN0IHVzZSBvZiBsaXN0IGl0ZXJhdG9yCgogZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfaW50LmggICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfbWFpbi5jICAgICAgICAgfCAgNyArKystLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9u
bC5jICAgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jICAgICAgICB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGVfY2hhbmdlLmggfCAgOCAr
KysrLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMo
LSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1k
ZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5s
aW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
