Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF44ECCC9
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Mar 2022 20:59:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E49C4205F5;
	Wed, 30 Mar 2022 20:59:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F15A4202BA
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 20:59:23 +0200 (CEST)
Received: by mail-il1-f173.google.com with SMTP id z10so2144354iln.0
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 11:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=JzhfZ/CUq52HYShJX4rwZw+BsinCzZPXk6aUx2SeaWc=;
	b=21EfTKuFe/pyVsN6DsG8I8dRhf5by4GPqaSliM7JT+8DDqi3QeZkKta5IeA3F39y59
	8SPNNznBc5qOkQ6hSpJGSUhbo7IMbfb0R67rb383OK+T4U9TjAWNrDj+ar7Eim4blDwd
	6FF0WBuhdjG/BmNulBUy5M+Uq49Yh8lsSduxNE0ghGpcRHK/Wz2Tec/I6qwpV3GDZ1Hj
	XW5IF+JgZiWmf6H2LFT7aSWb7ZBlO2NMIgpC6LwfjfkkTScUvgGEaHBR1Lr8y2Zy6xn0
	snt/jA0zmPIevcMKYBoI3zpY4EF7PU9xjYip1uO4G3CUHe1AtzzkPF1W5M0MZtLLiRmn
	N+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=JzhfZ/CUq52HYShJX4rwZw+BsinCzZPXk6aUx2SeaWc=;
	b=g2NCz8gaDSSM7kXO1VMGN1nzBZwvVtOfrBKA4pwfUYVWiqwjo+5YwaUtRgMmq8S12r
	tMNYoRMzW3Z7P/Gmuu3+SH7n9jJgwYzsUiOk4HH/J9g4WuQ+sz75Q1gGVlRGjt2o9Gx8
	/c21W813AiPWj7G/F+4fTAD+o2Kn2/uwqtMZxCxazKN/QE5C+7efJJFxHaFttT3I18Ss
	eHHMnMk0Wsc09tlgLE9MKWG+8vALB52lmZR3NGuRk8U8ZiWfTM/27ekm+hVcJzI9axrh
	of6NyD3TjajI0C91uQwmKGqeki50gpzi2PcMuV30a7Q7UWfI62nteUJvPRohN2wdmpeu
	hLXQ==
X-Gm-Message-State: AOAM533loFKQGXd7hQnzrbeIvCoHa4f9AHVWgBd0ZxBteoAeI5X5Pog5
	dfCRYdGLklUVbhVgmcVcbggrbA==
X-Google-Smtp-Source: ABdhPJw0ofuukP3d70rMMKQq/MVP/cmS2KuFFYqXVZXDp5tSx4rls8PeIvy/lCBr5ROLmB3npVrs1g==
X-Received: by 2002:a05:6e02:1846:b0:2c7:b032:5d92 with SMTP id
	b6-20020a056e02184600b002c7b0325d92mr12107692ilv.237.1648666762286;
	Wed, 30 Mar 2022 11:59:22 -0700 (PDT)
Received: from [127.0.1.1] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	p2-20020a5d9c82000000b00649b622f528sm11565183iop.18.2022.03.30.11.59.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Mar 2022 11:59:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jens Axboe <abxoe@kernel.dk>, Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220330185551.3553196-1-christoph.boehmwalder@linbit.com>
References: <20220330185551.3553196-1-christoph.boehmwalder@linbit.com>
Message-Id: <164866676126.259715.18309022506548759751.b4-ty@kernel.dk>
Date: Wed, 30 Mar 2022 12:59:21 -0600
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RESEND PATCH] drbd: fix potential silent data
	corruption
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

T24gV2VkLCAzMCBNYXIgMjAyMiAyMDo1NTo1MSArMDIwMCwgQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IHdyb3RlOgo+IEZyb206IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29t
Pgo+IAo+IFNjZW5hcmlvOgo+IC0tLS0tLS0tLQo+IAo+IGJpbyBjaGFpbiBnZW5lcmF0ZWQgYnkg
YmxrX3F1ZXVlX3NwbGl0KCkuCj4gU29tZSBzcGxpdCBiaW8gZmFpbHMgYW5kIHByb3BhZ2F0ZXMg
aXRzIGVycm9yIHN0YXR1cyB0byB0aGUgInBhcmVudCIgYmlvLgo+IEJ1dCB0aGVuIHRoZSAobGFz
dCBwYXJ0IG9mIHRoZSkgcGFyZW50IGJpbyBpdHNlbGYgY29tcGxldGVzIHdpdGhvdXQgZXJyb3Iu
Cj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGRyYmQ6IGZpeCBwb3RlbnRpYWwg
c2lsZW50IGRhdGEgY29ycnVwdGlvbgogICAgICBjb21taXQ6IGY0MzI5ZDFmODQ4YWMzNTc1N2Q5
Y2M1NDg3NjY5ZDE5ZGZjNTk3OWMKCkJlc3QgcmVnYXJkcywKLS0gCkplbnMgQXhib2UKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWls
aW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
