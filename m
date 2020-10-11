Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7E28BBCE
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:26:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB34342031C;
	Mon, 12 Oct 2020 17:26:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BCDBC4202B6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:26:20 +0200 (CEST)
Received: by mail-ej1-f66.google.com with SMTP id qp15so23752815ejb.3
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:organization:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:autocrypt;
	bh=314mM5RpBMv7ht1QxyJ2EdlBgG8oago+JifK8dKeiEM=;
	b=DiL/HxLF+m9JkgJki3Xwqla5nGZ8dLCugb/M4dXci9VwN7xP13XxvHhizKLHYuwSjg
	DK+240VEkdc2BFCLHCFNnBRtMqSxCKy9q3xXmsjymyKa/P1uHW6mZ/PDcEs/VdknwEHK
	EFZGr2wrKkk83JjjITUGkQHAByw4yV9b57pWYWn5K9hYF13Sf4PQGjOhLWJAHTzqRUcu
	iyW7prm1fcJpuSHUjD+2csub5C7uzqox+xcJgstKMBHZ3BcNEvIRHjXqa6lXRvDsIIEL
	XmRmPUA6mf3t4XcFHQr1hzETNgIlx5OdOW2mPVcd46uFD0htOHczYbf+St6zjstEzEz+
	xgmQ==
X-Gm-Message-State: AOAM532TJZyjCqBxDd5K20Z/JYU7lh+hKlCe/1/fq+kXJZfIfCzC40MQ
	AZHaN3PliE07roWABKjxA1AS94wsPBJjsrOt
X-Google-Smtp-Source: ABdhPJy1YtAt2Ysh0aWnXxDnX3/NccOL9JU46XpVxxSj+Z/lG73Lkm6oMR0RPYwNC0oTleisOlbJtQ==
X-Received: by 2002:a17:906:5613:: with SMTP id
	f19mr28086702ejq.441.1602516379828; 
	Mon, 12 Oct 2020 08:26:19 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	k21sm10680740edv.31.2020.10.12.08.26.19
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:19 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:17 +0200
Resent-Message-ID: <20201012152617.GC2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net
	[176.9.242.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F09F42022A
	for <drbd-dev@lists.linbit.com>; Sun, 11 Oct 2020 20:48:40 +0200 (CEST)
Received: from h06.hostsharing.net (h06.hostsharing.net [83.223.95.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 4D270101E6B11;
	Sun, 11 Oct 2020 20:39:31 +0200 (CEST)
Received: from mail.home.lxtec.de
	(HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de
	[95.208.10.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by h06.hostsharing.net (Postfix) with ESMTPSA id 01FC2603E049;
	Sun, 11 Oct 2020 20:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
	s=mailxtec;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:reply-to;
	bh=314mM5RpBMv7ht1QxyJ2EdlBgG8oago+JifK8dKeiEM=;
	b=Y5gM9X3g87Ha8K+tdq2gTUYKmJ
	55hPjbp/SMT9t+KXl5JS2D7X6URvZCnLjIhwwW4HmbwTTRwJwRYwNC9c908dFKFV8YmvZvsPorS1A
	1Phw+y/6+YQcGEB04c934Uk4QG5NRTAqddlL+tS0KRI8zxHebXrR9TNg2URJASQI7H7MdWhjPaCAu
	aPT9hFd1K4BTJT/nmD6XlT7adIAU+1IlO5fx4h8RigfBdBOlxJTzu0Nbno1L+KMrKGvHlYR5BZwJ+
	sjYQnVNVh3Qw4xChl3bqD5VbpZR4iRkml5VQ0ke8y4vfFUyyr1HCIM6MAblvwNBK1+5DZzCMmywgM
	9zYRLA5g==;
Received: from [127.0.0.1] (helo=localhost)
	by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
	id 1kRgFm-0002F1-5q; Sun, 11 Oct 2020 20:39:30 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4XWp0BGffki; Sun, 11 Oct 2020 20:39:30 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
	id 1kRgFm-0002Ew-1i; Sun, 11 Oct 2020 20:39:30 +0200
Date: Sun, 11 Oct 2020 20:39:30 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
Organization: LXTEC
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
Autocrypt: addr=riesebie@lxtec.de; prefer-encrypt=mutual; keydata=
	mDMEX1jtwhYJKwYBBAHaRw8BAQdAs61HjQAz35WpPCY10Cv+Yogn7p9Jj9h6RCCumDwgEXG0JkV
	saW1hciBSaWVzZWJpZXRlciA8cmllc2ViaWVAbHh0ZWMuZGU+iJAEExYIADgWIQRZA1EIeV8CRb
	fDhJMnMQo2HZmVNQUCX1jtwgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAnMQo2HZmVN
	WcPAP9wwap25jg2f1mS3353l3suaXcBsfX0XNGdCSfICVzUOAEA9GBRqB3/rOgLBLhZKnpJ1GFI
	ENN3OQ54tk+fzNVe3ga4OARfWO3CEgorBgEEAZdVAQUBAQdA6qcxjNtSY3LupzR/w0kMPsiljNb
	VvDBVhlb1gWPsoXgDAQgHiHgEGBYIACAWIQRZA1EIeV8CRbfDhJMnMQo2HZmVNQUCX1jtwgIbDA
	AKCRAnMQo2HZmVNSlSAP9Ip88aSckUV3dQrBgYEQdqBQ9No4/4LZLLBVJH2mDPTAEA6stoZOHJk
	ZZOPGu9KvBC1ZzUkKJTBHKR/+M9R1sBhgw=
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument
 was removed in v5.8
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

KiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4gWzIwMjAtMTAtMTEgMTg6MDcgKzAyMDBd
OgoKPiBDb21taXQgdG9ydmFsZHMvbGludXhAODhkY2E0Y2E1YTkzIHJlbW92ZWQgdGhlIHBncHJv
dCBhcmd1bWVudCBmcm9tCj4gX192bWFsbG9jKCkuICBUaGVyZSdzIGEgc2luZ2xlIGludm9jYXRp
b24gaW4gZHJiZF9iaXRtYXAuYy4gIERyb3AgdGhlCj4gYXJndW1lbnQgdG8gc3RheSBhcyBjbG9z
ZSBhcyBwb3NzaWJsZSB0byB1cHN0cmVhbSBhbmQgYXBwbHkgYSBjb2NjaQo+IHBhdGNoIGZvciBv
bGRlciBrZXJuZWxzIHdoaWNoIHJlaW5zdGF0ZXMgdGhlIGFkZGl0aW9uYWwgYXJndW1lbnQuCj4g
Cj4gUmVwb3J0ZWQtYnk6IE1pY2hhZWwgSGllcndlY2sgPG1pY2hhZWwuaGllcndlY2tAaG9zdHNo
YXJpbmcubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRl
Pgo+IC0tLQo+ICBkcmJkL2RyYmQta2VybmVsLWNvbXBhdC9jb2NjaS9fX3ZtYWxsb2NfX25vX2hh
c18yX3BhcmFtcy5jb2NjaSB8IDMgKysrCj4gIGRyYmQvZHJiZC1rZXJuZWwtY29tcGF0L2dlbl9w
YXRjaF9uYW1lcy5jICAgICAgICAgICAgICAgICAgICAgIHwgMyArKysKPiAgZHJiZC9kcmJkLWtl
cm5lbC1jb21wYXQvdGVzdHMvX192bWFsbG9jX2hhc18yX3BhcmFtcy5jICAgICAgICAgfCA4ICsr
KysrKysrCj4gIGRyYmQvZHJiZF9iaXRtYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMyArLS0KCkFwcGxpZWQgdGhhdCBwYXRjaCB0byB0YWcgOS4wLjI1
LTEuIEJ1aWxkaW5nIHRoZSBtb2R1bGUgdmlhIGRrbXMKZ2l2ZXM6CgovdmFyL2xpYi9ka21zL2Ry
YmQvOS4wLjI1LTFoc2gyL2J1aWxkL3NyYy9kcmJkL2RyYmRfYml0bWFwLmM6IEluIGZ1bmN0aW9u
IOKAmGJtX3JlYWxsb2NfcGFnZXPigJk6Ci92YXIvbGliL2RrbXMvZHJiZC85LjAuMjUtMWhzaDIv
YnVpbGQvc3JjL2RyYmQvZHJiZF9iaXRtYXAuYzozNjg6MTU6IGVycm9yOiB0b28gZmV3IGFyZ3Vt
ZW50cyB0byBmdW5jdGlvbiDigJhfX3ZtYWxsb2PigJkKICAgbmV3X3BhZ2VzID0gX192bWFsbG9j
KGJ5dGVzLAogICAgICAgICAgICAgICBefn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC92
YXIvbGliL2RrbXMvZHJiZC85LjAuMjUtMWhzaDIvYnVpbGQvc3JjL2RyYmQvZHJiZF9iaXRtYXAu
YzoxNjoKL3Vzci9zcmMvbGludXgtaGVhZGVycy00LjE5LjAtOS1jb21tb24vaW5jbHVkZS9saW51
eC92bWFsbG9jLmg6ODA6MTQ6IG5vdGU6IGRlY2xhcmVkIGhlcmUKIGV4dGVybiB2b2lkICpfX3Zt
YWxsb2ModW5zaWduZWQgbG9uZyBzaXplLCBnZnBfdCBnZnBfbWFzaywgcGdwcm90X3QgcHJvdCk7
CiAgICAgICAgICAgICAgXn5+fn5+fn5+CgpFbGltYXIKLS0gCiAgTnVtZXJpYyBzdGFiaWxpdHkg
aXMgcHJvYmFibHkgbm90IGFsbCB0aGF0CiAgaW1wb3J0YW50IHdoZW4geW91J3JlIGd1ZXNzaW5n
Oy0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJk
LWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3Rz
LmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
