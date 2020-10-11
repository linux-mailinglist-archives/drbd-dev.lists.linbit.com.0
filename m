Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536E28BBD2
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:27:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F23F420356;
	Mon, 12 Oct 2020 17:27:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A89A4202B6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:26:28 +0200 (CEST)
Received: by mail-ed1-f67.google.com with SMTP id p13so17404328edi.7
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:organization:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:autocrypt;
	bh=Hkyy/uZNN70/IARHzazoie/SvUZjk4O30WslBaYUdjg=;
	b=l/WXmDEG66gr2FILNj1GHoJ4OP93d2vJU6tDypbCtmHVcGKbZhHTTmS6DKmXa91+Ec
	m35j/ulDD/pNaWb+froAOlw+GZ6mxzudw2c7gMRwySxetfVCTmN+ageo1wozBzdvl2y6
	KdsUxHyusNUUmZbxTGXZNM2duHMVHO44uTtG0yQOrme/x/Aw+7yUueWoux4NUOepq3ai
	GIACoxi0MrGen1TabmGNWGsIcZFjnEtZ2UtvnLt/IigGb/aqtiWJDo+ocTALxY/g8Ek6
	yJvHZNAaqwaC93tyVWaC103o5Behll01Gq/dx5X3E4sn/rg9+ZIKZWsHauu9fQUcW48l
	7Ncw==
X-Gm-Message-State: AOAM533VW8XE/gYQjKuU4+WnN8p1pv+ZTuFeLyvs2W8QDjb0a8UTqfmn
	bUOka8k5doWO4yxWB/CnQsnnRhotOJvqaQNa
X-Google-Smtp-Source: ABdhPJw3bUodW+RhGi398Wcy+/xQ6Z8hHJ8N4zJBTNzvQoIj8+Wkxzwmp4Mqv6brCrwl3QWn6lvhbg==
X-Received: by 2002:a50:bb0d:: with SMTP id y13mr15557101ede.317.1602516387553;
	Mon, 12 Oct 2020 08:26:27 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	p3sm10698425edp.28.2020.10.12.08.26.26
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:27 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:25 +0200
Resent-Message-ID: <20201012152625.GF2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 513 seconds by postgrey-1.31 at mail19;
	Sun, 11 Oct 2020 21:28:47 CEST
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net
	[83.223.78.233])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 182BD42022A
	for <drbd-dev@lists.linbit.com>; Sun, 11 Oct 2020 21:28:47 +0200 (CEST)
Received: from h06.hostsharing.net (h06.hostsharing.net
	[IPv6:2a01:37:1000::53df:5f19:0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 97E8410189E01;
	Sun, 11 Oct 2020 21:20:13 +0200 (CEST)
Received: from mail.home.lxtec.de
	(HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de
	[95.208.10.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by h06.hostsharing.net (Postfix) with ESMTPSA id 75DC1603E049;
	Sun, 11 Oct 2020 21:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
	s=mailxtec;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:reply-to;
	bh=Hkyy/uZNN70/IARHzazoie/SvUZjk4O30WslBaYUdjg=;
	b=jzyi1KE+iJ7zNGTiJOCBp0Y8qs
	vFSX6OUNVoNM3UesDdvAeB6mEEuI5m3/e/RnRYLsnP2f3jlaLV+zcsqtrHHrcI1ApsIKAZVUGcnop
	cU9fTd5mWttrB4czlu39aUOwCf1+yto6EXpniZcPI9LEvD/BVyqaFt9GaKhHsvPFPDFVh2cqnxP8v
	kjK4vkp6ZEuxubcC1IlLOLtovbScLkYTCr1wpzTpnmND0hAG9mynbrkD8U4SqZwr4JDwIzpCrjuY4
	1sIJvW9qeCGDBFdNCqFVyZPD5tfcA3XJm9+s4RbVEhmxRKBNcVNszqaD1cQBwHLw7hWzPQH+cnTtO
	2ncpLepw==;
Received: from [127.0.0.1] (helo=localhost)
	by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
	id 1kRgtA-0004kh-IH; Sun, 11 Oct 2020 21:20:12 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YC4mlgJnPmxd; Sun, 11 Oct 2020 21:20:12 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
	id 1kRgtA-0004kc-DZ; Sun, 11 Oct 2020 21:20:12 +0200
Date: Sun, 11 Oct 2020 21:20:12 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20201011192012.32nul25ez3adzb6q@toy.home.lxtec.de>
Organization: LXTEC
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
	<20201011183930.veucf6z335njrkwe@toy.home.lxtec.de>
	<20201011185117.GA18543@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201011185117.GA18543@wunner.de>
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

* Lukas Wunner <lukas@wunner.de> [2020-10-11 20:51 +0200]:

[...]

> Be aware that with DKMS you have
> to patch the source code in /usr/src, then delete the copy in
> /var/lib/dkms such that it is recreated based on the patched
> source code.

This is what my Debian package does automagic ;-)

Elimar
-- 
  Do you smell something burning or is it me?

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
