Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095C53B7B0
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Jun 2022 13:21:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 107184202BA;
	Thu,  2 Jun 2022 13:21:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 08F96420177
	for <drbd-dev@lists.linbit.com>; Thu,  2 Jun 2022 13:21:01 +0200 (CEST)
Received: by mail-ej1-f49.google.com with SMTP id jx22so9274921ejb.12
	for <drbd-dev@lists.linbit.com>; Thu, 02 Jun 2022 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:references:from:cc:in-reply-to:content-transfer-encoding;
	bh=NMR1XGM7uXTNv97aoaRd8gReNKN14pOysqXvMzHp08c=;
	b=iMM8mVURvO1vTSpnMFfXcQYX/2bPCQwltKPwlpioTDLN3bqqI5r2/I2tJoW+7mUq1D
	CTHhoQIK8qm95CqdXCu4sYdJviIhPkv36E1lWfixk3xJhJKbU6SyHYU3pz0NvqffcB1t
	dB83Du8jcNLv9I7EXJGgrFlLe+GE1HfxmjobbLCHjU0h+ezDf5TlvJUSTJLdD/YbDzDq
	g65C90EMJTmEOHAoLCsI9ssSYvA4n+K8MyrfhptomVaMBv1Oo9XXGU0xlcCyTBHNinlc
	H9jhAOUmFeqktwc3kMFtaUSEcfjzHQbcUueoyHvgxBKoaKjU/qVdbGPRxSqq2TJ1Ra9f
	QC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:cc:in-reply-to
	:content-transfer-encoding;
	bh=NMR1XGM7uXTNv97aoaRd8gReNKN14pOysqXvMzHp08c=;
	b=CCNoHqPoZQTJoBG2u/HT2Ud6eQ4nsPdd91rgrQV7dCmmCAQDYSMDsXmruKKnI00mtW
	sKcPqN2XsVQvUBWsyi/+X/HEoLHUNL3GdPOvU7ZxKq2Mh83N7LIibGph+Y9Lgv921kVj
	Br5MXRShsojOwMJHqHBxUA2qu2GRcxZg405Rp8MPu0CByiR8jdNijqmgxQArS1pDVwx/
	ZqRzl2hUiehpED10xv0umhIxerqi01ljNm5HQD//O5yq5kfgfGlqfA8newgrIULmZzM6
	2xelifGGmLFyMadIhvumccxX9coT8tWcpP2AVYaKwUxysO2fdm7Wn5GovOeFDhwXksP/
	0c3g==
X-Gm-Message-State: AOAM530v3Xs9Zaoi+txzzqb1gDRK7ES3kVcm/VZ7e+VnA+cOONy9Pyal
	2gX6snERPkLXcC1L0tJdi+7sEK3OClFirLPjexQ=
X-Google-Smtp-Source: ABdhPJybjTcaBS+DvFWEBU171eiorJ70l8vxtgbDLmoK9AAHccarwU8S6S2VqZoi+mQfKn93xIqhQA==
X-Received: by 2002:a17:907:d21:b0:6fe:c340:616 with SMTP id
	gn33-20020a1709070d2100b006fec3400616mr3871759ejc.177.1654168861403;
	Thu, 02 Jun 2022 04:21:01 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	n9-20020a170906700900b006fe8ac6bc69sm1654756ejj.140.2022.06.02.04.21.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 02 Jun 2022 04:21:00 -0700 (PDT)
Message-ID: <79d35a2a-2603-41fd-18b8-19f4544ca09a@linbit.com>
Date: Thu, 2 Jun 2022 13:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.9.1
Content-Language: en-US
To: Michael Labriola <veggiemike@sourceruckus.org>
References: <CAA1fRFhZrTfHegCWwNoSsUkmvBBfFmd9viQVsmCpSMFQNH5vTg@mail.gmail.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <CAA1fRFhZrTfHegCWwNoSsUkmvBBfFmd9viQVsmCpSMFQNH5vTg@mail.gmail.com>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Linux 5.18 status
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

QW0gMDEuMDYuMjIgdW0gMTY6MDMgc2NocmllYiBNaWNoYWVsIExhYnJpb2xhOgo+IEFob3khICBM
b29rcyBsaWtlIHRoZSBkcmJkLTkuMSBicmFuY2ggZG9lc24ndCBjb21waWxlIGFnYWluc3QgNS4x
OAo+IHlldC4gIElzIHNvbWVib2R5IHdvcmtpbmcgdGhyb3VnaCB0aGUgNS4xOCBibG9jayBsYXll
ciBjaGFuZ2VzCj4gYWxyZWFkeT8gIElmIGFueW9uZSdzIGdvdCBhIGJyYW5jaCB0byB0ZXN0LCBJ
J2QgZ2xhZGx5IHRyeSBpdCBvdXQuCj4gCj4gLS0KPiBNaWNoYWVsIEQgTGFicmlvbGEKPiA0MDEt
MzE2LTk4NDQgKGNlbGwpCgpIaSwKCkknbSB3b3JraW5nIG9uIDUuMTggY29tcGF0IGFzIHdlIHNw
ZWFrLiBTaW5jZSBubyBkaXN0cmlidXRpb24gd2UgYnVpbGQKZm9yIGlzIHVzaW5nIDUuMTgsIHRo
aXMgaGFzIGEgc29tZXdoYXQgbG93ZXIgcHJpb3JpdHksIGJ1dCBpdCBpcyBiZWluZyBkb25lLgoK
SSB3b3VsZCBlc3RpbWF0ZSB3ZSBoYXZlIGFyb3VuZCA1IG9yIDYgcmVtYWluaW5nIG5vbi10cml2
aWFsIHBhdGNoZXMKdGhhdCByZXF1aXJlIHJlYWwgYXR0ZW50aW9uIGJlZm9yZSB3ZSBjYW4gYnVp
bGQgZm9yIDUuMTguCgpJZiBldmVyeXRoaW5nIGdvZXMgdG8gcGxhbiwgdGhlIGZpeGVzIG1pZ2h0
IG1ha2UgaXQgaW50byB0aGUgbmV4dCBEUkJECnJlbGVhc2UgaW4gbWlkLUp1bmUsIGJ1dCBJIHJl
YWxseSBjYW4ndCBtYWtlIGFueSBwcm9taXNlcy4KCi0tIApDaHJpc3RvcGggQsO2aG13YWxkZXIK
TElOQklUIHwgS2VlcGluZyB0aGUgRGlnaXRhbCBXb3JsZCBSdW5uaW5nCkRSQkQgSEEg4oCUICBE
aXNhc3RlciBSZWNvdmVyeSDigJQgU29mdHdhcmUgZGVmaW5lZCBTdG9yYWdlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlz
dApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
