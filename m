Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664628BBE4
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:30:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD9214203E9;
	Mon, 12 Oct 2020 17:30:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B67B420385
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:27:37 +0200 (CEST)
Received: by mail-ej1-f68.google.com with SMTP id lw21so23759581ejb.6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:organization:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:autocrypt;
	bh=xTCqf9NYUJEeuADo9TAtXVhmbLpoKc9a+FOT9v1sC8w=;
	b=dD7hq9b9Wj8dh7l3roPN5yVAIXRstULoxYv5eGZ9gYItP3MkVP2/XXe0ouFDZiUlIR
	cTr+SNJ3eeHPM0qczPBXbkAzMEzioZLgSe05QkuUSwKCYe+hIaAFqpezsYyeOLCAjZOC
	CJG0uD2svFmt9RdQcXDJhqAQER3xfBfhzLW0S/Xo409rFP4aYP2u5CKOzrQh6EmXLcJ6
	itPq5khA+nhtO0p96LD8aG62l4fgJSdngNj5CeWc/z2F6YNFwVg76tPZyh2y3P1pzXF1
	TNpgFX6vCDCm7jKCNESevqfRUpjl4GmpIO9KYYxkJ5sAUSu9q9JwuEEeH0FP/YUF6+cW
	DGKg==
X-Gm-Message-State: AOAM531qhGutUkpVuWsTyvf6ELoiJuw3pd8f3DuMTqKnO2zKveoRWLo0
	g2wYRAscMz0uh4uh9HZx0ZUiSl6ZU0ozMR+I
X-Google-Smtp-Source: ABdhPJyFTd6IRVHsdWnBiWNY41HwNDK07eb/XZyHeNQH4ZjynnLeTToTYsnkCZSjVuDlSLtEkX3a5A==
X-Received: by 2002:a17:906:4151:: with SMTP id
	l17mr30173731ejk.83.1602516396825; 
	Mon, 12 Oct 2020 08:26:36 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	u24sm1282996edo.92.2020.10.12.08.26.36
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:36 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:34 +0200
Resent-Message-ID: <20201012152634.GJ2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net
	[83.223.95.204])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18DF54202E2
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 13:14:40 +0200 (CEST)
Received: from h06.hostsharing.net (h06.hostsharing.net [83.223.95.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 89BF3101917B7;
	Mon, 12 Oct 2020 13:14:40 +0200 (CEST)
Received: from mail.home.lxtec.de
	(HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de
	[95.208.10.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by h06.hostsharing.net (Postfix) with ESMTPSA id 68C1660060DF;
	Mon, 12 Oct 2020 13:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
	s=mailxtec;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:reply-to;
	bh=xTCqf9NYUJEeuADo9TAtXVhmbLpoKc9a+FOT9v1sC8w=;
	b=LXRH+NKwHzB/kox93U+1p91/4a
	GKk0WiPkmLDZm/XVn/JgWVP3eS6zZfK8P3dnUk2JA5hNubSrXOhwFpB5Aa6vVPZI1GiAyzPma72b5
	ZHtEyt9HyAqqk1LE49zSjdCSvoaLjBW1xYyU3b86BcZTet8IVOe6Gr/pG2G1PFDUhgfARP5+RmQH2
	IhrCo+5CjsZJwQACf4eALj83j79kKDohfrORUxUt0TmNZJSGsraCOEC9LIIROzNZFXigzA2CTs5cH
	Lxze7a2k3r9ICMEUeXdM3+yIBiyOLsEPgdV3PrRjE94PG49X/ZT/SlbXPbJS0vuOKqvanO9JoODbj
	6Se0O4Rg==;
Received: from [127.0.0.1] (helo=localhost)
	by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
	id 1kRvmp-0002as-Kc; Mon, 12 Oct 2020 13:14:39 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqZCEl35h5Di; Mon, 12 Oct 2020 13:14:39 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
	id 1kRvmp-0002an-GH; Mon, 12 Oct 2020 13:14:39 +0200
Date: Mon, 12 Oct 2020 13:14:39 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20201012111439.jyewfvopfsjeyvp3@toy.home.lxtec.de>
Organization: LXTEC
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
	<20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
	<20201011185117.GA18543@wunner.de>
	<20201011193048.rfe5qvuba2ovrwed@toy.home.lxtec.de>
	<20201012005410.GA28362@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012005410.GA28362@wunner.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Lukas,

* Lukas Wunner <lukas@wunner.de> [2020-10-12 02:54 +0200]:

[...] 
> If you're unsuccessful debugging the build failure on your own,
> maybe you can upload your drbd build directory somewhere so I
> can take a look.

https://lxtec.de/drbd/drbd_dkms_buildir_hsh_201012.tar.xz

BTW without your patch the module was build successful with 4.19 and
5.7 though.

Thanks for cooperation
Elimar
-- 
  Never make anything simple and efficient when a way
  can be found to make it complex and wonderful ;-)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
