Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C1908774232
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Aug 2023 19:36:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 35B7942066F;
	Tue,  8 Aug 2023 19:36:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 375F042032F
	for <drbd-dev@lists.linbit.com>; Tue,  8 Aug 2023 19:36:53 +0200 (CEST)
Received: by mail-io1-f43.google.com with SMTP id
	ca18e2360f4ac-790b9d7d643so69338339f.1
	for <drbd-dev@lists.linbit.com>; Tue, 08 Aug 2023 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1691516212;
	x=1692121012; 
	h=content-transfer-encoding:in-reply-to:from:references:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=W12zFQNYWmf7lxVitQTmsPU6ohpCj7vCRxt2BuviHRg=;
	b=xyGAFtDAT2tPBjTd1aJ2XnvUCud1/g6zAx2AYWN70Ly+He1mw+fJy0CddhXj9UAMa1
	BT0sTdPbrjmzUnLFsLkFiJTPh8YdHBLKoIV9BLRBVisNoPW9xjyljU3gy9pSSakFXQRC
	ZsLkvep318DI/l8tr/l0qx3G2LX0HLnQVgo+4IFp9WyqT63g0U7unp/Q21UB1uQRSMb3
	oju4r/2GglDgnu/oWymTVrJaBSPDpiOOqWuQCkNJs/qV0bvyb+p+Q06/Bdc8k+N9uxCY
	fe/akn93vobbJaJ6e+Oso3xFlLzFNctNYzRW7oJHlnDl7nbu4pDLpxM8eA/Oi0U3aNev
	+pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1691516212; x=1692121012;
	h=content-transfer-encoding:in-reply-to:from:references:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=W12zFQNYWmf7lxVitQTmsPU6ohpCj7vCRxt2BuviHRg=;
	b=OuQrNUXOPZbOSChETt6xTBzqx4Fy/xT5i7U+tuzsQc4TThC1F38SH1dE85V9QQMTrz
	v3QTSzLhkYbx8OIQIM+elZTDdhUUWKKVJn8CZSQV/ssTXeMpatCPnvD0oacs6lvw6cZ+
	C6xzpp/9q7DG31HOoV4/9agiSRB8LDUBil20FsioY4FHghmDRc2IoJNpEEY7eoeQq2xe
	m5pFzgMThuyfvF1oxNbv5wr8TLaeHCKpakKZNih7/pM0cCFj81pq2nX+yiIYGsy1vPQv
	df3nMlFg7BqmRC+HS4MR/vaJg4JcA7PR53DfvLP9O/NjdA2OasoOU//dgrdSJ4uDdIaf
	+R3g==
X-Gm-Message-State: AOJu0YwxaaZhI2/617vpkm6Z+44CtHtozDuz1a9tkhWvn04Jb4MSKtZL
	gldCuiJAtmubCIfB2I5T6Yeaxg==
X-Google-Smtp-Source: AGHT+IH62rOiVnjNuGqI06d97/ArjLGjXdQg2Q222YmDWvHqg+md7I8nZsJjL9J0VbHSwYXwamnV3g==
X-Received: by 2002:a05:6602:3798:b0:780:d65c:d78f with SMTP id
	be24-20020a056602379800b00780d65cd78fmr335599iob.2.1691516212356;
	Tue, 08 Aug 2023 10:36:52 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	a24-20020a6b6618000000b007909b061efbsm3771878ioc.23.2023.08.08.10.36.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 08 Aug 2023 10:36:51 -0700 (PDT)
Message-ID: <5e560155-b2a4-e5bd-d22e-0e44a5a85f43@kernel.dk>
Date: Tue, 8 Aug 2023 11:36:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.13.1
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20230808090111.2420717-1-ruanjinjie@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230808090111.2420717-1-ruanjinjie@huawei.com>
Subject: Re: [Drbd-dev] [PATCH -next] drbd: Use helper put_drbd_dev() and
	get_drbd_dev()
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

T24gOC84LzIzIDM6MDHigK9BTSwgUnVhbiBKaW5qaWUgd3JvdGU6Cj4gVGhlIGRyYmRfZGVzdHJv
eV9kZXZpY2UoKSBhcmcgb2YgdGhpcyBjb2RlIGlzIGFscmVhZHkgZHVwbGljYXRlZAo+IDE4IHRp
bWVzLCB1c2UgaGVscGVyIGZ1bmN0aW9uIHB1dF9kcmJkX2RldigpIHRvIHJlbGVhc2UgZHJiZF9k
ZXZpY2UKPiBhbmQgcmVsYXRlZCByZXNvdXJjZXMgaW5zdGVhZCBvZiBvcGVuIGNvZGluZyBpdCB0
byBoZWxwIGltcHJvdmUKPiBjb2RlIHJlYWRhYmlsaXR5IGEgYml0Lgo+IAo+IEFuZCBhZGQgZ2V0
X2RyYmRfZGV2KCkgaGVscGVyIGZ1bmN0aW9uIHRvIGJlIHN5bW1ldHJpY2FsIHdpdGggaXQuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW52b2x2ZWQuCgpJTUhPIHRoaXMganVzdCBtYWtlcyB0
aGUgY29kZSBoYXJkZXIgdG8gcmVhZC4gWW91J3JlIG5vdCBhZGRpbmcgYQpoZWxwZXIsIGFsbCBp
dCBkb2VzIGlzIGNhbGwgdGhlIHNhbWUgZ2V0L3B1dCBwYXJ0cy4gV2h5IG5vdCBqdXN0IGtlZXAK
aXQgYXMtaXMgdGhlbj8KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxp
c3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZHJiZC1kZXYK
