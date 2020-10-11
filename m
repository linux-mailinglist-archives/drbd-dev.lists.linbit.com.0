Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE128BBDD
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:29:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69BB44203C3;
	Mon, 12 Oct 2020 17:29:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5D64342034B
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:27:30 +0200 (CEST)
Received: by mail-ed1-f66.google.com with SMTP id p13so17404471edi.7
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:organization:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:autocrypt;
	bh=Am2qRcQAgstTAV6s944OAh/yvd0KHHCjGz1Hw4FCgRs=;
	b=IsGlkcdJLZrgGtifi54LtvKoWSAWGDkKjdCC2al9jwCcyVaZ2I866E4eX7vJIU7kWQ
	pHMYM10xS0nwAz18QBASc6NqTMVjg1y6Mp43t+1pJ258AhPj83y2swqXgQWYCdyRyx0y
	CB0Gh5qAOn58+Bt4naA48GGZj+KVW2Tj4OZ6NyVW1RQhey/B/Iv55l1L0ELpt6xQ9aUT
	RiYzxUl+XlmsP8jHGq6shtO4fMtFnS6FIlM02qydS8WShtvww/f/j82XpX7TM7RCPAao
	A2jpoebTj74CUwSLgjRbqHpCVGe/Z7yTHUKwRJy2D5Xoq5ibAWSCJ0CBa6tSIE3dN9T0
	Vz1w==
X-Gm-Message-State: AOAM530twhnGuh7hFWm36Axoz7n4GpyqJ/XcI/mQB4JXbYsj7YC0/Pg2
	1dhQLQXa8WMWNYtBkpuSs/fl5+ZD7bC0fitT
X-Google-Smtp-Source: ABdhPJxSK5G4cUbMcgT/Ou8bhOz18Ph8mQJUrZsqpoAzNX5TVRFlycavsE96pPckZgmf6EizpccatQ==
X-Received: by 2002:a05:6402:13d7:: with SMTP id
	a23mr14359570edx.352.1602516389680; 
	Mon, 12 Oct 2020 08:26:29 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	r4sm10719453edv.16.2020.10.12.08.26.29
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:26:29 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:26:27 +0200
Resent-Message-ID: <20201012152627.GG2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 474 seconds by postgrey-1.31 at mail19;
	Sun, 11 Oct 2020 21:38:44 CEST
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net
	[83.223.95.204])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 93E9642022A
	for <drbd-dev@lists.linbit.com>; Sun, 11 Oct 2020 21:38:44 +0200 (CEST)
Received: from h06.hostsharing.net (h06.hostsharing.net [83.223.95.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id D66DA101920D6;
	Sun, 11 Oct 2020 21:30:49 +0200 (CEST)
Received: from mail.home.lxtec.de
	(HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de
	[95.208.10.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by h06.hostsharing.net (Postfix) with ESMTPSA id BCBE3603E049;
	Sun, 11 Oct 2020 21:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
	s=mailxtec;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:reply-to;
	bh=Am2qRcQAgstTAV6s944OAh/yvd0KHHCjGz1Hw4FCgRs=;
	b=pTgSZTMqcZ1/VKTvEimdIthPaL
	idElNJddImRCxd99eovKR3m4VsVjI19hDQU8FMrN7M5JjldJ4AP9Uqr5f3ynP1JyBeSD81oS2/sv8
	/xXz4typIJFRyksxF7NdvQR9Riw0ElQh7UXBJGXVyQQFV9+7Z7FCI7yjL5wMf0FNNJa2c9ukfch+U
	3KHgpU0KrTD79AVtbRdnedzm24T08q1xJlH3VAuvoVsHHsEX+ZMLC2TSoepFVOBjfJToZf+/Lab/t
	u3sh2MCVWFCHViFKLJBJg4Nimr7GaY0b0W232XW9dZvLVI7HhYfm4hx+LUsKlEqNzKKZC78mRfe1z
	1HfbpjOQ==;
Received: from [127.0.0.1] (helo=localhost)
	by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
	id 1kRh3Q-0005KR-Ql; Sun, 11 Oct 2020 21:30:48 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sX2qgvqQ9RUf; Sun, 11 Oct 2020 21:30:48 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
	id 1kRh3Q-0005KM-M4; Sun, 11 Oct 2020 21:30:48 +0200
Date: Sun, 11 Oct 2020 21:30:48 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20201011193048.rfe5qvuba2ovrwed@toy.home.lxtec.de>
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

> The patch worked for me with v5.3.

Did you build with brdb master? I used tag 9.0.25-1.

Elimar
-- 
  Never make anything simple and efficient when a way
  can be found to make it complex and wonderful ;-)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
