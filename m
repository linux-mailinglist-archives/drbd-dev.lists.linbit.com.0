Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B663342075
	for <lists+drbd-dev@lfdr.de>; Fri, 19 Mar 2021 16:03:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F46F4203A6;
	Fri, 19 Mar 2021 16:03:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 427 seconds by postgrey-1.31 at mail19;
	Fri, 19 Mar 2021 16:03:44 CET
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BC674202B5
	for <drbd-dev@lists.linbit.com>; Fri, 19 Mar 2021 16:03:44 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 971A364F59
	for <drbd-dev@lists.linbit.com>; Fri, 19 Mar 2021 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616165796;
	bh=LMF6VcFLzMWcvJlrobie++1BU4E1KOgfLPmAne7lKKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OGLl458+qA7HrVWVEkJBIjl2/SyMntcd5k1C5HCbg2hs9InlN7I2SGH9wJN/UArnO
	dlNyjV0AWxqr/F9OXBK8mxaeEKdFrbONTjAWDMaCVDQ7Va4s69Uhz5fg5OauZtUdWo
	Q1OgxNbnvWnRHp3AbMwTTCFfekSNmMx3NNj8G0kLaYC4pegPbIJfvKqFfw7pQ7IzY9
	yVbmIycWzkB+oDAepgQkPmFIkJUcdcf2Yn/eIplcyds5wOCXddZYzzpIsot7xhk4QR
	oi7X8GuaS3zkBlpSAbIUDYAFVSGYWwEZ3mBPY2pf+FOdZPY1xzdY2fvAXJbwX9R6GR
	AFXv0ZDlmIXuA==
Received: by mail-oi1-f170.google.com with SMTP id d133so5038724oib.3
	for <drbd-dev@lists.linbit.com>; Fri, 19 Mar 2021 07:56:36 -0700 (PDT)
X-Gm-Message-State: AOAM532bF9GEgZ3ryX8exjEVuaCOqjFGZkrajPSev8vKpwDOeQiZwnx/
	sJkDv/mmN5V+URqZI8OVTam2LuauXKCFx4O0BdM=
X-Google-Smtp-Source: ABdhPJzs22NYplRNCgFniIEUfcVHb2z9VYKGx4WfHkWBTnO61TWk1PXtdP6RhG5AXzRZAFRg/1jqwU2AWebZF31Q7JI=
X-Received: by 2002:a05:6808:313:: with SMTP id
	i19mr1250554oie.67.1616165795957; 
	Fri, 19 Mar 2021 07:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210312105530.2219008-1-lee.jones@linaro.org>
	<20210312105530.2219008-7-lee.jones@linaro.org>
In-Reply-To: <20210312105530.2219008-7-lee.jones@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 19 Mar 2021 15:56:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a234A2WmPFJxXmf-n+J7TP3A=DyDWEr657zxaML7V9UWQ@mail.gmail.com>
Message-ID: <CAK8P3a234A2WmPFJxXmf-n+J7TP3A=DyDWEr657zxaML7V9UWQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 06/11] block: drbd: drbd_main: Remove
	duplicate field initialisation
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

T24gRnJpLCBNYXIgMTIsIDIwMjEgYXQgMTE6NTcgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBbUF9SRVRSWV9XUklURV0gaXMgaW5pdGlhbGlzZWQgbW9yZSB0
aGFuIG9uY2UuCj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fybmlu
ZyhzKToKPgo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmM6IEluIGZ1bmN0aW9uIOKA
mGNtZG5hbWXigJk6Cj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYzozNjYwOjIyOiB3
YXJuaW5nOiBpbml0aWFsaXplZCBmaWVsZCBvdmVyd3JpdHRlbiBbLVdvdmVycmlkZS1pbml0XQo+
ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmM6MzY2MDoyMjogbm90ZTogKG5lYXIgaW5p
dGlhbGl6YXRpb24gZm9yIOKAmGNtZG5hbWVzWzQ0XeKAmSkKPgo+IENjOiBQaGlsaXBwIFJlaXNu
ZXIgPHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPgo+IENjOiBMYXJzIEVsbGVuYmVyZyA8bGFy
cy5lbGxlbmJlcmdAbGluYml0LmNvbT4KPiBDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRr
Pgo+IENjOiBkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCj4gQ2M6IGxpbnV4LWJsb2NrQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+CgpMb29rcyBjb3JyZWN0LiBJIGhhZCBhY3R1YWxseSBwb3N0ZWQgYSBzbGlnaHRseSBkaWZm
ZXJlbnQgZml4IGxhc3QgeWVhciwKYnV0IGVpdGhlciBvbmUgYWRkcmVzc2VzIHRoZSB3YXJuaW5n
OgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMTAyNjIxNTA0My4zODkzMzE4LTEt
YXJuZEBrZXJuZWwub3JnLwoKICAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlz
dHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
cmJkLWRldgo=
