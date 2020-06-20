Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B212C2020FE
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:34:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 966C4420418;
	Sat, 20 Jun 2020 05:34:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52B0E4203F5
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:24 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id z63so5387666pfb.1
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=53EFvIpvLtL19VTcgKVkwQhb1JNYVFCG8WLiohIrzpg=;
	b=hXEDT+oQwZV/0j93NEptSD6lkCmisgOBhpbn5Vp8lS7WhqstyLUjYh8/pubGfJlegl
	cIZZuP2lTlcYx/X9xdQps0HcFapdlSQ3sZeyQSQTzkk3YYv8X66EUy9+bLD5pYpGJ7K8
	f/p23iF9Lj5ZdC2ePxyPtJFko+YDM3iaXqXxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=53EFvIpvLtL19VTcgKVkwQhb1JNYVFCG8WLiohIrzpg=;
	b=YaTZQug896avdjV8qDwJQ7DlXiCpByjScFYVPWnv7ejvRsMkb27BYDSC5egehHdJuk
	lTCb6I7oFzbj9vqKGTqbejNOkN3lKIuhrbzhJ1nxeCwsF03RI8lGE8202yW/FX0/waGd
	RDTbKNWWaPQHdUsKOmlpoA/2W98GWMwTA3vhlime1oE0La3+SKCH3VtgqOe7mR0S06aw
	Jh5ir7hjKydZOYbSvAADfIJKRjuU5qluaK61TpSV11Z2Svn3KrsanDtBSekZa+9zrK6a
	aKFZPZc+JHC+0hwORPN01ORfbheGEiSjqZ3JKYSE4ELiASjFxrw+Cyusjm1UsGKdJpzG
	r6mg==
X-Gm-Message-State: AOAM533urxvsBwlNB90eS9sTlZEgewirjGWGOeFp6HHLWcmHI5i/gXLu
	H5VrthhyHd7VEoEEGxGM9/t7mg==
X-Google-Smtp-Source: ABdhPJzWWDTo3fA3qlpxXPt9t+m0l3tQUgBSNT3cCPjCzr+IkMUIJTgiw4SJHjx8tKw0+dOG4rlAaQ==
X-Received: by 2002:aa7:9f10:: with SMTP id g16mr10814981pfr.47.1592623824106; 
	Fri, 19 Jun 2020 20:30:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	w77sm7615693pff.126.2020.06.19.20.30.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:29:58 -0700
Message-Id: <20200620033007.1444705-8-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 07/16] clk: st: Remove uninitialized_var()
	usage
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

VXNpbmcgdW5pbml0aWFsaXplZF92YXIoKSBpcyBkYW5nZXJvdXMgYXMgaXQgcGFwZXJzIG92ZXIg
cmVhbCBidWdzWzFdCihvciBjYW4gaW4gdGhlIGZ1dHVyZSksIGFuZCBzdXBwcmVzc2VzIHVucmVs
YXRlZCBjb21waWxlciB3YXJuaW5ncyAoZS5nLgoidW51c2VkIHZhcmlhYmxlIikuIElmIHRoZSBj
b21waWxlciB0aGlua3MgaXQgaXMgdW5pbml0aWFsaXplZCwgZWl0aGVyCnNpbXBseSBpbml0aWFs
aXplIHRoZSB2YXJpYWJsZSBvciBtYWtlIGNvbXBpbGVyIGNoYW5nZXMuIEFzIGEgcHJlY3Vyc29y
CnRvIHJlbW92aW5nWzJdIHRoaXNbM10gbWFjcm9bNF0sIGp1c3QgcmVtb3ZlIHRoaXMgdmFyaWFi
bGUgc2luY2UgaXQgd2FzCmFjdHVhbGx5IHVudXNlZDoKCmRyaXZlcnMvY2xrL3N0L2Nsa2dlbi1m
c3luLmM6IEluIGZ1bmN0aW9uIOKAmHF1YWRmc19zZXRfcmF0ZeKAmToKZHJpdmVycy9jbGsvc3Qv
Y2xrZ2VuLWZzeW4uYzo3OTM6Njogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGnigJkgWy1X
dW51c2VkLXZhcmlhYmxlXQogIDc5MyB8ICBpbnQgaTsKICAgICAgfCAgICAgIF4KClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAwNjAzMTc0NzE0LjE5MjAyNy0xLWdsaWRlckBn
b29nbGUuY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQSs1NWFGdytWYmow
aT0xVEdxQ1I1dlFrQ3pXSjBReEs2Q2Vybk9VNmVlZHN1ZEFpeHdAbWFpbC5nbWFpbC5jb20vClsz
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBKzU1YUZ3Z2JncWhicDFma3h2UktFcHp5
UjVKOG4xdktUMVZaZHo5a25tUHVYaE9lZ0BtYWlsLmdtYWlsLmNvbS8KWzRdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvQ0ErNTVhRnoyNTAwV2ZiS1hBeDhzNjd3cm05PXlWSnU2NVRwTGdO
X3liWU52MFZFT0tBQG1haWwuZ21haWwuY29tLwoKRml4ZXM6IDVmN2FhOTA3MWU5MyAoImNsazog
c3Q6IFN1cHBvcnQgZm9yIFFVQURGUyBpbnNpZGUgQ2xvY2tHZW5CL0MvRC9FL0YiKQpTaWduZWQt
b2ZmLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2Ns
ay9zdC9jbGtnZW4tZnN5bi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N0L2Nsa2dlbi1mc3luLmMgYi9kcml2ZXJzL2Nsay9z
dC9jbGtnZW4tZnN5bi5jCmluZGV4IGExNTZiZDBjNmFmNy4uZjFhZGM4NThiNTkwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2Nsay9zdC9jbGtnZW4tZnN5bi5jCisrKyBiL2RyaXZlcnMvY2xrL3N0L2Ns
a2dlbi1mc3luLmMKQEAgLTc5MCw3ICs3OTAsNiBAQCBzdGF0aWMgaW50IHF1YWRmc19zZXRfcmF0
ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAogCXN0cnVjdCBzdF9jbGtf
cXVhZGZzX2ZzeW50aCAqZnMgPSB0b19xdWFkZnNfZnN5bnRoKGh3KTsKIAlzdHJ1Y3Qgc3RtX2Zz
IHBhcmFtczsKIAlsb25nIGh3cmF0ZTsKLQlpbnQgdW5pbml0aWFsaXplZF92YXIoaSk7CiAKIAlp
ZiAoIXJhdGUgfHwgIXBhcmVudF9yYXRlKQogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYg
bWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5i
aXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
