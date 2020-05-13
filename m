Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD001F8266
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:03:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A520C420400;
	Sat, 13 Jun 2020 12:03:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C0232420400
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:57 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id c3so12241050wru.12
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:references:in-reply-to:from
	:date:message-id:subject:to:cc;
	bh=y3uf4cDEBcGin/ahVjDWwwqBbdeSBPGoaou/iCBc+Ng=;
	b=J7biWoP4MZDk9UG+ucMkWiHXeST3vrxhhkv6cNwHvApuj963z6/OX50G44JeZahODr
	s+SEtTfqIrfkO6vnzCj1TCmcUqHK/7VNBwmnowdwwzINrXyb0Z/wtO8/wk76tz+7TVIV
	2ld5XCOlwuOTuKxK/tkqhauEK+rnl7ZEyJaUrre06VXcpSLpDQXSUhdyWC982yRl1WP+
	jjX+M7hB3Io6C9W1oFbGqr+mhQb5lJ7qBUoEktdqHZPwhMBkf0F7tDfjegdweqo7l5H5
	0b+Pwxt6HEAOyG2lywwJoTwifrjyu8Ecxbp6czlptUBj/czDPLgqiOMaresbfDNu7wbc
	HbAw==
X-Gm-Message-State: AOAM530GFFWjK0wGYBJ6sXgiVGJ8ntrGOIiFkyGHskN7uTbY4kRc6ept
	2AJhNfatutOVB19ffGLo35QKVxYv2ScQYaSZ
X-Google-Smtp-Source: ABdhPJwJpTJ3kQyUA5Q2zeOWP9FHeKQr0pMcEOI0/iU6am3WhGAhKUVjZ/0dkVICUZfehguVoTfmrg==
X-Received: by 2002:adf:9795:: with SMTP id s21mr20498580wrb.166.1592042217302;
	Sat, 13 Jun 2020 02:56:57 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	h15sm13386139wrt.73.2020.06.13.02.56.56
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:56 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:55 +0200
Resent-Message-ID: <20200613095655.GQ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 860F84202F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 20:46:11 +0200 (CEST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D4F09207C4
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 18:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589395541;
	bh=y3uf4cDEBcGin/ahVjDWwwqBbdeSBPGoaou/iCBc+Ng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RLQfxHVcrn6lWhWEu0DDrnMIHIoZ+37WfrxEpZxqiKdV1WCyAtQwcUcFu2SvS2080
	VTE5vGbKGPtkrp13IOlhl2+f6sYzR7NeAlwZhvD/+sHUP7ta5YnAY2Vdmt9jo9N04s
	CEpGnXvJbsQIZi+fuoRT8dDY4nvc1HnFSDyGGc2w=
Received: by mail-lj1-f170.google.com with SMTP id f18so681709lja.13
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 11:45:39 -0700 (PDT)
X-Received: by 2002:a2e:9258:: with SMTP id v24mr280263ljg.109.1589395538071; 
	Wed, 13 May 2020 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
	<20200508161517.252308-13-hch@lst.de>
	<CAPhsuW6_Y53_XLFeVxhTDpTi_PKNLqqnrXLn+M2fJW268eE6_w@mail.gmail.com>
	<20200513183304.GA29895@lst.de>
In-Reply-To: <20200513183304.GA29895@lst.de>
From: Song Liu <song@kernel.org>
Date: Wed, 13 May 2020 11:45:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6pG+-EAa-FW96r+LEP=j1nWEK0Zqk_fJeaAu2Hn9AqeA@mail.gmail.com>
Message-ID: <CAPhsuW6pG+-EAa-FW96r+LEP=j1nWEK0Zqk_fJeaAu2Hn9AqeA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, linux-m68k@lists.linux-m68k.org,
	Philip Kelleher <pjk1939@linux.ibm.com>,
	linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 12/15] md: stop using ->queuedata
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

On Wed, May 13, 2020 at 11:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 13, 2020 at 11:29:17AM -0700, Song Liu wrote:
> > On Fri, May 8, 2020 at 9:17 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Thanks for the cleanup. IIUC, you want this go through md tree?
>
> Yes, please pick it up though the md tree.

Thanks for the clarification. Applied to md-next.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
