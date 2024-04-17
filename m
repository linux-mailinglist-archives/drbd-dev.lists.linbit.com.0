Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FA8A8034
	for <lists+drbd-dev@lfdr.de>; Wed, 17 Apr 2024 11:58:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D9E1642019F;
	Wed, 17 Apr 2024 11:57:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A1D342019F
	for <drbd-dev@lists.linbit.com>; Wed, 17 Apr 2024 11:57:44 +0200 (CEST)
Received: by mail-lj1-f180.google.com with SMTP id
	38308e7fff4ca-2db2f6cb312so5640031fa.2
	for <drbd-dev@lists.linbit.com>; Wed, 17 Apr 2024 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1713347864;
	x=1713952664; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
	:subject:date:message-id:reply-to;
	bh=gcPGVePYnmlxPze9N9W2E5LU30c+ug5Dl1n6RwgpWXM=;
	b=ZeWDfKFuQJvJIk7h+7M8ev0b/fGSa+yIC5GSMHwLjK4MmsyxhdztL9JwMO4h5YfEko
	aBk+15d63wmdO+k/zCT2GHxJH5YM7v1tGQrGY3g5FkmKH0Fqo5Y2BrqYKk5/x4Uti9Kb
	iRfphLSHl+Yk9mxHr1cRU/pOQ+F72Y376d8IwyesX5JssmynaRnxnu9JDNFplvIyWVdy
	17jpeAQflpIlk00dQWmV9R54waQiNrjg6Uz28MR7iHviTnc7Yco2s97JQt0z31H8PEZ2
	mo/YXgn0uMR2E/nheL8yilGJTfl01E3f/YXF4X2Nn+GNdU2AsmKvdOwKnf4P/J/HziMu
	3+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1713347864; x=1713952664;
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=gcPGVePYnmlxPze9N9W2E5LU30c+ug5Dl1n6RwgpWXM=;
	b=S0CdFn9KwRFLd3f4/XMiyjBUE+5u9M2qBtoRmZfrWfiFtuaPNlVTYYgbeCr4KmnjEg
	u7KfqjgU85oKGa1oKnsjROeQ6QJBvbIKD3KnQLBoxdRfna0l6I1fBbVICNnAeIS12tJS
	LQ3eSiEmD9z2bj51S8Xj1XGLbhDm4PBwEpKlYNYdoy0//ZLEMTpO0/3260nlduAUfpO7
	eAkp45b3pwF5dQfl6GNivveppNiAIntJv4RnSUqoG3XarJrzWhigtRH78bxjqkLSNg6C
	FMcfPLRwNz2A/2c6Vua57L/R0EtUe3MZXdQe9tL5GN6TnrAPSokCsnh1prjUTuyWvQSQ
	Q6tQ==
X-Gm-Message-State: AOJu0Yy/01f2V4muIKqfsU1CO++fGLXxmyAm64TnLB+B1gTk0aH81xb0
	AqCydoJaLV2wC5KNcdfjQGyCOsSUD6UEKOmUpqMuJrDeXhFEwBfojiNxWk28a8UU9A==
X-Google-Smtp-Source: AGHT+IGOVZwKJvfhFa91cero4efG1Aq7pFqcjy90z4aWHqTtZ67KbN4QdBkuj9TWfuEAbwhcbXdmmQ==
X-Received: by 2002:a2e:be1a:0:b0:2d8:95de:23ed with SMTP id
	z26-20020a2ebe1a000000b002d895de23edmr14378527ljq.17.1713347863728;
	Wed, 17 Apr 2024 02:57:43 -0700 (PDT)
Received: from grappa.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	r18-20020a170906549200b00a4e98679e7dsm7924921ejo.87.2024.04.17.02.57.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 17 Apr 2024 02:57:43 -0700 (PDT)
Date: Wed, 17 Apr 2024 11:57:41 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: Su Yue <glass.su@suse.com>
Subject: Re: [PATCH 2/2] crm-fence-peer.9.sh: use join of node_state to judge
	whether node is banned
Message-ID: <Zh+dFQrPLM6an2lk@grappa.linbit>
Mail-Followup-To: Su Yue <glass.su@suse.com>, drbd-dev@lists.linbit.com,
	philipp.reisner@linbit.com
References: <20240303091259.5045-1-l@damenly.org>
	<20240303091259.5045-2-l@damenly.org>
	<C2F581E6-5D15-49E7-B944-B79B3C08F252@suse.com>
	<48A9DD72-39A4-4866-B858-E50A33299CEB@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48A9DD72-39A4-4866-B858-E50A33299CEB@suse.com>
Cc: philipp.reisner@linbit.com, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Thu, Mar 14, 2024 at 11:18:22AM +0800, Su Yue wrote:
> 
> 
> > On Mar 7, 2024, at 10:54, Su Yue <glass.su@suse.com> wrote:
> > 
> > Hi, dear drbd folks
> >  Would you help review the patches for drbd-utils? Many thanks!
> > 
> Gentle ping.

So you apparently have some kind of test suite
excercising this fencing handler?

Thank you for making us aware, and for your patience.
Looks plausible.

	Lars

