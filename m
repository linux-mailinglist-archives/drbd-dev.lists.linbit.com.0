Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E1355804
	for <lists+drbd-dev@lfdr.de>; Tue,  6 Apr 2021 17:32:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BD1CB420625;
	Tue,  6 Apr 2021 17:32:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A06CE4205D5
	for <drbd-dev@lists.linbit.com>; Tue,  6 Apr 2021 17:32:46 +0200 (CEST)
Received: by mail-ej1-f52.google.com with SMTP id hq27so22590618ejc.9
	for <drbd-dev@lists.linbit.com>; Tue, 06 Apr 2021 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=ngPnB11Rpcpn6j95lYf0RFQG3fh878RPxrpeNe+ppTQ=;
	b=In+em3Cagf76ZFfcAAnRPlOcDr63uCGRsKH+1ZNR9xGyg2hY6L2IgKzMc1DgENfYKc
	PZTHLYIqAJDBRPPrq3mmAZ1M4NehV45GFYzXGsCtNnSiJdosoHNjK3IMNZCx8//heelt
	1squCfmQMPxtLjQo/zMNJDCRjQilbxcvToByhW/93Q35Rgi6OhVBSuRJPMpVA2IcKxBO
	SCjrVaO1EdMsSBaCKwJu+P8IY+atL+bLpgu/FLlCFqceXR4YnbkyxR5eEdOtDxSss213
	/vlg7yRmFS5jNGBNUkHdkua8rQMFE96dEpiIcyYx3lJkFfKoXjL4cLm+2nLP6hbJuBos
	ILgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=ngPnB11Rpcpn6j95lYf0RFQG3fh878RPxrpeNe+ppTQ=;
	b=Qy83m3KkyA5jkZ1xn1mU12qi3stLf/E8qAjmjm6Y61ihQJKVDk2C3MBy/n3J0i5EXa
	Ghv3cOfpi1U9mEL3NCnUbF8h7Uq1IfKDdatDWWWnIQVESHvKIswu3D7tWB/55hgav1yR
	u3aydfXUc9A/cQBWrgp/pj18uAPw3J8T75/e4IU3cYGljcaAXN+gASDg+lpCgZqeTHrA
	Ywg92H28WZONMBjR6KfvCNuCk80NUICtChbZKhSzBhFNac56vMo4nsoOY60UrhW4dJKI
	Q8Js9yVW9KDW4RIfpEhjrtPnIIl4ousl8A5JSQ7PE3YwMoKrT9eslzCRyhc90lMhQOQS
	s0dw==
X-Gm-Message-State: AOAM531xq8PS8zE32hFYomsJwwPNsKNp7E4PM6KSwu+q68lUOXNz8MiV
	RD26Brf8DNqiLkTnE/+i2N40GA==
X-Google-Smtp-Source: ABdhPJxBTCrBfzzVEuMPpPm6mg4voiraukMpw00AzU44N+vDeOW/nX58Vtb5To6nYmviQM2bZTZSFA==
X-Received: by 2002:a17:906:4d46:: with SMTP id
	b6mr8437549ejv.262.1617723165958; 
	Tue, 06 Apr 2021 08:32:45 -0700 (PDT)
Received: from dell ([91.110.221.193]) by smtp.gmail.com with ESMTPSA id
	um13sm4757402ejb.84.2021.04.06.08.32.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 06 Apr 2021 08:32:45 -0700 (PDT)
Date: Tue, 6 Apr 2021 16:32:43 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20210406153243.GV2916463@dell>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
	<33a06c9d-58b6-c9bf-a119-6d2a3e37b955@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33a06c9d-58b6-c9bf-a119-6d2a3e37b955@kernel.dk>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	xen-devel@lists.xenproject.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 00/11] Rid W=1 warnings from Block
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

T24gVHVlLCAwNiBBcHIgMjAyMSwgSmVucyBBeGJvZSB3cm90ZToKCj4gT24gMy8xMi8yMSAzOjU1
IEFNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBUaGlzIHNldCBpcyBwYXJ0IG9mIGEgbGFyZ2VyIGVm
Zm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+ID4ga2VybmVsIGJ1aWxkcywgd2hpY2gg
YXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSByaWRkbGVkIHdpdGgKPiA+IG5pZ2dseSBsaXR0
bGUgd2FybmluZ3MuCj4gCj4gQXBwbGllZCAyLTExLCAxIGlzIGFscmVhZHkgaW4gdGhlIG15IHRy
ZWUuCgpTdXBlcnN0YXIsIHRoYW5rcyBKZW5zLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpT
ZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20K
aHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
