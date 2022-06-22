Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C1202555129
	for <lists+drbd-dev@lfdr.de>; Wed, 22 Jun 2022 18:18:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 54B80420621;
	Wed, 22 Jun 2022 18:18:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 455 seconds by postgrey-1.31 at mail19;
	Wed, 22 Jun 2022 18:18:38 CEST
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
	[96.44.175.130])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2036E420471
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jun 2022 18:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655914261;
	bh=nk8KgKas3epfldKU7z9t5qNljsGwrlSJR6Zhs5ksWy8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=R442PcJgjRtmfPMfST6Kcvdi3cLfWLqFefLyBb0duzfkUT1x8zoJZvWHv5b2gQXHj
	Is+2cc/HPrWGRcZTXw5eMUYiSZvzrWaaRsbOk/r8bYPy2Cacq8jEM+hqW12MFTtIkL
	IPtm2iuNf6UHakuVvWotNJptWKcx3dB3BJcUGqiA=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 263AB1281161; 
	Wed, 22 Jun 2022 12:11:01 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JpddjhKFjdPk; Wed, 22 Jun 2022 12:11:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655914260;
	bh=nk8KgKas3epfldKU7z9t5qNljsGwrlSJR6Zhs5ksWy8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hV7mle7hQJe5qKTo/ItJN7oX2BC6bF3o6SJwgQ167QmnfnIVxQr1qzuxEXoO55iMj
	A6bKzdI38bHn/5+ICcj54L4UiQ/5EEyEI7BFSgfo2NSOB28tG1JUs2EnrQPuvEyOHU
	j/tywTRiO2ubZKgWjoNc1PyyEAyoB/VqAHtE+MzU=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown
	[IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	219121280DD8; Wed, 22 Jun 2022 12:11:00 -0400 (EDT)
Message-ID: <49a877f33a088edc232eb98029e46e53884c5cd6.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, axboe@kernel.dk
Date: Wed, 22 Jun 2022 12:10:59 -0400
In-Reply-To: <20220622155220.8704-1-jiangjian@cdjrlc.com>
References: <20220622155220.8704-1-jiangjian@cdjrlc.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: drbd: drbd_state: Fix typo in comments
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

On Wed, 2022-06-22 at 23:52 +0800, Jiang Jian wrote:
> Replace 'is' with 'it'
> 
> file: drivers/block/drbd/drbd_state.c
> line: 1900
> 
> * But is is still not save to dreference ldev here, since
> 
> changed to:
> 
> * But it is still not save to dreference ldev here, since

I honestly don't think spelling and grammar updates to comments provide
much value.  However, there's no value at all if it's still two
spelling errors in that one line after the proposed patch ...

James


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
