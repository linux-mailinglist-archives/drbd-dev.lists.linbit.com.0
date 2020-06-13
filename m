Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D571F8249
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:55:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 415904203E1;
	Sat, 13 Jun 2020 11:55:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AE444203D2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:55:09 +0200 (CEST)
Received: by mail-wm1-f51.google.com with SMTP id q25so10172417wmj.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:mime-version
	:content-disposition:user-agent;
	bh=GfFz5qqIVFhhT331sIwa39RCyCOayEEjP4dvAM9TD2c=;
	b=HW8hCB75hQn8rKvNPg04trjfwbKbTUWL1mr/yO4WdFm913T8cOqFKU2pAAe/brlzYq
	yE11h3+3KD3/6SgFQbzQcDRf7nlBvMy+iSZgtlRMz+8XJb34RzkekHTF6HNFDGa5O/Tr
	KexgknAi0shnQaLqPoTlGfeSy8yxqFFZIBrUQPg2k/KVJNjl6UvP6gIy7eLSWzISMHG8
	Id+22BS4a8F2VMglEh7HEp5s6XsvvUsFmrt7c8LHe/Y/jK+wFPhIGF6U8xME7GJ+6+WP
	i0byTk/k1mIdXoc5ZCsIhHdT7ZktsiOr3wOdCbVsHuIQGgOiCDHLCc0dK2A2sJQsIaqm
	IYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:mime-version:content-disposition:user-agent;
	bh=GfFz5qqIVFhhT331sIwa39RCyCOayEEjP4dvAM9TD2c=;
	b=AIF9nu8hXOi6/sSLWl2kxwSyfFn3+aYNLI1EE4ANgqKGdzMGjVqCPrf/hLPkcilAvF
	AVMZM6qRWScnx3plrMdI3FdDf+PsbBUSDaIe6+w6tS01ZjqI1159mCM9Ceet2aVRpYCX
	zuH9c10P0sIHbrWcnDXosp5pK92Y0Ufw47Ovvjzo55QWrXEj20D5sa9/2PKyHzlGO5Cm
	zR5iNd0JEJ5afw7QNblGvGuIY3sxBrAHkoiuLbJttKcJkbNBiRuuGhIexqPcTLpWKppv
	q4QLupDV9XNCVHYMLRCyJGGDtVJJ9hem1eSK1BuC6asVew+6RAu+cuRCOB8+XmH7CutI
	s0Dw==
X-Gm-Message-State: AOAM531Y6KbqvKvSSOe4pJf6EvovnIxZTl+kHhxjEZQPy1o3Z0/k0krV
	wdJeCfH026d+8ls10JPsORshUTmBt1/YkA==
X-Google-Smtp-Source: ABdhPJwM4fOVrva6QEHVSN1gaSN6eownR8XBt35S29dI6IsKVUT1UhXWyjAkdspLV4WlPdPtk4G1xg==
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr3219406wmg.136.1592042108609; 
	Sat, 13 Jun 2020 02:55:08 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c6sm14072016wro.92.2020.06.13.02.55.07
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:55:08 -0700 (PDT)
Date: Sat, 13 Jun 2020 11:55:06 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20200613095506.GA4222@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Drbd-dev] Heads up,
 releasing of "queued up" held messages from the moderation queue
 will follow shortly.
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


Usually, most of what ends up in "hold" is spam :-/

I neglegted moderation for too long,
so did not notice there where so many legit posts queued up.

I sill want them in the archives, though.
Sorry for the burst now.

    Lars

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
